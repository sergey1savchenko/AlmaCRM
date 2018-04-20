package com.my.alma.dao;

import com.my.alma.model.Student;
import com.my.alma.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentRepository extends JpaRepository<Student, Integer> {

    Student getByUser(User user);

}
