package com.my.alma.service;

import com.my.alma.dao.NewsRepository;
import com.my.alma.model.Faculty;
import com.my.alma.model.News;
import com.my.alma.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsService{

    @Autowired
    NewsRepository newsRepository;

    public List<News> findByFacultyAndRole(Faculty faculty, Role role) {
        return newsRepository.findByFacultyAndRoleOrderByDateDesc(faculty, role);
    }

    public void save(News news) { newsRepository.saveAndFlush(news); }

}
