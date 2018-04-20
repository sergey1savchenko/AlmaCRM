package com.my.alma.dao;

import com.my.alma.model.Teacher;
import com.my.alma.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface TeacherRepository extends JpaRepository<Teacher, Integer> {

    @Modifying
    @Transactional
    @Query(value = "INSERT INTO teacherdiscipline(teacherId, disciplineId) VALUES (?1, ?2);", nativeQuery = true)
    void addTeacherToDiscipline(final Integer teacherId, final Integer disciplineId);

    Teacher getByUser (User user);

}
