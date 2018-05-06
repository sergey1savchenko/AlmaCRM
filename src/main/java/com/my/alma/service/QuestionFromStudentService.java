package com.my.alma.service;

import com.my.alma.dao.QuestionFromStudentRepository;
import com.my.alma.model.QuestionFromStudent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionFromStudentService {

    @Autowired
    QuestionFromStudentRepository questionFromStudentRepository;

    public void markAsArchived(Integer questionId) { questionFromStudentRepository.markAsArchived(questionId); }

    public void add(QuestionFromStudent questionFromStudent) {
        questionFromStudentRepository.saveAndFlush(questionFromStudent);
    }
}
