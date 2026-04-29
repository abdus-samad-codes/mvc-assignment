package com.library.management.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Entity
@Table(name = "books")
@Getter
@Setter
public class BookDao extends BaseDao {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @NotNull
    @Column(nullable = false)
    private String title;

    @NotNull
    @Column(nullable = false, unique = true)
    private String isbn;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private CategoryDao categoryDao;

    private String publisher;

    @Column(name = "publish_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate publishDate;

    @Lob
    private String description;

    private Integer totalCopies;
    private Integer availableCopies;

    private String shelfLocation;

    private Integer pages;

    private String imageUrl;

    @ManyToMany
    @JoinTable(
            name = "book_author",
            joinColumns = @JoinColumn(name = "book_id"),
            inverseJoinColumns = @JoinColumn(name = "author_id")
    )
    private Set<AuthorDao> authors = new HashSet<>();
}