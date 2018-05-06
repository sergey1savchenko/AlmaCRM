package com.my.alma.dao;

import com.my.alma.model.Clazz;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface ClazzRepository extends JpaRepository<Clazz, Integer> {

    @Modifying
    @Transactional
    @Query (value = "INSERT INTO teacherclass(teacherId, classId) VALUES (?1, ?2);", nativeQuery = true)
    void addTeacherToClass(final Integer teacherId, final Integer classId);

    @Modifying
    @Transactional
    @Query (value = "INSERT INTO grade(studentId, classId, presence, mark) VALUES (?1, ?2, FALSE, 0);", nativeQuery = true)
    void setStudentToClass(final Integer studentId, final Integer classId);

    @Modifying
    @Transactional
    @Query (value = "UPDATE grade SET presence = ?3 WHERE classId = ?1 AND studentId = ?2", nativeQuery = true)
    void setStudentClassPresence(final Integer classId, final Integer studentId, final Boolean isPresent);

    @Modifying
    @Transactional
    @Query (value = "UPDATE grade SET mark = ?3 WHERE classId = ?1 AND studentId = ?2", nativeQuery = true)
    void setStudentClassGrade(final Integer classId, final Integer studentId, final Integer grade);
}
