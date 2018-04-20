package com.my.alma.controller;

import com.my.alma.dao.UserRepository;
import com.my.alma.model.News;
import com.my.alma.model.Student;
import com.my.alma.model.User;
import com.my.alma.service.FacultyService;
import com.my.alma.service.NewsService;
import com.my.alma.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping( "/student" )
public class StudentController {

    @Autowired
    UserRepository userRepository;
    @Autowired
    StudentService studentService;
    @Autowired
    NewsService newsService;

    @RequestMapping( "/main" )
    public String main(Model model) {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession(true);
        User curUser = userRepository.findOne((Integer)session.getAttribute("id"));
        Student student = studentService.getStudentByUser(curUser);
        List<News> news = newsService.findByFacultyAndRole(student.getFaculty(), curUser.getRole());

        model.addAttribute("student", student);
        model.addAttribute("news", news);
        return "/student/main";
    }

}
