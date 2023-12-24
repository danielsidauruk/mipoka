package com.example.demo.entity;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "prestasi")
@Data
@Getter
@Setter
@NoArgsConstructor
public class Prestasi {
  
    

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_prestasi")
    private Long idPrestasi;
  
    @Column(name = "nim")
    private String nim;
  
    @Column(name = "nama")
    private String nama;
  
    @Column(name = "kegiatan")
    private String kegiatan;
  
    @Column(name = "tingkat")
    private String tingkat;
  
    @Column(name = "prestasi_dicapai")
    private String prestasiDicapai;
  
    // Constructors, getters, and setters
    // ...
    public Prestasi(String nim2, String nama2, String kegiatan2, String tingkat2, String prestasiDicapai2) {
        this.nim = nim2;
        this.nama = nama2;
        this.kegiatan = kegiatan2;
        this.tingkat = tingkat2;
        this.prestasiDicapai = prestasiDicapai2;
        
    }
}
