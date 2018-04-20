package com.my.alma.service;

import com.my.alma.dao.FacultyRepository;
import com.my.alma.model.Faculty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FacultyService {

    @Autowired
    FacultyRepository facultyRepository;

    public List<Faculty> allFaculties(){
        return facultyRepository.findAll();
    }

    public Faculty getById(Integer id) {
        return facultyRepository.getOne(id);
    }

    public void save(Faculty faculty) { facultyRepository.saveAndFlush(faculty); }


}
