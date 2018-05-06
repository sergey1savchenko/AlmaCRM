package com.my.alma.service;

import com.my.alma.dao.QualificationProgramRepository;
import com.my.alma.model.Agent;
import com.my.alma.model.QualificationProgram;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QualificationProgramService {

    @Autowired
    QualificationProgramRepository qualificationProgramRepository;

    public List<QualificationProgram> getAllByAgent(Agent agent) {
        return qualificationProgramRepository.findAllByAgent(agent);
    }

    public List<QualificationProgram> getAll() { return qualificationProgramRepository.findAll(); }

    public Integer saveAndGetId(QualificationProgram qualificationProgram){
        qualificationProgramRepository.saveAndFlush(qualificationProgram);
        return qualificationProgram.getId();
    }

    public void setSkillToProgram(Integer skillId, Integer newProgramId) {
        qualificationProgramRepository.setSkillToProgram(skillId, newProgramId);
    }
}
