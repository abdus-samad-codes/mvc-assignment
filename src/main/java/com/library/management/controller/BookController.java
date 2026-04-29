package com.library.management.controller;

import com.library.management.dto.BookDto;
import com.library.management.service.AuthorService;
import com.library.management.service.BookService;
import com.library.management.service.CategoryService;
import jakarta.validation.Valid;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/books")
public class BookController {

    private final BookService bookService;
    private final CategoryService categoryService;
    private final AuthorService authorService;

    public BookController(BookService bookService,
                          CategoryService categoryService,
                          AuthorService authorService) {
        this.bookService = bookService;
        this.categoryService = categoryService;
        this.authorService = authorService;
    }

    @GetMapping("/list")
    public String listBooks(@RequestParam(required = false) String title,
                            @RequestParam(required = false) UUID authorId,
                            @RequestParam(required = false) UUID categoryId,
                            Model model) {

        model.addAttribute("books", bookService.searchBooks(title, authorId, categoryId));
        model.addAttribute("authors", authorService.getAllAuthors());
        model.addAttribute("categories", categoryService.getAllCategories());

        return "books/book-list";
    }

    @GetMapping("/form")
    public String showCreateForm(Model model) {
        model.addAttribute("book", new BookDto());
        addFormData(model);
        return "books/book-form";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable UUID id, Model model) {
        model.addAttribute("book", bookService.getBookById(id));
        addFormData(model);
        return "books/update-book";
    }

    @GetMapping("/view/{bookId}")
    public String showBookDetails(@PathVariable UUID bookId, Model model) {
        model.addAttribute("book", bookService.getBookById(bookId));
        return "books/book-details";
    }

    @PostMapping("/save")
    public String createBook(@Valid @ModelAttribute("book") BookDto book,
                             BindingResult result,
                             Model model) {

        if (result.hasErrors()) {
            addErrors(model, result);
            addFormData(model);
            return "books/book-form";
        }

        try {
            bookService.createBook(book);
        } catch (DataIntegrityViolationException e) {
            model.addAttribute("error", "This record could not be saved because it breaks a database rule.");
            addFormData(model);
            return "books/book-form";
        }

        return "redirect:/books/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteBook(@PathVariable UUID id) {
        bookService.deleteBookByid(id);
        return "redirect:/books/list";
    }

    @GetMapping("/join-view")
    public String showJoinView(Model model) {
        model.addAttribute("books", bookService.getAllBooks());
        return "books/book-author-join";
    }

    @PostMapping("/update")
    public String updateBook(@Valid @ModelAttribute("book") BookDto book,
                             BindingResult result,
                             Model model) {

        if (result.hasErrors()) {
            model.addAttribute("book", book);
            addErrors(model, result);
            addFormData(model);
            return "books/update-book";
        }

        try {
            bookService.updateBook(book.getId(), book);
        } catch (DataIntegrityViolationException e) {
            model.addAttribute("error", "This record could not be updated because it breaks a database rule.");
            model.addAttribute("book", book);
            addFormData(model);
            return "books/update-book";
        }

        return "redirect:/books/list";
    }

    private void addFormData(Model model) {
        model.addAttribute("categories", categoryService.getAllCategories());
        model.addAttribute("authors", authorService.getAllAuthors());
    }

    private void addErrors(Model model, BindingResult result) {
        model.addAttribute("errors",
                result.getFieldErrors()
                        .stream()
                        .collect(Collectors.toMap(
                                FieldError::getField,
                                FieldError::getDefaultMessage,
                                (first, second) -> first
                        ))
        );
    }
}