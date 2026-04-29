package com.library.management.service;

import com.library.management.dto.AuthorDto;
import com.library.management.entity.AuthorDao;
import com.library.management.mapper.AuthorMapper;
import com.library.management.repository.AuthorRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class AuthorServiceTest {

    @Mock
    private AuthorRepository authorRepository;

    @Mock
    private AuthorMapper authorMapper;

    @InjectMocks
    private AuthorService authorService;

    private AuthorDao authorDao;
    private AuthorDto authorDto;
    private UUID authorId;

    @BeforeEach
    void setUp() {
        authorId = UUID.randomUUID();
        authorDao = new AuthorDao();
        authorDao.setId(authorId);
        authorDao.setFirstName("John");
        authorDao.setLastName("Doe");
        authorDao.setEmail("john.doe@example.com");
        authorDao.setPhone("1234567890");
        authorDao.setDob(LocalDate.of(1990, 1, 1));

        authorDto = new AuthorDto();
        authorDto.setId(authorId);
        authorDto.setFirstName("John");
        authorDto.setLastName("Doe");
        authorDto.setEmail("john.doe@example.com");
        authorDto.setPhone("1234567890");
        authorDto.setDob(LocalDate.of(1990, 1, 1));
    }

    @Test
    void getAllAuthors_ShouldReturnListOfAuthorDtos() {
        List<AuthorDao> authors = List.of(authorDao);
        when(authorRepository.findAll()).thenReturn(authors);
        when(authorMapper.toDto(authorDao)).thenReturn(authorDto);

        List<AuthorDto> result = authorService.getAllAuthors();

        assertNotNull(result);
        assertEquals(1, result.size());
        assertEquals(authorDto.getEmail(), result.get(0).getEmail());
        verify(authorRepository, times(1)).findAll();
    }

    @Test
    void createAuthor_WhenAuthorDoesNotExist_ShouldCreateAndReturnAuthorDto() {
        when(authorRepository.getByEmailOrPhone(authorDto.getEmail(), authorDto.getPhone()))
                .thenReturn(new ArrayList<>());
        when(authorMapper.toDao(authorDto)).thenReturn(authorDao);
        when(authorRepository.save(authorDao)).thenReturn(authorDao);
        when(authorMapper.toDto(authorDao)).thenReturn(authorDto);

        AuthorDto result = authorService.createAuthor(authorDto);

        assertNotNull(result);
        assertEquals(authorDto.getEmail(), result.getEmail());
        verify(authorRepository, times(1)).save(authorDao);
    }

    @Test
    void createAuthor_WhenAuthorAlreadyExists_ShouldThrowException() {
        when(authorRepository.getByEmailOrPhone(authorDto.getEmail(), authorDto.getPhone()))
                .thenReturn(List.of(authorDao));

        RuntimeException exception = assertThrows(RuntimeException.class, () -> {
            authorService.createAuthor(authorDto);
        });

        assertEquals("Author already exists", exception.getMessage());
        verify(authorRepository, never()).save(any());
    }

    @Test
    void getAuthorById_WhenAuthorExists_ShouldReturnAuthorDto() {
        when(authorRepository.findById(authorId)).thenReturn(Optional.of(authorDao));
        when(authorMapper.toDto(authorDao)).thenReturn(authorDto);

        AuthorDto result = authorService.getAuthorById(authorId);

        assertNotNull(result);
        assertEquals(authorId, result.getId());
    }

    @Test
    void getAuthorById_WhenAuthorDoesNotExist_ShouldThrowException() {
        when(authorRepository.findById(authorId)).thenReturn(Optional.empty());

        RuntimeException exception = assertThrows(RuntimeException.class, () -> {
            authorService.getAuthorById(authorId);
        });

        assertEquals("Author not found", exception.getMessage());
    }

    @Test
    void deleteAuthor_WhenAuthorExists_ShouldDeleteAndReturnAuthorDto() {
        when(authorRepository.findById(authorId)).thenReturn(Optional.of(authorDao));
        when(authorMapper.toDto(authorDao)).thenReturn(authorDto);

        AuthorDto result = authorService.deleteAuthor(authorId);

        assertNotNull(result);
        verify(authorRepository, times(1)).delete(authorDao);
    }

    @Test
    void updateAuthor_WhenAuthorExists_ShouldUpdateAndReturnAuthorDto() {
        when(authorRepository.findById(authorId)).thenReturn(Optional.of(authorDao));
        when(authorMapper.update(authorDto, authorDao)).thenReturn(authorDao);
        when(authorRepository.save(authorDao)).thenReturn(authorDao);
        when(authorMapper.toDto(authorDao)).thenReturn(authorDto);

        AuthorDto result = authorService.updateAuthor(authorId, authorDto);

        assertNotNull(result);
        verify(authorRepository, times(1)).save(authorDao);
    }
}
