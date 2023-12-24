package com.example.demo.service;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Berita;
import com.example.demo.repository.BeritaRepository;

@Service
public class BeritaService {
    private BeritaRepository beritaRepository;
    
    @Autowired
    public BeritaService(BeritaRepository beritaRepository) {
        this.beritaRepository = beritaRepository;
    }
    public Berita saveBerita(Berita berita) {
        return beritaRepository.save(berita);
    }
    public List<Berita> getAllBeritas() {
        return beritaRepository.findAll();
        
    }

    public Berita getBeritaById(long id) {
        return beritaRepository.findById((long) id).orElse(null);
    }
    public void deleteBerita(Berita existingBerita) {
        beritaRepository.delete(existingBerita);
    }
    public Berita updateBerita(Long id, Berita updatedBerita) {
        Optional<Berita> optionalBerita = beritaRepository.findById(id);
        if (optionalBerita.isPresent()) {
            Berita berita = optionalBerita.get();
            berita.setJenisKegiatan(updatedBerita.getJenisKegiatan());
            berita.setPenulis(updatedBerita.getPenulis());
            berita.setGambar(updatedBerita.getGambar());
            return beritaRepository.save(berita);
        } else {
            throw new NoSuchElementException("Berita not found with id: " + id);
        }
    }
}
