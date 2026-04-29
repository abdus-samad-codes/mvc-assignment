package com.library.management.repository;

import com.library.management.entity.AuthorDao;
import com.library.management.entity.BookDao;
import com.library.management.entity.CategoryDao;
import com.library.management.enums.CategoryName;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.ActiveProfiles;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.*;

@DataJpaTest
@ActiveProfiles("test")
public class BookRepositoryTest {

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private AuthorRepository authorRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    private AuthorDao author;
    private CategoryDao category;
    private BookDao book;

    @BeforeEach
    void setUp() {

        // AUTHOR
        author = new AuthorDao();
        author.setFirstName("Test");
        author.setLastName("Author");
        author.setEmail("author@example.com");
        author.setPhone("1111111111");
        author.setDob(LocalDate.of(1980, 1, 1));
        author = authorRepository.saveAndFlush(author);

        // CATEGORY
        category = new CategoryDao();
        category = categoryRepository.findAll()
                .stream()
                .findFirst()
                .orElseGet(() -> {
                    CategoryDao newCategory = new CategoryDao();
                    newCategory.setName(CategoryName.SCIENCE);
                    return categoryRepository.saveAndFlush(newCategory);
                });
        category = categoryRepository.saveAndFlush(category);

        // BOOK
        book = new BookDao();
        book.setTitle("Test Book Title");
        book.setIsbn("1234567890");
        book.setPublisher("Test Publisher"); // safer
        book.setPublishDate(LocalDate.now()); // safer

        book.setCategoryDao(category);
        book.setAuthors(Set.of(author));

        book = bookRepository.saveAndFlush(book);
    }

    @Test
    void checkBookById_ShouldReturnBook() {
        Optional<BookDao> result = bookRepository.checkBookById(book.getId());
        assertTrue(result.isPresent());
        assertEquals(book.getTitle(), result.get().getTitle());
    }

    @Test
    void getBookByAuthorId_ShouldReturnBooks() {
        List<BookDao> result = bookRepository.getBookByAuthorId(author.getId());
        assertFalse(result.isEmpty());
        assertEquals(1, result.size());
        assertEquals(book.getTitle(), result.get(0).getTitle());
    }

    @Test
    void searchBooks_ByTitle_ShouldReturnBooks() {
        List<BookDao> result = bookRepository.searchBooks("Test", null, null);
        assertFalse(result.isEmpty());
        assertEquals(1, result.size());
    }

    @Test
    void searchBooks_ByAuthorId_ShouldReturnBooks() {
        List<BookDao> result = bookRepository.searchBooks(null, author.getId(), null);
        assertFalse(result.isEmpty());
        assertEquals(1, result.size());
    }

    @Test
    void searchBooks_ByCategoryId_ShouldReturnBooks() {
        List<BookDao> result = bookRepository.searchBooks(null, null, category.getId());
        assertFalse(result.isEmpty());
        assertEquals(1, result.size());
    }

    @Test
    void searchBooks_ByAllCriteria_ShouldReturnBooks() {
        List<BookDao> result = bookRepository.searchBooks("Test", author.getId(), category.getId());
        assertFalse(result.isEmpty());
        assertEquals(1, result.size());
    }
}
