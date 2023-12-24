package com.example.demo.controller;

import java.io.IOException;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

import javax.websocket.server.PathParam;

import com.example.demo.entity.Berita;
import com.example.demo.service.BeritaService;

@RestController
@RequestMapping("/berita")
public class BeritaController {
    
        private BeritaService beritaService;
        
        
        public BeritaController(BeritaService beritaService) {
            this.beritaService = beritaService;
        }
        @PostMapping
        public ResponseEntity <Berita> createBerita(@RequestParam("jenisKegiatan") String jenisKegiatan,
                                            @RequestParam("penulis") String penulis,
                                            @RequestParam("gambar") MultipartFile gambar,
                                            @RequestParam("teks") String teks,
                                            @RequestParam("detail_berita") String detail_berita) {
            try {
                byte[] gambarData = gambar.getBytes();
                Berita berita = new Berita(jenisKegiatan, penulis, gambarData, teks);
                Berita savedBerita = beritaService.saveBerita(berita);
                return ResponseEntity.ok(savedBerita);
            } catch (IOException e) {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
            }
        }
//         @PostMapping
//         public ResponseEntity<Berita> createBerita(@RequestParam("jenisKegiatan") String jenisKegiatan,
//                                            @RequestParam("penulis") String penulis,
//                                            @RequestParam("gambar") MultipartFile gambar,
//                                            @RequestParam("teks") String teks) {

//             try {
//                 byte[] gambarData = gambar.getBytes();
//                 Berita berita = new Berita(jenisKegiatan, penulis, gambarData, teks);
//                 Berita savedBerita = beritaService.saveBerita(berita);
//                 return ResponseEntity.ok(savedBerita);
//             } catch (IOException e) {
//                 return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
//             }
            
// }
    @GetMapping("/")
    public ResponseEntity<?> getAllBerita() {
       try{
        List<Berita> berita = beritaService.getAllBeritas();
        if(!berita.isEmpty()){
            return ResponseEntity.ok(berita);
       }else{
           return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Data Kosong");
       }
    }catch(Exception e){
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
    }
    }
    // @GetMapping("/{id}")
    // public ResponseEntity<?> getBeritaById(@RequestParam("id") Long id) {
    //     try{
    //         Berita berita = beritaService.getBeritaById(id);
    //         if(berita != null){
    //             return ResponseEntity.ok(berita);
    //         }else{
    //             return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Data Kosong");
    //         }
    //     }catch(Exception e){
    //         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
    //     }
    // }
    @GetMapping("/{idBerita}")
    public ResponseEntity<Berita> getBeritaById(@PathVariable int idBerita) {
        Berita berita = beritaService.getBeritaById((long) idBerita);
        if (berita != null) {
            return ResponseEntity.ok(berita);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
    @PutMapping("/{id}")
    public ResponseEntity<Berita> updateBerita(@PathVariable("id") int id,
                                               @RequestParam("jenis_kegiatan") String jenisKegiatan,
                                               @RequestParam("penulis") String penulis,
                                               @RequestParam(value = "gambar", required = false) MultipartFile gambar,
                                               @RequestParam("teks") String teks,
                                               @RequestParam("detail_berita") String detail_berita) {
        Berita existingBerita = beritaService.getBeritaById((long) id);
        if (existingBerita == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        existingBerita.setJenisKegiatan(jenisKegiatan);
        existingBerita.setPenulis(penulis);

        if (gambar != null && !gambar.isEmpty()) {
            try {
                byte[] gambarData = gambar.getBytes();
                existingBerita.setGambar(gambarData);
            } catch (IOException e) {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
            }
        }

        Berita updatedBerita = beritaService.saveBerita(existingBerita);
        return ResponseEntity.ok(updatedBerita);
    }
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteBerita(@PathVariable("id") int id) {
        Berita existingBerita = beritaService.getBeritaById((long) id);
        if (existingBerita == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
        beritaService.deleteBerita(existingBerita);
        return ResponseEntity.noContent().build();
    }
}


    

