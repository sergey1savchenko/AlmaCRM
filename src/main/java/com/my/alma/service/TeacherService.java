package com.my.alma.service;

import com.my.alma.dao.TeacherRepository;
import com.my.alma.dao.UserRepository;
import com.my.alma.model.Discipline;
import com.my.alma.model.Teacher;
import com.my.alma.model.User;
import org.hibernate.mapping.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import static com.my.alma.service.util.PasswordEncoder.md5;

@Service
public class TeacherService {

    @Autowired
    UserRepository userRepository;
    @Autowired
    TeacherRepository teacherRepository;

    public void save(User tempUser, Teacher teacher){
        tempUser.setPassword(md5(tempUser.getPassword()));
        userRepository.saveAndFlush(tempUser);
        User user = userRepository.getByEmail(tempUser.getEmail());
        teacher.setUser(user);
        teacherRepository.saveAndFlush(teacher);
    }

    public List<Teacher> allTeachers(){return teacherRepository.findAll(); }

    public List<Discipline> getDisciplinesByTeacherId(Integer teacherId){
        Teacher teacher = teacherRepository.findOne(teacherId);
        if(null==teacher.getDisciplines() || teacher.getDisciplines().isEmpty()){
            ArrayList<Discipline> disciplines = new ArrayList<Discipline>();
            return disciplines;
        }else{
            ArrayList<Discipline> disciplines = new ArrayList<Discipline>(teacher.getDisciplines());
            return  disciplines;
        }
    }

    public void setDiscipline(Integer teacherId, Integer disciplineId){
        teacherRepository.addTeacherToDiscipline(teacherId, disciplineId);
    }

    public Teacher getTeacherByUser(User user) { return teacherRepository.getByUser(user); }

}
