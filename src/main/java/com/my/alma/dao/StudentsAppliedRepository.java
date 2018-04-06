package com.my.alma.dao;

import com.my.alma.model.StudentsApplied;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentsAppliedRepository extends JpaRepository<StudentsApplied, Integer> {
}
