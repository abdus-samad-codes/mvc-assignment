package com.library.management.service;

import com.library.management.dto.BookDto;
import com.library.management.entity.AuthorDao;
import com.library.management.entity.BookDao;
import com.library.management.entity.CategoryDao;
import com.library.management.mapper.BookMapper;
import com.library.management.repository.AuthorRepository;
import com.library.management.repository.BookRepository;
import com.library.management.repository.CategoryRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class BookServiceTest {

    @Mock
    private BookRepository bookRepository;

    @Mock
    private BookMapper bookMapper;

    @Mock
    private CategoryRepository categoryRepository;

    @Mock
    private AuthorRepository authorRepository;

    @InjectMocks
    private BookService bookService;

    private BookDao bookDao;
    private BookDto bookDto;
    private UUID bookId;
    private UUID categoryId;
    private List<UUID> authorIds;

    @BeforeEach
    void setUp() {
        bookId = UUID.randomUUID();
        categoryId = UUID.randomUUID();
        authorIds = List.of(UUID.randomUUID());

        bookDao = new BookDao();
        bookDao.setId(bookId);
        bookDao.setTitle("Test Book");

        bookDto = new BookDto();
        bookDto.setId(bookId);
        bookDto.setTitle("Test Book");
        bookDto.setCategoryId(categoryId);
        bookDto.setAuthorIds(authorIds);
    }

    @Test
    void createBook_ShouldReturnBookDto() {
        CategoryDao categoryDao = new CategoryDao();
        categoryDao.setId(categoryId);
        AuthorDao authorDao = new AuthorDao();
        authorDao.setId(authorIds.get(0));
        List<AuthorDao> authors = List.of(authorDao);

        when(bookMapper.toDao(bookDto)).thenReturn(bookDao);
        when(categoryRepository.findById(categoryId)).thenReturn(Optional.of(categoryDao));
        when(authorRepository.findAllById(authorIds)).thenReturn(authors);
        when(bookRepository.save(bookDao)).thenReturn(bookDao);
        when(bookMapper.toDto(bookDao)).thenReturn(bookDto);

        BookDto result = bookService.createBook(bookDto);

        assertNotNull(result);
        assertEquals(bookDto.getTitle(), result.getTitle());
        verify(bookRepository, times(1)).save(bookDao);
    }

    @Test
    void getAllBooks_ShouldReturnListOfBookDtos() {
        List<BookDao> books = List.of(bookDao);
        when(bookRepository.findAll()).thenReturn(books);
        when(bookMapper.toDto(bookDao)).thenReturn(bookDto);

        List<BookDto> result = bookService.getAllBooks();

        assertNotNull(result);
        assertEquals(1, result.size());
        verify(bookRepository, times(1)).findAll();
    }

    @Test
    void getBookById_WhenBookExists_ShouldReturnBookDto() {
        when(bookRepository.findById(bookId)).thenReturn(Optional.of(bookDao));
        when(bookMapper.toDto(bookDao)).thenReturn(bookDto);

        BookDto result = bookService.getBookById(bookId);

        assertNotNull(result);
        assertEquals(bookId, result.getId());
    }

    @Test
    void getBookById_WhenBookDoesNotExist_ShouldThrowException() {
        when(bookRepository.findById(bookId)).thenReturn(Optional.empty());

        RuntimeException exception = assertThrows(RuntimeException.class, () -> {
            bookService.getBookById(bookId);
        });

        assertEquals("Book not found", exception.getMessage());
    }

    @Test
    void deleteBookById_WhenBookExists_ShouldDeleteAndReturnBookDto() {
        when(bookRepository.findById(bookId)).thenReturn(Optional.of(bookDao));
        when(bookMapper.toDto(bookDao)).thenReturn(bookDto);

        BookDto result = bookService.deleteBookByid(bookId);

        assertNotNull(result);
        verify(bookRepository, times(1)).delete(bookDao);
    }

    @Test
    void updateBook_WhenBookExists_ShouldUpdateAndReturnBookDto() {
        when(bookRepository.findById(bookId)).thenReturn(Optional.of(bookDao));
        when(bookMapper.update(bookDto, bookDao)).thenReturn(bookDao);
        when(bookRepository.save(bookDao)).thenReturn(bookDao);
        when(bookMapper.toDto(bookDao)).thenReturn(bookDto);

        BookDto result = bookService.updateBook(bookId, bookDto);

        assertNotNull(result);
        verify(bookRepository, times(1)).save(bookDao);
    }

    @Test
    void getBooksByAuthor_ShouldReturnListOfBookDtos() {
        UUID authorId = UUID.randomUUID();
        when(bookRepository.getBookByAuthorId(authorId)).thenReturn(List.of(bookDao));
        when(bookMapper.toDto(bookDao)).thenReturn(bookDto);

        List<BookDto> result = bookService.getBooksByAuthor(authorId);

        assertNotNull(result);
        assertEquals(1, result.size());
    }

    @Test
    void searchBooks_ShouldReturnListOfBookDtos() {
        String title = "Test";
        when(bookRepository.searchBooks(title, authorIds.get(0), categoryId)).thenReturn(List.of(bookDao));
        when(bookMapper.toDto(bookDao)).thenReturn(bookDto);

        List<BookDto> result = bookService.searchBooks(title, authorIds.get(0), categoryId);

        assertNotNull(result);
        assertEquals(1, result.size());
    }
}
