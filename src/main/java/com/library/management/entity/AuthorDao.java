package com.library.management.entity;

import com.library.management.util.DateUtil;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "authors")
@Getter
@Setter
public class AuthorDao extends BaseDao {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "middle_name")
    private String middleName;

    @Column(name = "last_name")
    private String lastName;

    @Column(unique = true)
    private String email;

    private String phone;

    @Column(name = "date_of_birth")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dob;

    @Column(name = "image_url")
    private String imageUrl;

    @Lob
    private String biography;

    @ManyToMany(mappedBy = "authors")
    private List<BookDao> books = new ArrayList<>();

    public long getAge() {
        return DateUtil.getAge(this.dob);
    }
}