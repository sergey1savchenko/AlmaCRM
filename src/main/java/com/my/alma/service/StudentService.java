package com.my.alma.service;

import com.my.alma.dao.StudentRepository;
import com.my.alma.dao.UserRepository;
import com.my.alma.model.Student;
import com.my.alma.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.my.alma.service.util.PasswordEncoder.md5;

@Service
public class StudentService {

    @Autowired
    UserRepository userRepository;
    @Autowired
    StudentRepository studentRepository;

    public void save(User tempUser, Student student) {
        tempUser.setPassword(md5(tempUser.getPassword()));
        userRepository.saveAndFlush(tempUser);
        User user = userRepository.getByEmail(tempUser.getEmail());
        student.setUser(user);
        studentRepository.saveAndFlush(student);
    }

    public Student getStudentByUser(User user) { return studentRepository.getByUser(user); }

}
