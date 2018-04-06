package com.my.alma.dao;

import com.my.alma.model.QualificationProgram;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QualificationProgramRepository extends JpaRepository<QualificationProgram, Integer> {
}
