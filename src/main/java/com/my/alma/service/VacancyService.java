package com.my.alma.service;

import com.my.alma.dao.VacancyRepository;
import com.my.alma.model.Agent;
import com.my.alma.model.Vacancy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VacancyService {

    @Autowired
    VacancyRepository vacancyRepository;

    public List<Vacancy> getVacanciesByAgent(Agent agent){ return vacancyRepository.getAllByAgent(agent); }

    public void save(Vacancy vacancy) { vacancyRepository.saveAndFlush(vacancy); }

    public void delete(Integer id) { vacancyRepository.delete(id); }

    public List<Vacancy> getVacanciesByFacultyId(Integer id) { return vacancyRepository.getAllByFacultyId(id); }

}
