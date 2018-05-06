package com.my.alma.dao;

import com.my.alma.model.StudentsApplied;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface StudentsAppliedRepository extends JpaRepository<StudentsApplied, Integer> {

    @Query(value = "SELECT studentsapplied.* " +
            "FROM studentsapplied INNER JOIN vacancy ON studentsapplied.vacancyId = vacancy.id " +
            "INNER JOIN agent a ON vacancy.agentId = a.id " +
            "WHERE a.id = ?1 " +
            "ORDER BY studentsapplied.id DESC", nativeQuery = true)
    List<StudentsApplied> getByAgentId(final Integer agentId);

    @Query(value = "SELECT studentsapplied.* " +
            "FROM studentsapplied " +
            "WHERE studentsapplied.studentId = ?1 " +
            "ORDER BY studentsapplied.id DESC", nativeQuery = true)
    List<StudentsApplied> getByStudentId(final Integer studentId);

    @Transactional
    @Modifying
    @Query(value = "UPDATE studentsapplied " +
            "SET statusId = 2 " +
            "WHERE id = ?1", nativeQuery = true)
    void markAsArchived(final Integer responseId);

    @Transactional
    @Modifying
    @Query(value = "INSERT INTO studentsapplied(resume, vacancyId, studentId, statusId) " +
            "VALUES(?1, ?2, ?3, 1);", nativeQuery = true)
    void add(final String resume, final Integer vacancyId, final Integer studentId);
}
