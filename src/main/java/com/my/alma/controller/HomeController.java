package com.my.alma.controller;

import com.my.alma.dao.ErrorReportRepository;
import com.my.alma.dao.UserRepository;
import com.my.alma.model.ErrorReport;
import com.my.alma.model.Faculty;
import com.my.alma.model.News;
import com.my.alma.model.User;
import com.my.alma.service.FacultyService;
import com.my.alma.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeController {

	@Autowired
	UserRepository userRepository;
	@Autowired
	NewsService newsService;
	@Autowired
	FacultyService facultyService;

	@RequestMapping({"", "/", "/home"})
	public String mainPage(Model model) {
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpSession session = attr.getRequest().getSession(true);
		List<News> news;
		try {
			User curUser = userRepository.findOne((Integer)session.getAttribute("id"));
			news = newsService.findByFacultyAndRole(null, curUser.getRole());
		} catch (Exception exception) {
			news = newsService.findByFacultyAndRole(null, null);
		}
		List<Faculty> faculties = facultyService.allFaculties();
		model.addAttribute("news", news);
		model.addAttribute("faculties", faculties);
		return "/home";
	}

	@RequestMapping( "/login" )
	public String login() {
		return "/login";
	}

	@RequestMapping( "/logout" )
	public String logout() {
		return "/logout";
	}

}
