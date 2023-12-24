package com.example.demo.service;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entity.Person;
import com.example.demo.repository.PersonRepository;


@Service
public class PersonService {

    private PersonRepository personRepository;

    @Autowired
    public PersonService(PersonRepository personRepository) {
        this.personRepository = personRepository;
    }

    public Person savePerson(Person person) {
        return personRepository.save(person);
    }
   public Person getPerson(Long id) {
        return personRepository.findById(id).orElse(null);
    }

    
    
    // public Optional<Person> getPersonById(Long id) {
    //     return personRepository.findById(id);
    // }
    public Person getPersonById(Long id) {
        return personRepository.findById(id).orElse(null);
    }
    public List<Person> getAllPersons() {
        return personRepository.findAll();
    }
    
    public Person updatePerson(Long id, Person updatedPerson) {
        Optional<Person> optionalPerson = personRepository.findById(id);
        if (optionalPerson.isPresent()) {
            Person person = optionalPerson.get();
            person.setNama(updatedPerson.getNama());
            person.setAlamat(updatedPerson.getAlamat());
            person.setGambar1(updatedPerson.getGambar1());
            person.setGambar2(updatedPerson.getGambar2());
            return personRepository.save(person);
        } else {
            throw new NoSuchElementException("Person not found with id: " + id);
        }
    }

    public void deletePerson(Long id) {
        personRepository.deleteById(id);
    }

    
    
    
    // public String uploadImage(MultipartFile file) {
    //     return null;
    // }
    
}