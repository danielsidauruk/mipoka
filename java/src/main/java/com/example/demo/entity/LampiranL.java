package com.example.demo.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "lampiranL")
@Data
public class LampiranL {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_lampiran")
    private int idLampiran;

    @Lob
    @Column(name = "lampiranA")
    private String lampiranA;

    @Lob
    @Column(name = "lampiranB")
    private String lampiranB;

    @Lob
    @Column(name = "lampiranC")
    private String lampiranC;

    @Lob
    @Column(name = "lampiranD")
    private String lampiranD;

    // Constructors
    public LampiranL() {
    }

    public LampiranL(String lampiranA, String lampiranB, String lampiranC, String lampiranD) {
        this.lampiranA = lampiranA;
        this.lampiranB = lampiranB;
        this.lampiranC = lampiranC;
        this.lampiranD = lampiranD;
    }
}
