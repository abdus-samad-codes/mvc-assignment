package com.library.management.repository;

import com.library.management.entity.AuthorDao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface AuthorRepository extends JpaRepository<AuthorDao, UUID> {

    //@Query("Select author from AuthorDao author where author.email = :email OR author.phone = :phone")
    List<AuthorDao> getByEmailOrPhone(String email, String phone);
}