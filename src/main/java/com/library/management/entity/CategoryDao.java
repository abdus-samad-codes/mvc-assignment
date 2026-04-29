package com.library.management.entity;

import com.library.management.enums.CategoryName;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "category")
@Getter
@Setter
public class CategoryDao extends BaseDao {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "name", nullable = false, unique = true)
    @Enumerated(EnumType.STRING)
    private CategoryName name;

    @OneToMany(mappedBy = "categoryDao")
    private List<BookDao> books = new ArrayList<>();

}
