package com.my.alma.service;

import com.my.alma.dao.SkillRepository;
import com.my.alma.model.Skill;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SkillService {

    @Autowired
    SkillRepository skillRepository;

    public void save(Skill skill) { skillRepository.saveAndFlush(skill); }

}
