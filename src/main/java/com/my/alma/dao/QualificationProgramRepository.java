package com.my.alma.dao;

import com.my.alma.model.Agent;
import com.my.alma.model.QualificationProgram;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface QualificationProgramRepository extends JpaRepository<QualificationProgram, Integer> {

    List<QualificationProgram> findAllByAgent(final Agent agent);

    @Transactional
    @Modifying
    @Query(value = "INSERT INTO qualificationprogramskill(skillId, qualificationProgramId) VALUES(?1, ?2)", nativeQuery = true)
    void setSkillToProgram(final Integer skillId, final Integer newProgramId);
}
