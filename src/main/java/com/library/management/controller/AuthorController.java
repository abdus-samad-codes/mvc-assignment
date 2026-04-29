package com.library.management.controller;

import com.library.management.dto.AuthorDto;
import com.library.management.service.AuthorService;
import com.library.management.service.BookService;
import jakarta.validation.Valid;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;


@Controller
@RequestMapping("/authors")
public class AuthorController {

    private final AuthorService authorService;
    private final BookService bookService;

    public AuthorController(AuthorService authorService, BookService bookService) {
        this.authorService = authorService;
        this.bookService = bookService;
    }


    @GetMapping("/list")
    public String getAllAuthors(Model model) {
        model.addAttribute("authors", authorService.getAllAuthors());
        return "authors/author-list";
    }

    @GetMapping("/form")
    public String showCreateForm(Model model) {
        model.addAttribute("author", new AuthorDto());
        return "authors/author-form";
    }


    @GetMapping("/view/{id}")
    public String viewAuthor(@PathVariable UUID id, Model model) {
        model.addAttribute("author", authorService.getAuthorById(id));
        model.addAttribute("books", bookService.getBooksByAuthor(id));
        return "authors/author-details";
    }

    @PostMapping("/save")
    public String createAuthor(@Valid @ModelAttribute("author") AuthorDto authorDto,
                               BindingResult result,
                               Model model) {
        if (result.hasErrors()) {
            return "authors/author-form";
        }

        try {
            authorService.createAuthor(authorDto);
            return "redirect:/authors/list";
        } catch (DataIntegrityViolationException e) {
            model.addAttribute("error", "Email already exists. Please use another email.");
            return "authors/author-form";
        } catch (Exception e) {
            model.addAttribute("error", "Failed to save author. Please check the details and try again.");
            return "authors/author-form";
        }
    }

    @GetMapping("/edit/{authorId}")
    public String showEditForm(@PathVariable UUID authorId, Model model) {
        model.addAttribute("author", authorService.getAuthorById(authorId));
        return "authors/update-author";
    }


    @PostMapping("/update")
    public String updateAuthor(@ModelAttribute AuthorDto authorDto) {
        authorService.updateAuthor(authorDto.getId(), authorDto);
        return "redirect:/authors/list";
    }

    @GetMapping("/delete/{authorId}")
    public String deleteAuthor(@PathVariable UUID authorId) {
        authorService.deleteAuthor(authorId);
        return "redirect:/authors/list";
    }
}
