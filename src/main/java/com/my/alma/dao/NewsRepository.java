package com.my.alma.dao;

import com.my.alma.model.Faculty;
import com.my.alma.model.News;
import com.my.alma.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NewsRepository extends JpaRepository<News, Integer> {

    News findById(Integer id);

    List<News> findByFacultyAndRoleOrderByDateDesc(Faculty faculty, Role role);

}
