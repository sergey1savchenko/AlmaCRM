package com.my.alma.service;

import com.my.alma.dao.VacancyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VacancyService {

    @Autowired
    VacancyRepository vacancyRepository;


}
