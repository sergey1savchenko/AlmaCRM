package com.my.alma.service;

import com.my.alma.dao.SkillRepository;
import com.my.alma.dao.StudentRepository;
import com.my.alma.dao.UserRepository;
import com.my.alma.model.Skill;
import com.my.alma.model.Student;
import com.my.alma.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

import static com.my.alma.service.util.PasswordEncoder.md5;

@Service
public class StudentService {

    @Autowired
    UserRepository userRepository;
    @Autowired
    StudentRepository studentRepository;
    @Autowired
    SkillRepository skillRepository;

    public void save(User tempUser, Student student) {
        tempUser.setPassword(md5(tempUser.getPassword()));
        userRepository.saveAndFlush(tempUser);
        User user = userRepository.getByEmail(tempUser.getEmail());
        student.setUser(user);
        studentRepository.saveAndFlush(student);
    }

    public Student getById(Integer id) { return studentRepository.findOne(id); }

    public Student getStudentByUser(User user) { return studentRepository.getByUser(user); }

    public List<Integer> getAllCourses() {
        ArrayList<Integer> courses = new ArrayList<>(studentRepository.getAllCourses());
        Collections.sort(courses);
        return courses;
    }

    public List<Student> getNotYetAddedToClassStudents(Integer classId, Integer facultyId, Integer year){
        ArrayList<Integer> ids = new ArrayList<>(studentRepository.getNotYetAddedToClassStudentsIds(classId, facultyId, year));
        ArrayList<Student> students = new ArrayList<>();
        for(Integer i : ids){
            students.add(studentRepository.findOne(i));
        }
        return students;
    }

    public List<Skill> getSkillsById(Integer studentId){ return skillRepository.getSkillsByStudentId(studentId); }

    public List<Student> getBySkills(HashSet<Integer> skillIds) {
        List<Integer> ids = studentRepository.getStudentIdsBySkills(skillIds);
        ArrayList<Student> students = new ArrayList<>();
        for(Integer i : ids)
            students.add(getById(i));
        return students;
    }
}
