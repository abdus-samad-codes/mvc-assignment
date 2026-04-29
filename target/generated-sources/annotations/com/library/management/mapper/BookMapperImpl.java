package com.library.management.mapper;

import com.library.management.dto.BookDto;
import com.library.management.entity.BookDao;
import com.library.management.entity.CategoryDao;
import com.library.management.enums.CategoryName;
import java.util.UUID;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2026-04-29T20:16:17+0530",
    comments = "version: 1.5.5.Final, compiler: javac, environment: Java 17.0.18 (Microsoft)"
)
@Component
public class BookMapperImpl implements BookMapper {

    @Override
    public BookDto toDto(BookDao bookDao) {
        if ( bookDao == null ) {
            return null;
        }

        BookDto bookDto = new BookDto();

        bookDto.setCategoryId( bookDaoCategoryDaoId( bookDao ) );
        bookDto.setCategoryName( bookDaoCategoryDaoNameValue( bookDao ) );
        bookDto.setId( bookDao.getId() );
        bookDto.setTitle( bookDao.getTitle() );
        bookDto.setIsbn( bookDao.getIsbn() );
        bookDto.setPublisher( bookDao.getPublisher() );
        bookDto.setPublishDate( bookDao.getPublishDate() );
        bookDto.setDescription( bookDao.getDescription() );
        bookDto.setTotalCopies( bookDao.getTotalCopies() );
        bookDto.setAvailableCopies( bookDao.getAvailableCopies() );
        bookDto.setShelfLocation( bookDao.getShelfLocation() );
        bookDto.setPages( bookDao.getPages() );
        bookDto.setImageUrl( bookDao.getImageUrl() );

        setAuthorDetails( bookDao, bookDto );

        return bookDto;
    }

    @Override
    public BookDao toDao(BookDto bookDto) {
        if ( bookDto == null ) {
            return null;
        }

        BookDao bookDao = new BookDao();

        bookDao.setId( bookDto.getId() );
        bookDao.setTitle( bookDto.getTitle() );
        bookDao.setIsbn( bookDto.getIsbn() );
        bookDao.setPublisher( bookDto.getPublisher() );
        bookDao.setPublishDate( bookDto.getPublishDate() );
        bookDao.setDescription( bookDto.getDescription() );
        bookDao.setTotalCopies( bookDto.getTotalCopies() );
        bookDao.setAvailableCopies( bookDto.getAvailableCopies() );
        bookDao.setShelfLocation( bookDto.getShelfLocation() );
        bookDao.setPages( bookDto.getPages() );
        bookDao.setImageUrl( bookDto.getImageUrl() );

        return bookDao;
    }

    @Override
    public BookDao update(BookDto bookDto, BookDao bookDao) {
        if ( bookDto == null ) {
            return bookDao;
        }

        if ( bookDto.getTitle() != null ) {
            bookDao.setTitle( bookDto.getTitle() );
        }
        if ( bookDto.getIsbn() != null ) {
            bookDao.setIsbn( bookDto.getIsbn() );
        }
        if ( bookDto.getPublisher() != null ) {
            bookDao.setPublisher( bookDto.getPublisher() );
        }
        if ( bookDto.getPublishDate() != null ) {
            bookDao.setPublishDate( bookDto.getPublishDate() );
        }
        if ( bookDto.getDescription() != null ) {
            bookDao.setDescription( bookDto.getDescription() );
        }
        if ( bookDto.getTotalCopies() != null ) {
            bookDao.setTotalCopies( bookDto.getTotalCopies() );
        }
        if ( bookDto.getAvailableCopies() != null ) {
            bookDao.setAvailableCopies( bookDto.getAvailableCopies() );
        }
        if ( bookDto.getShelfLocation() != null ) {
            bookDao.setShelfLocation( bookDto.getShelfLocation() );
        }
        if ( bookDto.getPages() != null ) {
            bookDao.setPages( bookDto.getPages() );
        }
        if ( bookDto.getImageUrl() != null ) {
            bookDao.setImageUrl( bookDto.getImageUrl() );
        }

        return bookDao;
    }

    private UUID bookDaoCategoryDaoId(BookDao bookDao) {
        if ( bookDao == null ) {
            return null;
        }
        CategoryDao categoryDao = bookDao.getCategoryDao();
        if ( categoryDao == null ) {
            return null;
        }
        UUID id = categoryDao.getId();
        if ( id == null ) {
            return null;
        }
        return id;
    }

    private String bookDaoCategoryDaoNameValue(BookDao bookDao) {
        if ( bookDao == null ) {
            return null;
        }
        CategoryDao categoryDao = bookDao.getCategoryDao();
        if ( categoryDao == null ) {
            return null;
        }
        CategoryName name = categoryDao.getName();
        if ( name == null ) {
            return null;
        }
        String value = name.getValue();
        if ( value == null ) {
            return null;
        }
        return value;
    }
}
