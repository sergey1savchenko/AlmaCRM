package com.my.alma.service;

import com.my.alma.dao.GradeRepository;
import com.my.alma.model.Grade;
import com.my.alma.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GradeService {

    @Autowired
    GradeRepository gradeRepository;

    public List<Grade> gradesByStudent(Student student) { return gradeRepository.findAllByStudent(student); }

}
