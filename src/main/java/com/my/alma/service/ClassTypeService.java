package com.my.alma.service;

import com.my.alma.dao.ClassTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClassTypeService {

    @Autowired
    ClassTypeRepository classTypeRepository;

}
