package com.library.management.repository;

import com.library.management.entity.AuthorDao;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.ActiveProfiles;

import java.time.LocalDate;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@DataJpaTest
@ActiveProfiles("test")
class AuthorRepositoryTest {

    @Autowired
    private AuthorRepository authorRepository;

    @Test
    @DisplayName("Should return author when email matches")
    void getByEmailOrPhone_WhenEmailMatches_ShouldReturnAuthor() {
        AuthorDao author = createAuthor(
                "John",
                "Doe",
                "john@example.com",
                "1234567890"
        );

        authorRepository.saveAndFlush(author);

        List<AuthorDao> result = authorRepository
                .getByEmailOrPhone("john@example.com", "0000000000");

        assertFalse(result.isEmpty());
        assertEquals("john@example.com", result.get(0).getEmail());
    }

    @Test
    @DisplayName("Should return author when phone matches")
    void getByEmailOrPhone_WhenPhoneMatches_ShouldReturnAuthor() {
        AuthorDao author = createAuthor(
                "Jane",
                "Doe",
                "jane@example.com",
                "0987654321"
        );

        authorRepository.saveAndFlush(author);

        List<AuthorDao> result = authorRepository
                .getByEmailOrPhone("wrong@example.com", "0987654321");

        assertFalse(result.isEmpty());
        assertEquals("0987654321", result.get(0).getPhone());
    }

    @Test
    @DisplayName("Should return empty list when no email or phone matches")
    void getByEmailOrPhone_WhenNoMatch_ShouldReturnEmptyList() {
        List<AuthorDao> result = authorRepository
                .getByEmailOrPhone("nonexistent@example.com", "0000000000");

        assertNotNull(result);
        assertTrue(result.isEmpty());
    }

    private AuthorDao createAuthor(String firstName, String lastName, String email, String phone) {
        AuthorDao author = new AuthorDao();
        author.setFirstName(firstName);
        author.setLastName(lastName);
        author.setEmail(email);
        author.setPhone(phone);
        author.setDob(LocalDate.of(1990, 1, 1));
        author.setBiography("Test biography");
        author.setImageUrl("https://placehold.co/300x400");
        return author;
    }
}