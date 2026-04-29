package com.library.management.service;

import com.library.management.dto.AuthorDto;
import com.library.management.entity.AuthorDao;
import com.library.management.mapper.AuthorMapper;
import com.library.management.repository.AuthorRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class AuthorService {

    private final AuthorRepository authorRepository;
    private final AuthorMapper authorMapper;

    public AuthorService(AuthorRepository authorRepository, AuthorMapper authorMapper) {
        this.authorRepository = authorRepository;
        this.authorMapper = authorMapper;
    }


    public List<AuthorDto> getAllAuthors() {

        //database -> returned by authorRepo
        //type -> authorDao -> inside a list
        List<AuthorDao> authors = authorRepository.findAll();

        List<AuthorDto> response = new ArrayList<>();

        //conversion -> form author dao to author dto
        for (AuthorDao author : authors) {
            AuthorDto authorDto = authorMapper.toDto(author);
            //list me add
            response.add(authorDto);
        }

        //convert to author dto  then send.
        return response;

    }

    public AuthorDto createAuthor(AuthorDto authorDto) {
        //check if author is already present how?
        //ans: duplicate email and phone number.

        //check 1 by phone or email -> if present throw error author already present
        //if data is being returned from here then it is guaranteed that , an author already has this email or phone
        List<AuthorDao> authorList = authorRepository.getByEmailOrPhone(authorDto.getEmail(), authorDto.getPhone());

        if (!authorList.isEmpty()) {
            throw new RuntimeException("Author already exists"); //no need to add new author
        }

        //need to add new author
        //convert
        AuthorDao newAuthor = authorMapper.toDao(authorDto);

        //save to db
        return authorMapper.toDto(authorRepository.save(newAuthor));
    }

    public AuthorDto deleteAuthor(UUID authorId) {
        //delete by this author id
        //to check if author exist or not
        Optional<AuthorDao> author = authorRepository.findById(authorId);

        if (author.isEmpty()) {
            throw new RuntimeException("Author not found");
        }
        authorRepository.delete(author.get()); //entity manager
        return authorMapper.toDto(author.get()); //convert before sending

    }

    public AuthorDto updateAuthor(UUID authorId, AuthorDto authorDto) {

        Optional<AuthorDao> author = authorRepository.findById(authorId); //search

        if (author.isEmpty()) {
            throw new RuntimeException("Author not found");
        }
        AuthorDao toUpdate = authorMapper.update(authorDto, author.get());

        AuthorDao savedAuthor = authorRepository.save(toUpdate);
        return authorMapper.toDto(savedAuthor);
    }

    public AuthorDto getAuthorById(UUID id) {
        AuthorDao authorDao = authorRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Author not found"));

        return authorMapper.toDto(authorDao);
    }
}
