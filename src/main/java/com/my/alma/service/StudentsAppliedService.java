package com.my.alma.service;

import com.my.alma.dao.StudentsAppliedRepository;
import com.my.alma.model.StudentsApplied;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentsAppliedService {

    @Autowired
    StudentsAppliedRepository studentsAppliedRepository;

    public List<StudentsApplied> getByAgentId(Integer agentId) { return studentsAppliedRepository.getByAgentId(agentId); }

    public List<StudentsApplied> getByStudentId(Integer studentId) { return studentsAppliedRepository.getByStudentId(studentId); }

    public void markAsArchived(Integer responseId) { studentsAppliedRepository.markAsArchived(responseId); }

    public void add(String resume, Integer vacancyId, Integer studentId){ studentsAppliedRepository.add(resume, vacancyId, studentId); }

}
