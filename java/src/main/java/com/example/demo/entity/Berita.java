package com.example.demo.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "berita")
@Data
@NoArgsConstructor
public class Berita {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_berita")
    private Long idBerita;

    @Column(name = "jenis_kegiatan")
    private String jenisKegiatan;

    @Column(name = "penulis")
    private String penulis;

    @Lob
    @Column(name = "gambar")
    private byte[] gambar;

    @Column(name = "teks", columnDefinition = "TEXT")
    private String teks;

    // Constructors

    

    public Berita(String jenisKegiatan, String penulis, byte[] gambar, String teks) {
        this.jenisKegiatan = jenisKegiatan;
        this.penulis = penulis;
        this.gambar = gambar;
        this.teks = teks;
    }
}