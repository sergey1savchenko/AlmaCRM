package com.my.alma.service;

import com.my.alma.dao.DisciplineRepository;
import com.my.alma.model.Discipline;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DisciplineService {

    @Autowired
    DisciplineRepository disciplineRepository;

    public void save(Discipline discipline){ disciplineRepository.saveAndFlush(discipline);}

    public List<Discipline> allDisciplines() { return disciplineRepository.findAll(); }

    public Discipline getById(Integer id){ return disciplineRepository.getOne(id); }

}
