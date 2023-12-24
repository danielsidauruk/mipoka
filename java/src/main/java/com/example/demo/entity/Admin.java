package com.example.demo.entity;



import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "Admin")
@Data
@NoArgsConstructor
public class Admin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_admin")
    private int idAdmin;

    @Column(name = "nip")
    private String nip;

    @Column(name = "username")
    private String username;

    @Column(name = "password")
    private String password;

    @Column(name = "no_hp")
    private String no_hp;

    @Column(name = "role")
    private String role;

    // Constructors, getters, and setters
    // ...

    public Admin(String nip, String username, String password, String no_hp, String role) {
        this.nip = nip;
        this.username = username;
        this.password = password;
        this.no_hp = no_hp;
        this.role = role;
    }

    // Getters and setters
    // ...
}
