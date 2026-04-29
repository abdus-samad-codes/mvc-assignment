package com.library.management.util;

import com.library.management.entity.CategoryDao;
import com.library.management.enums.CategoryName;
import com.library.management.repository.CategoryRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.Arrays;

@Component
public class DataInitializer implements CommandLineRunner {

    private final CategoryRepository categoryRepository;

    public DataInitializer(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override
    public void run(String... args) throws Exception {
        if (categoryRepository.count() == 0) {
            Arrays.stream(CategoryName.values()).forEach(name -> {
                CategoryDao category = new CategoryDao();
                category.setName(name);
                categoryRepository.save(category);
            });
        }
    }
}
