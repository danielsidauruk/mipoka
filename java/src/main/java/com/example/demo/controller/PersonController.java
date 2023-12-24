package com.example.demo.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entity.Person;
import com.example.demo.service.PersonService;

import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.http.ResponseEntity;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVPrinter;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@RestController
@RequestMapping("/persons")
public class PersonController {

    private PersonService personService;

    // @Autowired
    public PersonController(PersonService personService) {
        this.personService = personService;
    }

    

    // @PostMapping
    // public ResponseEntity<Person> createPerson(@RequestBody Person person) {
    //     Person savedPerson = personService.savePerson(person);
    //     return ResponseEntity.ok(savedPerson);
    // }

    
    // @PostMapping("/upload")
    // public ResponseEntity<?> uploadImage(@RequestParam("image")MultipartFile file) throws IOException {
    //     String uploadImage = personService.uploadImage(file);
    //     return ResponseEntity.status(HttpStatus.OK)
    //             .body(uploadImage);
    // }
   
    @PostMapping
    public ResponseEntity<Person> createPerson(@RequestParam("nama") String nama,
                                           @RequestParam("alamat") String alamat,
                                           @RequestParam("gambar1") MultipartFile gambar1,
                                           @RequestParam("gambar2") MultipartFile gambar2) {

    // Mengonversi MultipartFile menjadi byte array
    byte[] gambar1Data;
    byte[] gambar2Data;
    try {
        gambar1Data = gambar1.getBytes();
        gambar2Data = gambar2.getBytes();
    } catch (IOException e) {
        // Tangani exception jika terjadi kesalahan saat mengambil data file
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
    }

    Person person = new Person(nama, alamat, gambar1Data, gambar2Data);
    Person savedPerson = personService.savePerson(person);
    return ResponseEntity.ok(savedPerson);
}

    

// @GetMapping("/{id}")
// public ResponseEntity<Person> getPersonById(@PathVariable Long id) {
//     Optional<Person> optionalPerson = personService.getPersonById(id);
//     return optionalPerson.map(ResponseEntity::ok).orElse(ResponseEntity.notFound().build());
// }

@GetMapping("/{id}")
    public ResponseEntity<?> getPersonById(@PathVariable Long id) {
        try {
            Person person = personService.getPersonById(id);
            if (person != null) {
                return ResponseEntity.ok(person);
            } else {
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error retrieving person: " + e.getMessage());
        }
    }
    

    @GetMapping("/")
    public ResponseEntity<?> getAllPersons() {
        try {
            List<Person> persons = personService.getAllPersons();
            if (!persons.isEmpty()) {
                return ResponseEntity.ok(persons);
            } else {
                return ResponseEntity.noContent().build();
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error retrieving persons: " + e.getMessage());
        }
    }    

    @GetMapping("/persons/download")
public ResponseEntity<Resource> downloadAllPersons() throws Exception {
    List<Person> persons = personService.getAllPersons();
    
    // Membuat file CSV dari data orang
    byte[] csvData = createCSVFromPersons(persons);
    
    // Membuat objek Resource dari data CSV
    ByteArrayResource resource = new ByteArrayResource(csvData);
    
    // Mengatur tipe konten dan header respons
    return ResponseEntity.ok()
            .contentType(MediaType.parseMediaType("text/csv"))
            .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"persons.csv\"")
            .body(resource);
}

private byte[] createCSVFromPersons(List<Person> persons) {
    try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
         CSVPrinter csvPrinter = new CSVPrinter(new PrintWriter(outputStream), CSVFormat.DEFAULT)) {
        
        // Menulis header
        csvPrinter.printRecord("ID", "Nama", "Alamat");
        
        // Menulis data orang
        for (Person person : persons) {
            csvPrinter.printRecord(person.getId(), person.getNama(), person.getAlamat());
        }
        
        // Mengembalikan data CSV sebagai byte array
        csvPrinter.flush();
        return outputStream.toByteArray();
    } catch (IOException e) {
        // Mengatasi kesalahan jika terjadi kesalahan saat membuat CSV
        e.printStackTrace();
        return new byte[0];
    }
}
// @PutMapping("/{id}")
// public ResponseEntity<Person> updatePerson(@PathVariable Long id,
//                                            @RequestParam("nama") String nama,
//                                            @RequestParam("alamat") String alamat,
//                                            @RequestParam("gambar1") MultipartFile gambar1,
//                                            @RequestParam("gambar2") MultipartFile gambar2) {

//     // Mengonversi MultipartFile menjadi byte array
//     byte[] gambar1Data;
//     byte[] gambar2Data;
//     try {
//         gambar1Data = gambar1.getBytes();
//         gambar2Data = gambar2.getBytes();
//     } catch (IOException e) {
//         // Tangani exception jika terjadi kesalahan saat mengambil data file
//         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
//     }

//     Person updatedPerson = new Person(nama, alamat, gambar1Data, gambar2Data);
//     Person person = personService.updatePerson(id, updatedPerson);
//     return ResponseEntity.ok(person);
// }
@PutMapping("/person/{id}")
public ResponseEntity<Person> updatePerson(@PathVariable Long id,
                                           @RequestParam("nama") String nama,
                                           @RequestParam("alamat") String alamat,
                                           @RequestParam(value = "gambar1", required = false) MultipartFile gambar1,
                                           @RequestParam(value = "gambar2", required = false) MultipartFile gambar2) {

    // Cek apakah person dengan ID tersebut ada di database
    Person existingPerson = personService.getPerson(id);
    if (existingPerson == null) {
        return ResponseEntity.notFound().build();
    }

    // Mengupdate data nama dan alamat pada person
    existingPerson.setNama(nama);
    existingPerson.setAlamat(alamat);

    // Cek dan mengganti gambar 1 jika ada
    if (gambar1 != null && !gambar1.isEmpty()) {
        try {
            byte[] gambar1Data = gambar1.getBytes();
            existingPerson.setGambar1(gambar1Data);
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    // Cek dan mengganti gambar 2 jika ada
    if (gambar2 != null && !gambar2.isEmpty()) {
        try {
            byte[] gambar2Data = gambar2.getBytes();
            existingPerson.setGambar2(gambar2Data);
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    // Simpan perubahan pada person
    Person updatedPerson = personService.savePerson(existingPerson);
    return ResponseEntity.ok(updatedPerson);
}
// @DeleteMapping("/{id}")
// public ResponseEntity<Void> deletePerson(@PathVariable Long id) {
//     personService.deletePerson(id);
//     return ResponseEntity.noContent().build();
// }
@DeleteMapping("/{id}")
public ResponseEntity<Void> deletePerson(@PathVariable Long id) {
    Person person = personService.getPerson(id);
    if (person == null) {
        return ResponseEntity.notFound().build();
    }
    
    personService.deletePerson(id);
    return ResponseEntity.noContent().build();
}
}
