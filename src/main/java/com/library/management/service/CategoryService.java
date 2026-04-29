package com.library.management.service;

import com.library.management.dto.CategoryDto;
import com.library.management.entity.CategoryDao;
import com.library.management.repository.CategoryRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CategoryService {

    private final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public List<CategoryDto> getAllCategories() {
        return categoryRepository.findAll().stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    private CategoryDto toDto(CategoryDao dao) {
        CategoryDto dto = new CategoryDto();
        dto.setId(dao.getId());
        dto.setName(dao.getName());
        dto.setBookCount(dao.getBooks() != null ? dao.getBooks().size() : 0);
        return dto;
    }
}
