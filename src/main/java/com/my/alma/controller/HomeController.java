package com.my.alma.controller;

import com.my.alma.dao.ErrorReportRepository;
import com.my.alma.model.ErrorReport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@Autowired
	ErrorReportRepository errorReportRepository;

	@RequestMapping({ "/", "", "/home", "/admin", "/user" })
	public String mainPage() {
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

	@RequestMapping( "/testSession" )
	public String test() {
		ErrorReport er = new ErrorReport();
		er.setAuthorName("Ivan Mazepa");
		er.setEmail("a@a.a");
		er.setText("HELLO");
		errorReportRepository.saveAndFlush(er);
		return "/home";
	}

}