package com.library.management.mapper;

import com.library.management.dto.AuthorDto;
import com.library.management.entity.AuthorDao;
import org.mapstruct.*;

@Mapper(componentModel = "spring")
public interface AuthorMapper {

    AuthorDto toDto(AuthorDao authorDao);

    @Mapping(target = "books", ignore = true)
    AuthorDao toDao(AuthorDto authorDto);

    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "books", ignore = true)
    AuthorDao update(AuthorDto authorDto, @MappingTarget AuthorDao authorDao);
}