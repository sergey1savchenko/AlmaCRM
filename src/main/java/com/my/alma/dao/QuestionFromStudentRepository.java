package com.my.alma.dao;

import com.my.alma.model.QuestionFromStudent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QuestionFromStudentRepository extends JpaRepository<QuestionFromStudent, Integer> {
}
