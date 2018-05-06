package com.my.alma.dao;

import com.my.alma.model.Discipline;
import com.my.alma.model.Skill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface SkillRepository extends JpaRepository<Skill, Integer> {

    List<Skill> findAllByDisciplines(List<Discipline> disciplines);

    @Transactional
    @Modifying
    @Query(value = "INSERT INTO disciplineskill(disciplineId, skillId) VALUES(?2, ?1);", nativeQuery = true)
    void setSkillToDiscipline(final Integer skillId, final Integer disciplineId);

    @Transactional
    @Modifying
    @Query(value = "DELETE FROM disciplineskill " +
                   "WHERE skillId = ?1 " +
                   "AND disciplineId = ?2", nativeQuery = true)
    void removeSkillFromDiscipline(final Integer skillId, final Integer disciplineId);

    @Query(value = "SELECT DISTINCT s.* " +
            "FROM student INNER JOIN grade g ON student.id = g.studentId " +
            "INNER JOIN class c2 ON g.classId = c2.id " +
            "INNER JOIN discipline d ON c2.disciplineId = d.id " +
            "INNER JOIN disciplineskill d2 ON d.id = d2.disciplineId " +
            "INNER JOIN skill s ON d2.skillId = s.id " +
            "WHERE student.id = ?1", nativeQuery = true)
    List<Skill> getSkillsByStudentId(final Integer studentId);
}
