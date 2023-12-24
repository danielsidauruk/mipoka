package com.example.demo.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "ormawa")
@Data
@NoArgsConstructor
public class Ormawa {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_ormawa")
    private int idOrmawa;

    @Column(name = "nama_ormawa")
    private String namaOrmawa;

    @Column(name = "pembina")
    private String pembina;

    @Column(name = "ketua")
    private String ketua;

    @Column(name = "wakil")
    private String wakil;

    @Column(name = "bendahara")
    private String bendahara;

    @Column(name = "jumlah_anggota")
    private int jumlahAnggota;

    @Column(name = "foto_pembina")
    private byte[] fotoPembina;

    @Lob
    @Column(name = "foto_ketua")
    private byte[] fotoKetua;

    @Lob
    @Column(name = "foto_wakil")
    private byte[] fotoWakil;

    @Lob
    @Column(name = "foto_bendahara")
    private byte[] fotoBendahara;

    // Constructors, getters, and setters
    // ...

    public Ormawa(String namaOrmawa, String pembina, String ketua, String wakil, String bendahara, int jumlahAnggota, byte[] fotoPembina, byte[] fotoKetua, byte[] fotoWakil, byte[] fotoBendahara) {
        this.namaOrmawa = namaOrmawa;
        this.pembina = pembina;
        this.ketua = ketua;
        this.wakil = wakil;
        this.bendahara = bendahara;
        this.jumlahAnggota = jumlahAnggota;
        this.fotoPembina = fotoPembina;
        this.fotoKetua = fotoKetua;
        this.fotoWakil = fotoWakil;
        this.fotoBendahara = fotoBendahara;
    }

}

