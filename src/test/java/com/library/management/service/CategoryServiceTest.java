package com.library.management.service;

import com.library.management.dto.CategoryDto;
import com.library.management.entity.CategoryDao;
import com.library.management.enums.CategoryName;
import com.library.management.repository.CategoryRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class CategoryServiceTest {

    @Mock
    private CategoryRepository categoryRepository;

    @InjectMocks
    private CategoryService categoryService;

    private CategoryDao categoryDao;
    private UUID categoryId;

    @BeforeEach
    void setUp() {
        categoryId = UUID.randomUUID();
        categoryDao = new CategoryDao();
        categoryDao.setId(categoryId);
        categoryDao.setName(CategoryName.FICTION);
        categoryDao.setBooks(new ArrayList<>());
    }

    @Test
    void getAllCategories_ShouldReturnListOfCategoryDtos() {
        when(categoryRepository.findAll()).thenReturn(List.of(categoryDao));

        List<CategoryDto> result = categoryService.getAllCategories();

        assertNotNull(result);
        assertEquals(1, result.size());
        assertEquals(CategoryName.FICTION, result.get(0).getName());
        assertEquals(0, result.get(0).getBookCount());
        verify(categoryRepository, times(1)).findAll();
    }
}
