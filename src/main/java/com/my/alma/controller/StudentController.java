package com.my.alma.controller;

import com.my.alma.dao.UserRepository;
import com.my.alma.model.*;
import com.my.alma.service.*;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping( "/student" )
public class StudentController {

    @Autowired
    UserRepository userRepository;
    @Autowired
    StudentService studentService;
    @Autowired
    NewsService newsService;
    @Autowired
    GradeService gradeService;
    @Autowired
    DisciplineService disciplineService;
    @Autowired
    HostelService hostelService;
    @Autowired
    VacancyService vacancyService;
    @Autowired
    StudentsAppliedService studentsAppliedService;
    @Autowired
    QualificationProgramService qualificationProgramService;
    @Autowired
    SkillService skillService;
    @Autowired
    AgentService agentService;

    @RequestMapping( "/main" )
    public String main(Model model) {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession(true);
        User curUser = userRepository.findOne((Integer)session.getAttribute("id"));
        Student student = studentService.getStudentByUser(curUser);
        List<News> news = newsService.findByFacultyAndRole(student.getFaculty(), curUser.getRole());
        List<Grade> tempGrades = gradeService.gradesByStudent(student);
        List<Discipline> disciplines = disciplineService.getDisciplinesByStudentId(student.getId());
        model.addAttribute("news", news);
        model.addAttribute("grades", new HashSet<Grade>(tempGrades));
        model.addAttribute("disciplines", disciplines);
        return "/student/main";
    }

    @RequestMapping( "/feedback" )
    public String feedback(Model model) {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession(true);
        User curUser = userRepository.findOne((Integer)session.getAttribute("id"));
        Student student = studentService.getStudentByUser(curUser);
        List<Discipline> disciplines = disciplineService.getNotReviewedDisciplinesByStudent(student);
        HashSet<Review> reviews = student.getSetOfReviews();
        String room = "";
        if(student.getRoom()==null){
            room = "You have not yet settled in any hostel.";
        }else{
            room = student.getRoom().toString();
        }
        List<Hostel> hostels = hostelService.allHostels();
        model.addAttribute("disciplines", disciplines);
        model.addAttribute("reviews", reviews);
        model.addAttribute("room", room);
        model.addAttribute("hostels", hostels);
        return "/student/feedback";
    }

    @RequestMapping( "/career" )
    public String career(Model model) {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession(true);
        User curUser = userRepository.findOne((Integer)session.getAttribute("id"));
        Student student = studentService.getStudentByUser(curUser);
        List<Vacancy> vacancies = vacancyService.getVacanciesByFacultyId(student.getFaculty().getId());
        List<StudentsApplied> apps = studentsAppliedService.getByStudentId(student.getId());
        HashMap<Integer, Boolean> map = new HashMap<Integer, Boolean>();
        List<QualificationProgram> qualificationPrograms = qualificationProgramService.getAll();
        for(QualificationProgram qp : qualificationPrograms){
            HashSet<Skill> set = new HashSet<Skill>(qp.getSkills());
            qp.setSkills(new ArrayList<Skill>(set));
        }
        HashMap<Integer, Boolean> skillMap = new HashMap<>();
        List<Skill> studentSkills = skillService.getByStudentId(student.getId());
        for(StudentsApplied sa : apps)
            map.put(sa.getVacancy().getId(), true);
        for(Skill s : studentSkills)
            skillMap.put(s.getId(), true);
        model.addAttribute("vacancies", vacancies);
        model.addAttribute("map", map);
        model.addAttribute("qualificationPrograms", qualificationPrograms);
        model.addAttribute("skillMap", skillMap);
        return "/student/career";
    }

    @RequestMapping( "/questions" )
    public String questions(Model model) {
        List<Agent> agents = agentService.findAll();
        model.addAttribute("agents", agents);
        return "/student/questions";
    }

}
