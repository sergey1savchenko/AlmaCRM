package com.my.alma.service;

import com.my.alma.dao.SkillRepository;
import com.my.alma.model.Discipline;
import com.my.alma.model.Skill;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
public class SkillService {

    @Autowired
    SkillRepository skillRepository;

    public void save(Skill skill) { skillRepository.saveAndFlush(skill); }

    public List<Skill> getAll() { return skillRepository.findAll(); }

    public List<Skill> getByStudentId(Integer id) { return skillRepository.getSkillsByStudentId(id); }

    public List<Skill> getByDiscipline (Discipline discipline) {
        ArrayList<Discipline> disciplines = new ArrayList<>();
        disciplines.add(discipline);
        return skillRepository.findAllByDisciplines(disciplines);
    }

    public void setSkillToDiscipline(Integer skillId, Integer disciplineId){
        skillRepository.setSkillToDiscipline(skillId, disciplineId);
    }

    public void removeSkillFromDiscipline(Integer skillId, Integer disciplineId){
        skillRepository.removeSkillFromDiscipline(skillId, disciplineId);
    }

}
