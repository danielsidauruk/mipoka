package com.example.demo.controller;

import com.example.demo.entity.Prestasi;
import com.example.demo.service.PrestasiService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/prestasi")
public class PrestasiController {

    private final PrestasiService prestasiService;

    @Autowired
    public PrestasiController(PrestasiService prestasiService) {
        this.prestasiService = prestasiService;
    }
    @PostMapping
    public ResponseEntity<Prestasi> createPrestasi(@RequestBody Prestasi prestasi) {
        Prestasi savedPrestasi = prestasiService.savePrestasi(prestasi);
        return ResponseEntity.ok(savedPrestasi);
    }
    
    @GetMapping
    public ResponseEntity<List<Prestasi>> getAllPrestasi() {
    List<Prestasi> prestasiList = prestasiService.getAllPrestasi();
    if (prestasiList.isEmpty()) {
        return ResponseEntity.noContent().build();
    }
    return ResponseEntity.ok(prestasiList);
}
    @GetMapping("/{id}")
    public ResponseEntity<Prestasi> getPrestasiById(@PathVariable Long id) {
        Prestasi prestasi = prestasiService.getPrestasiById(id);
        if (prestasi == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(prestasi);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Prestasi> updatePrestasi(@PathVariable Long id, @RequestBody Prestasi prestasi) {
        Prestasi existingPrestasi = prestasiService.getPrestasiById(id);
        if (existingPrestasi == null) {
            return ResponseEntity.notFound().build();
        }

        existingPrestasi.setNim(prestasi.getNim());
        existingPrestasi.setNama(prestasi.getNama());
        existingPrestasi.setKegiatan(prestasi.getKegiatan());
        existingPrestasi.setTingkat(prestasi.getTingkat());
        existingPrestasi.setPrestasiDicapai(prestasi.getPrestasiDicapai());

        Prestasi updatedPrestasi = prestasiService.savePrestasi(existingPrestasi);
        return ResponseEntity.ok(updatedPrestasi);
    }

    
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletePrestasi(@PathVariable Long id) {
        Prestasi prestasi = prestasiService.getPrestasiById(id);
        if (prestasi == null) {
            return ResponseEntity.notFound().build();
        }
        prestasiService.deletePrestasi(id);
        return ResponseEntity.noContent().build();
    }
}