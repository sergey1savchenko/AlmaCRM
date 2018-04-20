package com.my.alma.service;

import com.my.alma.dao.StudentsAppliedRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentsAppliedService {

    @Autowired
    StudentsAppliedRepository studentsAppliedRepository;


}
