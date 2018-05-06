package com.my.alma.controller;

import com.my.alma.dao.ClassTypeRepository;
import com.my.alma.dao.RoleRepository;
import com.my.alma.dao.UserRepository;
import com.my.alma.model.*;
import com.my.alma.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
    @Autowired
    ClazzService clazzService;
    @Autowired
    SkillService skillService;
    @Autowired
    StudentService studentService;

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
        List<Skill> allSkills = skillService.getAll();
        model.addAttribute("news", news);
        model.addAttribute("roles", roles);
        model.addAttribute("faculties", faculties);
        model.addAttribute("disciplines", disciplines);
        model.addAttribute("classes", classes);
        model.addAttribute("classTypes", classTypes);
        model.addAttribute("allSkills", allSkills);
        return "/teacher/main";
    }

    @RequestMapping( "/showClass/{classId}" )
    public String showClass(Model model, @PathVariable Integer classId) {
        Clazz clazz = clazzService.getById(classId);
        Set<Grade> grades = clazz.getDistGrades();
        List<Faculty> faculties = facultyService.allFaculties();
        List<Integer> years = studentService.getAllCourses();
        model.addAttribute("clazz", clazz);
        model.addAttribute("grades", grades);
        model.addAttribute("faculties", faculties);
        model.addAttribute("years", years);
        return "/teacher/clazz";
    }
}
