package com.example.demo.service;

import com.example.demo.entity.Ormawa;
import com.example.demo.repository.OrmawaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrmawaService {

    private final OrmawaRepository ormawaRepository;

    @Autowired
    public OrmawaService(OrmawaRepository ormawaRepository) {
        this.ormawaRepository = ormawaRepository;
    }

    public Ormawa saveOrmawa(Ormawa ormawa) {
        return ormawaRepository.save(ormawa);
    }

    public Ormawa getOrmawaById(int id) {
        return ormawaRepository.findById(id).orElse(null);
    }

    public List<Ormawa> getAllOrmawa() {
        return ormawaRepository.findAll();
    }

    public void deleteOrmawa(int id) {
        ormawaRepository.deleteById(id);
    }
}
