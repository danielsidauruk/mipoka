package com.example.demo.repository;

import com.example.demo.entity.Ormawa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrmawaRepository extends JpaRepository<Ormawa, Integer> {
    // Tambahkan method kustom sesuai kebutuhan Anda
}