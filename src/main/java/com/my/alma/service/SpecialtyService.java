package com.my.alma.service;

import com.my.alma.dao.SpecialtyRepository;
import com.my.alma.model.Specialty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SpecialtyService {

    @Autowired
    SpecialtyRepository specialtyRepository;

    public void save(Specialty specialty){ specialtyRepository.saveAndFlush(specialty); }

    public List<Specialty> allSpecialties(){ return specialtyRepository.findAll(); }

    public Specialty getById(Integer id) {
        return specialtyRepository.getOne(id);
    }

}
