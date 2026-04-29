package com.library.management.service;

import com.library.management.dto.BookDto;
import com.library.management.entity.AuthorDao;
import com.library.management.entity.BookDao;
import com.library.management.mapper.BookMapper;
import com.library.management.repository.AuthorRepository;
import com.library.management.repository.BookRepository;
import com.library.management.repository.CategoryRepository;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.UUID;

@Service
public class BookService {

    private final BookRepository bookRepository;
    private final BookMapper bookMapper;
    private final CategoryRepository categoryRepository;
    private final AuthorRepository authorRepository;

    public BookService(BookRepository bookRepository, BookMapper bookMapper,
                       CategoryRepository categoryRepository,
                       AuthorRepository authorRepository) {
        this.bookRepository = bookRepository;
        this.bookMapper = bookMapper;
        this.categoryRepository = categoryRepository;
        this.authorRepository = authorRepository;
    }

    public BookDto createBook(BookDto bookDto) {
        BookDao bookDao = bookMapper.toDao(bookDto);

        if (bookDto.getCategoryId() != null) {
            categoryRepository.findById(bookDto.getCategoryId())
                    .ifPresent(bookDao::setCategoryDao);
        }

        if (bookDto.getAuthorIds() != null && !bookDto.getAuthorIds().isEmpty()) {
            List<AuthorDao> authors = authorRepository.findAllById(bookDto.getAuthorIds());
            bookDao.setAuthors(new HashSet<>(authors));
        }

        BookDao savedBook = bookRepository.save(bookDao);
        return bookMapper.toDto(savedBook);
    }

    public List<BookDto> getAllBooks() {
        return bookRepository.getAllBooksWithAuthor()
                .stream()
                .map(bookMapper::toDto)
                .toList();
    }

    public BookDto getBookById(UUID id) {
        BookDao bookDao = bookRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Book not found"));

        return bookMapper.toDto(bookDao);
    }

    public BookDto deleteBookByid(UUID id) {
        BookDao bookDao = bookRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Book not found"));

        bookRepository.delete(bookDao);
        return bookMapper.toDto(bookDao);
    }

    public BookDto updateBook(UUID id, BookDto myBook) {
        BookDao bookDao = bookRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Book not found"));

        bookMapper.update(myBook, bookDao);

        if (myBook.getCategoryId() != null) {
            categoryRepository.findById(myBook.getCategoryId())
                    .ifPresent(bookDao::setCategoryDao);
        }

        if (myBook.getAuthorIds() != null && !myBook.getAuthorIds().isEmpty()) {
            List<com.library.management.entity.AuthorDao> authors = authorRepository.findAllById(myBook.getAuthorIds());
            bookDao.setAuthors(new java.util.HashSet<>(authors));
        }

        BookDao updatedBook = bookRepository.save(bookDao);
        return bookMapper.toDto(updatedBook);
    }

    public List<BookDto> getBooksByAuthor(UUID id) {
        return bookRepository.getBookByAuthorId(id).stream().map(bookMapper::toDto).toList();
    }

    public List<BookDto> searchBooks(String title, UUID authorId, UUID categoryId) {
        return bookRepository.searchBooks(title, authorId, categoryId).stream().map(bookMapper::toDto).toList();
    }
}
