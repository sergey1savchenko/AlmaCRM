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

}
