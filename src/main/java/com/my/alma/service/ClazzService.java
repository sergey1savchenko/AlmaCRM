package com.my.alma.service;

import com.my.alma.dao.ClazzRepository;
import com.my.alma.model.Clazz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClazzService {

    @Autowired
    ClazzRepository clazzRepository;

    public void save (Clazz clazz) { clazzRepository.saveAndFlush(clazz); }

    public void addTeacherToClass(Integer teacherId, Integer classId) {
        clazzRepository.addTeacherToClass(teacherId, classId);
    }

    public Clazz getById(Integer id) { return clazzRepository.findOne(id); }

    public void setStudentToClass(Integer studentId, Integer classId) {
        clazzRepository.setStudentToClass(studentId, classId);
    }

    public void setStudentClassPresence(Integer classId, Integer studentId, Boolean isPresent){
        clazzRepository.setStudentClassPresence(classId, studentId, isPresent);
    }

    public void setStudentClassGrade(Integer classId, Integer studentId, Integer grade){
        clazzRepository.setStudentClassGrade(classId, studentId, grade);
    }
}
