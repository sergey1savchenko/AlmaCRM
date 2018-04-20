package com.my.alma.controller;

import com.my.alma.dao.ClassTypeRepository;
import com.my.alma.dao.RoleRepository;
import com.my.alma.dao.UserRepository;
import com.my.alma.model.*;
import com.my.alma.service.DisciplineService;
import com.my.alma.service.FacultyService;
import com.my.alma.service.NewsService;
import com.my.alma.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping( "/teacher" )
public class TeacherController {

    @Autowired
    RoleRepository roleRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    ClassTypeRepository classTypeRepository;
    @Autowired
    TeacherService teacherService;
    @Autowired
    NewsService newsService;
    @Autowired
    FacultyService facultyService;
    @Autowired
    DisciplineService disciplineService;

    @RequestMapping( "/main" )
    public String main(Model model) {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession(true);
        User curUser = userRepository.findOne((Integer)session.getAttribute("id"));
        Teacher teacher = teacherService.getTeacherByUser(curUser);
        List<News> news = newsService.findByFacultyAndRole(teacher.getFaculty(), curUser.getRole());
        List<Role> roles = roleRepository.findAll();
        List<Faculty> faculties = facultyService.allFaculties();
        List<Discipline> disciplines = new ArrayList<>(teacher.getDisciplines());
        List<Clazz> classes = new ArrayList<>(teacher.getClasses());
        List<ClassType> classTypes = classTypeRepository.findAllByOrderByIdAsc();
        model.addAttribute("news", news);
        model.addAttribute("roles", roles);
        model.addAttribute("faculties", faculties);
        model.addAttribute("disciplines", disciplines);
        model.addAttribute("classes", classes);
        model.addAttribute("classTypes", classTypes);
        return "/teacher/main";
    }

}
