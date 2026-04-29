package com.library.management.dto;

import com.library.management.enums.CategoryName;
import lombok.Data;

import java.util.UUID;

@Data
public class CategoryDto {
    private UUID id;
    private CategoryName name;
    private int bookCount;
}