package com.library.management.mapper;

import com.library.management.dto.BookDto;
import com.library.management.entity.AuthorDao;
import com.library.management.entity.BookDao;
import org.mapstruct.*;

import java.util.stream.Collectors;

@Mapper(componentModel = "spring")
public interface BookMapper {

    @Mapping(target = "categoryId", source = "categoryDao.id")
    @Mapping(target = "categoryName", source = "categoryDao.name.value")
    @Mapping(target = "authorNames", ignore = true)
    @Mapping(target = "authorIds", ignore = true)
    BookDto toDto(BookDao bookDao);

    @Mapping(target = "authors", ignore = true)
    @Mapping(target = "categoryDao", ignore = true)
    BookDao toDao(BookDto bookDto);

    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "authors", ignore = true)
    @Mapping(target = "categoryDao", ignore = true)
    BookDao update(BookDto bookDto, @MappingTarget BookDao bookDao);

    @AfterMapping
    default void setAuthorDetails(BookDao bookDao, @MappingTarget BookDto bookDto) {
        if (bookDao.getAuthors() == null) {
            return;
        }

        bookDto.setAuthorNames(
                bookDao.getAuthors()
                        .stream()
                        .map(author -> {
                            String firstName = author.getFirstName() != null ? author.getFirstName() : "";
                            String middleName = author.getMiddleName() != null ? author.getMiddleName() : "";
                            String lastName = author.getLastName() != null ? author.getLastName() : "";
                            return (firstName + " " + middleName + " " + lastName).trim();
                        })
                        .collect(Collectors.toList())
        );

        bookDto.setAuthorIds(
                bookDao.getAuthors()
                        .stream()
                        .map(AuthorDao::getId)
                        .collect(Collectors.toList())
        );
    }
}