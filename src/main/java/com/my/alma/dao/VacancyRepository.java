package com.my.alma.dao;

import com.my.alma.model.Agent;
import com.my.alma.model.Vacancy;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VacancyRepository extends JpaRepository<Vacancy, Integer> {

    List<Vacancy> getAllByAgent(Agent agent);

    List<Vacancy> getAllByFacultyId(final Integer facultyId);

}
