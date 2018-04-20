package com.my.alma.controller;

import com.my.alma.dao.RoleRepository;
import com.my.alma.model.*;
import com.my.alma.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping( "/admin" )
public class AdminController {

    @Autowired
    RoleRepository roleRepository;
    @Autowired
    FacultyService facultyService;
    @Autowired
    SpecialtyService specialtyService;
    @Autowired
    DisciplineService disciplineService;
    @Autowired
    TeacherService teacherService;
    @Autowired
    HostelService hostelService;
    @Autowired
    ErrorReportService errorReportService;
    @Autowired
    ApplicantsApplicationService applicantsApplicationService;
    @Autowired
    ReviewService reviewService;

    @RequestMapping( "/main" )
    public String main(Model model) {
        List<Faculty> faculties = facultyService.allFaculties();
        List<Specialty> specialties = specialtyService.allSpecialties();
        List<Discipline> disciplines = disciplineService.allDisciplines();
        List<Teacher> teachers = teacherService.allTeachers();
        List<Hostel> hostels = hostelService.allHostels();
        List<Role> roles = roleRepository.findAll();
        List<ErrorReport> errorReports = errorReportService.allErrorReports();
        List<ApplicantsApplication> applicantsApplications = applicantsApplicationService.allApplicantsApplications();
        model.addAttribute("faculties", faculties);
        model.addAttribute("specialties", specialties);
        model.addAttribute("disciplines", disciplines);
        model.addAttribute("teachers", teachers);
        model.addAttribute("hostels", hostels);
        model.addAttribute("roles", roles);
        model.addAttribute("reports", errorReports);
        model.addAttribute("apps", applicantsApplications);
        return "/admin/main";
    }

    @RequestMapping( "/reviews" )
    public String reviews(Model model) {
        List<Review> reviews = reviewService.getReviews();
        model.addAttribute("reviews", reviews);
        return "/admin/reviews";
    }
}
