package com.my.alma.service;

import com.my.alma.dao.QualificationProgramRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QualificationProgramService {

    @Autowired
    QualificationProgramRepository qualificationProgramRepository;


}
