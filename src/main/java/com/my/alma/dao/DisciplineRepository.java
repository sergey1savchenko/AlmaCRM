package com.my.alma.dao;

import com.my.alma.model.Discipline;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DisciplineRepository extends JpaRepository<Discipline, Integer> {

    @Query(value = "SELECT DISTINCT discipline.* " +
            "FROM discipline INNER JOIN class c2 ON discipline.id = c2.disciplineId " +
            "INNER JOIN grade g ON c2.id = g.classId " +
            "WHERE studentId = ?1", nativeQuery = true)
    List<Discipline> getDisciplinesByStudentId (final Integer studentId);

    @Query(value = "SELECT DISTINCT discipline.* " +
            "FROM discipline INNER JOIN review r ON discipline.id = r.disciplineId " +
            "WHERE r.studentId = ?1", nativeQuery = true)
    List<Discipline> getReviewedDisciplinesByStudentId(final Integer studentId);

    @Query(value = "SELECT DISTINCT discipline.* " +
            "FROM discipline INNER JOIN disciplineskill d ON discipline.id = d.disciplineId " +
            "WHERE skillId = ?1", nativeQuery = true)
    List<Discipline> getDisciplinesBySkill(final Integer skillId);

}
