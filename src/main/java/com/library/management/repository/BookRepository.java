package com.library.management.repository;

import com.library.management.entity.BookDao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface BookRepository extends JpaRepository<BookDao, UUID> {

    @Query("SELECT b FROM BookDao b WHERE b.id = :id")
        //@NativeQuery("SELECT * FROM books b where b.id = ?1")
    Optional<BookDao> checkBookById(UUID id);


    // if we apply this then we have to group the record manually and then send to jsp page.
//    @Query(value = """
//            SELECT b.id as book_id,
//            b.title as title ,
//            b.isbn as isbn,
//            b.publisher as publisher,
//            a.id as author_id,
//            CONCAT(a.first_name,' ', a.middle_name, ' ', a.last_name) as author_name
//            FROM books b
//            INNER JOIN book_author ba ON b.id = ba.book_id
//            INNER JOIN authors a ON a.id = ba.author_id
//            """, nativeQuery = true)
    @Query("SELECT DISTINCT b from BookDao b JOIN FETCH b.authors")
    List<BookDao> getAllBooksWithAuthor();

    @Query(value = """
            SELECT b.*
            FROM book_author ba
            JOIN books b ON b.id = ba.book_id
            WHERE ba.author_id = :id
            """, nativeQuery = true)
    List<BookDao> getBookByAuthorId(@Param("id") UUID id);


    @Query("""
                SELECT DISTINCT b FROM BookDao b
                LEFT JOIN b.authors a
                WHERE (:title IS NULL OR LOWER(b.title) LIKE LOWER(CONCAT('%', :title, '%')))
                AND (:authorId IS NULL OR a.id = :authorId)
                AND (:categoryId IS NULL OR b.categoryDao.id = :categoryId)
            """)
    List<BookDao> searchBooks(
            @Param("title") String title,
            @Param("authorId") UUID authorId,
            @Param("categoryId") UUID categoryId
    );
}

