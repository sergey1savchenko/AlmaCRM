package com.my.alma.dao;

import com.my.alma.model.Student;
import com.my.alma.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Repository
public interface StudentRepository extends JpaRepository<Student, Integer> {

    Student getByUser(User user);

    @Query(value = "SELECT DISTINCT(course) FROM student", nativeQuery = true)
    List<Integer> getAllCourses();

    @Query(value = "SELECT student.id " +
            "FROM student " +
            "WHERE facultyId = ?2 AND " +
            "course = ?3 AND " +
            "id NOT IN (" +
                        "SELECT studentId " +
                        "FROM grade " +
                        "WHERE classId = ?1" +
            ")", nativeQuery = true)
    List<Integer> getNotYetAddedToClassStudentsIds(final Integer classId, final Integer facultyId, final Integer year);

    @Query(value = "SELECT DISTINCT student.id " +
            "FROM student INNER JOIN grade g ON student.id = g.studentId " +
            "INNER JOIN class c2 ON g.classId = c2.id " +
            "INNER JOIN discipline ON c2.disciplineId = discipline.id " +
            "INNER JOIN disciplineskill d ON discipline.id = d.disciplineId " +
            "WHERE d.skillId IN :ids", nativeQuery = true)
    List<Integer> getStudentIdsBySkills(@Param("ids") Set<Integer> ids);
}
