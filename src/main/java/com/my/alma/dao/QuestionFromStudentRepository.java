package com.my.alma.dao;

import com.my.alma.model.QuestionFromStudent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface QuestionFromStudentRepository extends JpaRepository<QuestionFromStudent, Integer> {

    @Query(value = "SELECT questionfromstudent.* " +
            "FROM questionfromstudent INNER JOIN agent a ON questionfromstudent.agentId = a.id " +
            "WHERE a.id = ?1 " +
            "ORDER BY questionfromstudent.id DESC ", nativeQuery = true)
    List<QuestionFromStudent> questionFromStudentsByAgentId(final Integer agentId);

    @Transactional
    @Modifying
    @Query(value = "UPDATE questionfromstudent " +
            "SET statusId = 2 " +
            "WHERE id = ?1", nativeQuery = true)
    void markAsArchived(final Integer questionId);

}
