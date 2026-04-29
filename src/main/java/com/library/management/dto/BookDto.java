package com.library.management.dto;

import jakarta.validation.constraints.*;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;


@Data
public class BookDto {

    private UUID id;

    @NotBlank(message = "Title is required")
    @Size(min = 2, max = 200, message = "Title must be between 2 and 200 characters")
    private String title;

    @NotBlank(message = "ISBN is required")
    @Size(min = 10, max = 20, message = "ISBN must be between 10 and 20 characters")
    private String isbn;

    @NotBlank(message = "Publisher is required")
    private String publisher;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @PastOrPresent(message = "Publish date cannot be in the future")
    private LocalDate publishDate;

    @Size(max = 1000, message = "Description too long")
    private String description;

    @NotNull(message = "Total copies is required")
    @Min(value = 1, message = "Total copies must be at least 1")
    private Integer totalCopies;

    @NotNull(message = "Available copies is required")
    @Min(value = 0, message = "Available copies cannot be negative")
    private Integer availableCopies;

    @Size(max = 50, message = "Shelf location too long")
    private String shelfLocation;

    @Size(max = 50, message = "Language too long")
    private String language;

    @Min(value = 1, message = "Pages must be at least 1")
    private Integer pages;

    private String imageUrl;

    @NotNull(message = "Category is required")
    private UUID categoryId;

    private String categoryName;

    @NotEmpty(message = "At least one author must be selected")
    private List<UUID> authorIds;

    private List<String> authorNames;
}
    