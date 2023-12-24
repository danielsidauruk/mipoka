package com.example.demo.controller;

import com.example.demo.entity.Ormawa;
import com.example.demo.service.OrmawaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/ormawa")
public class OrmawaController {

    private final OrmawaService ormawaService;

    @Autowired
    public OrmawaController(OrmawaService ormawaService) {
        this.ormawaService = ormawaService;
    }
     @PostMapping
    public Ormawa createOrmawa(@RequestParam("namaOrmawa") String namaOrmawa,
                               @RequestParam("pembina") String pembina,
                               @RequestParam("ketua") String ketua,
                               @RequestParam("wakil") String wakil,
                               @RequestParam("bendahara") String bendahara,
                               @RequestParam("jumlahAnggota") int jumlahAnggota,
                               @RequestParam("fotoPembina") MultipartFile fotoPembina,
                               @RequestParam("fotoKetua") MultipartFile fotoKetua,
                               @RequestParam("fotoWakil") MultipartFile fotoWakil,
                               @RequestParam("fotoBendahara") MultipartFile fotoBendahara) throws IOException {
        // Lakukan pemrosesan data dan simpan ke database
        // ...

        // Contoh pemanggilan service untuk menyimpan data ke database
        byte[] fotoPembinaBytes = fotoPembina.getBytes();
        byte[] fotoKetuaBytes = fotoKetua.getBytes();
        byte[] fotoWakilBytes = fotoWakil.getBytes();
        byte[] fotoBendaharaBytes = fotoBendahara.getBytes();

        Ormawa ormawa = new Ormawa(namaOrmawa, pembina, ketua, wakil, bendahara, jumlahAnggota,
                fotoPembinaBytes, fotoKetuaBytes, fotoWakilBytes, fotoBendaharaBytes);
        return ormawaService.saveOrmawa(ormawa);
    }

    // @PostMapping
    // public ResponseEntity<Ormawa> createOrmawa(@RequestBody Ormawa ormawa) {
    //     Ormawa createdOrmawa = ormawaService.saveOrmawa(ormawa);
    //     return new ResponseEntity<>(createdOrmawa, HttpStatus.CREATED);
    // }

    @GetMapping("/{id}")
    public ResponseEntity<Ormawa> getOrmawaById(@PathVariable int id) {
        Ormawa ormawa = ormawaService.getOrmawaById(id);
        if (ormawa != null) {
            return ResponseEntity.ok(ormawa);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping
    public ResponseEntity<List<Ormawa>> getAllOrmawa() {
        List<Ormawa> ormawaList = ormawaService.getAllOrmawa();
        return ResponseEntity.ok(ormawaList);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteOrmawa(@PathVariable int id) {
        ormawaService.deleteOrmawa(id);
        return ResponseEntity.noContent().build();
    }
    @PutMapping("/{id}")
    public ResponseEntity<Ormawa> updateOrmawa(@PathVariable("id") int id,
                                               @RequestParam("namaOrmawa") String namaOrmawa,
                                               @RequestParam("pembina") String pembina,
                                               @RequestParam("ketua") String ketua,
                                               @RequestParam("wakil") String wakil,
                                               @RequestParam("bendahara") String bendahara,
                                               @RequestParam("jumlahAnggota") int jumlahAnggota,
                                               @RequestParam(value = "fotoPembina", required = false) MultipartFile fotoPembina,
                                               @RequestParam(value = "fotoKetua", required = false) MultipartFile fotoKetua,
                                               @RequestParam(value = "fotoWakil", required = false) MultipartFile fotoWakil,
                                               @RequestParam(value = "fotoBendahara", required = false) MultipartFile fotoBendahara) throws IOException {
        Ormawa existingOrmawa = ormawaService.getOrmawaById(id);
        if (existingOrmawa == null) {
            return ResponseEntity.notFound().build();
        }

        // Update data Ormawa berdasarkan parameter yang diberikan
        existingOrmawa.setNamaOrmawa(namaOrmawa);
        existingOrmawa.setPembina(pembina);
        existingOrmawa.setKetua(ketua);
        existingOrmawa.setWakil(wakil);
        existingOrmawa.setBendahara(bendahara);
        existingOrmawa.setJumlahAnggota(jumlahAnggota);

        // Update data gambar jika parameter gambar tidak kosong
        if (fotoPembina != null && !fotoPembina.isEmpty()) {
            existingOrmawa.setFotoPembina(fotoPembina.getBytes());
        }
        if (fotoKetua != null && !fotoKetua.isEmpty()) {
            existingOrmawa.setFotoKetua(fotoKetua.getBytes());
        }
        if (fotoWakil != null && !fotoWakil.isEmpty()) {
            existingOrmawa.setFotoWakil(fotoWakil.getBytes());
        }
        if (fotoBendahara != null && !fotoBendahara.isEmpty()) {
            existingOrmawa.setFotoBendahara(fotoBendahara.getBytes());
        }

        // Simpan perubahan ke database menggunakan service
        Ormawa updatedOrmawa = ormawaService.saveOrmawa(existingOrmawa);
        return ResponseEntity.ok(updatedOrmawa);
    }
}

