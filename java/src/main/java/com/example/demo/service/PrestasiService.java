package com.example.demo.service;

import com.example.demo.entity.Prestasi;
import com.example.demo.repository.PrestasiRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PrestasiService {

    private final PrestasiRepository prestasiRepository;

    @Autowired
    public PrestasiService(PrestasiRepository prestasiRepository) {
        this.prestasiRepository = prestasiRepository;
    }

    public Prestasi savePrestasi(Prestasi prestasi) {
        return prestasiRepository.save(prestasi);
    }

    public Prestasi getPrestasiById(Long id) {
        return prestasiRepository.findById(id).orElse(null);
    }

    public List<Prestasi> getAllPrestasi() {
        return prestasiRepository.findAll();
    }

    public void deletePrestasi(Long id) {
        prestasiRepository.deleteById(id);
    }
}
