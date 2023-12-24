package com.example.demo.repository;

import java.util.Optional;

import javax.swing.text.html.Option;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.Person;

@Repository
public interface PersonRepository extends JpaRepository<Person, Long> {
    // Optional<Person> findById(Long id);

    // Optional<Person> findByFileName(String fileName);

}