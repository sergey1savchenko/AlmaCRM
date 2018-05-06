package com.my.alma.controller;

import com.my.alma.dao.RoleRepository;
import com.my.alma.dao.UserRepository;
import com.my.alma.model.*;
import com.my.alma.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

@Controller
@RequestMapping( "/agent" )
public class AgentController {

    @Autowired
    RoleRepository roleRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    AgentService agentService;
    @Autowired
    NewsService newsService;
    @Autowired
    StudentsAppliedService studentsAppliedService;
    @Autowired
    VacancyService vacancyService;
    @Autowired
    FacultyService facultyService;
    @Autowired
    SkillService skillService;
    @Autowired
    QualificationProgramService qualificationProgramService;

    @RequestMapping( "/main" )
    public String main(Model model) {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession(true);
        User curUser = userRepository.findOne((Integer)session.getAttribute("id"));
        Agent agent = agentService.getAgentByUser(curUser);
        List<News> news = newsService.findByFacultyAndRole(null, curUser.getRole());
        List<StudentsApplied> responses = studentsAppliedService.getByAgentId(agent.getId());
        List<QuestionFromStudent> questionFromStudents = agentService.questionFromStudentsByAgentId(agent.getId());
        List<Skill> allSkills = skillService.getAll();
        model.addAttribute("news", news);
        model.addAttribute("responses", responses);
        model.addAttribute("questionFromStudents", questionFromStudents);
        model.addAttribute("allSkills", allSkills);
        return "/agent/main";
    }

    @RequestMapping( "/vacancies" )
    public String vacancies(Model model) {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession(true);
        User curUser = userRepository.findOne((Integer)session.getAttribute("id"));
        Agent agent = agentService.getAgentByUser(curUser);
        List<Vacancy> vacancies = vacancyService.getVacanciesByAgent(agent);
        List<Faculty> faculties = facultyService.allFaculties();
        model.addAttribute("vacancies", vacancies);
        model.addAttribute("faculties", faculties);
        return "/agent/vacancies";
    }

    @RequestMapping( "/programs" )
    public String programs(Model model) {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession(true);
        User curUser = userRepository.findOne((Integer)session.getAttribute("id"));
        Agent agent = agentService.getAgentByUser(curUser);
        List<Skill> skills = skillService.getAll();
        List<QualificationProgram> qualificationPrograms = qualificationProgramService.getAllByAgent(agent);
        // HOTFIX :)
        for(QualificationProgram q : qualificationPrograms){
            HashSet<Skill> tmp = new HashSet<Skill>(q.getSkills());
            q.setSkills(new ArrayList<Skill>(tmp));
        }
        model.addAttribute("skills", skills);
        model.addAttribute("qualificationPrograms", qualificationPrograms);
        return "/agent/programs";
    }

}
