package com.library.management.repository;

import com.library.management.entity.CategoryDao;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface CategoryRepository extends JpaRepository<CategoryDao, UUID> {
}
