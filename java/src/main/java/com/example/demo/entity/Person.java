package com.example.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

//import org.springframework.web.multipart.MultipartFile;



import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "person")

public class Person {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nama;

    private String alamat;

    @Lob
    @Column(name = "gambar1")
    private byte[] gambar1;

    @Lob
    @Column(name = "gambar2")
    private byte[] gambar2;

    public Person(String nama, String alamat, byte[] gambar1Data, byte[] gambar2Data) {
        this.nama = nama;
        this.alamat = alamat;
        this.gambar1 = gambar1Data;
        this.gambar2 = gambar2Data;
    }

    
}