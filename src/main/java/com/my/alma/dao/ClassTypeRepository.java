package com.my.alma.dao;

import com.my.alma.model.ClassType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClassTypeRepository extends JpaRepository<ClassType, Integer> {
}
