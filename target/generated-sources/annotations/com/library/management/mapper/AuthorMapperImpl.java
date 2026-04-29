package com.library.management.mapper;

import com.library.management.dto.AuthorDto;
import com.library.management.entity.AuthorDao;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2026-04-29T02:12:37+0530",
    comments = "version: 1.5.5.Final, compiler: javac, environment: Java 17.0.18 (Microsoft)"
)
@Component
public class AuthorMapperImpl implements AuthorMapper {

    @Override
    public AuthorDto toDto(AuthorDao authorDao) {
        if ( authorDao == null ) {
            return null;
        }

        AuthorDto authorDto = new AuthorDto();

        authorDto.setId( authorDao.getId() );
        authorDto.setFirstName( authorDao.getFirstName() );
        authorDto.setMiddleName( authorDao.getMiddleName() );
        authorDto.setLastName( authorDao.getLastName() );
        authorDto.setEmail( authorDao.getEmail() );
        authorDto.setPhone( authorDao.getPhone() );
        authorDto.setDob( authorDao.getDob() );
        authorDto.setAge( authorDao.getAge() );
        authorDto.setImageUrl( authorDao.getImageUrl() );
        authorDto.setBiography( authorDao.getBiography() );

        return authorDto;
    }

    @Override
    public AuthorDao toDao(AuthorDto authorDto) {
        if ( authorDto == null ) {
            return null;
        }

        AuthorDao authorDao = new AuthorDao();

        authorDao.setId( authorDto.getId() );
        authorDao.setFirstName( authorDto.getFirstName() );
        authorDao.setMiddleName( authorDto.getMiddleName() );
        authorDao.setLastName( authorDto.getLastName() );
        authorDao.setEmail( authorDto.getEmail() );
        authorDao.setPhone( authorDto.getPhone() );
        authorDao.setDob( authorDto.getDob() );
        authorDao.setImageUrl( authorDto.getImageUrl() );
        authorDao.setBiography( authorDto.getBiography() );

        return authorDao;
    }

    @Override
    public AuthorDao update(AuthorDto authorDto, AuthorDao authorDao) {
        if ( authorDto == null ) {
            return authorDao;
        }

        if ( authorDto.getFirstName() != null ) {
            authorDao.setFirstName( authorDto.getFirstName() );
        }
        if ( authorDto.getMiddleName() != null ) {
            authorDao.setMiddleName( authorDto.getMiddleName() );
        }
        if ( authorDto.getLastName() != null ) {
            authorDao.setLastName( authorDto.getLastName() );
        }
        if ( authorDto.getEmail() != null ) {
            authorDao.setEmail( authorDto.getEmail() );
        }
        if ( authorDto.getPhone() != null ) {
            authorDao.setPhone( authorDto.getPhone() );
        }
        if ( authorDto.getDob() != null ) {
            authorDao.setDob( authorDto.getDob() );
        }
        if ( authorDto.getImageUrl() != null ) {
            authorDao.setImageUrl( authorDto.getImageUrl() );
        }
        if ( authorDto.getBiography() != null ) {
            authorDao.setBiography( authorDto.getBiography() );
        }

        return authorDao;
    }
}
