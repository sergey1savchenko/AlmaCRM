package com.my.alma.service;

import com.my.alma.dao.GradeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GradeService {

    @Autowired
    GradeRepository gradeRepository;


}
