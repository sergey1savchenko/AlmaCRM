package com.my.alma.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.my.alma.model.UserAuth;


@Component
public class AuthenticationSuccessHandlerImpl implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		UserAuth userAuth = (UserAuth) auth.getPrincipal();
		HttpSession session = request.getSession();
		switch(userAuth.getRole()) {
		case "ADMIN":
			session.setAttribute("id", userAuth.getId());
			session.setAttribute("role", userAuth.getRole());
			response.sendRedirect("admin/main");
			break;
		case "STUDENT":
			session.setAttribute("id", userAuth.getId());
			session.setAttribute("role", userAuth.getRole());
			response.sendRedirect("student/main");
			break;
		case "TEACHER":
			session.setAttribute("id", userAuth.getId());
			session.setAttribute("role", userAuth.getRole());
			response.sendRedirect("teacher/main");
			break;
		case "AGENT":
			session.setAttribute("id", userAuth.getId());
			session.setAttribute("role", userAuth.getRole());
			response.sendRedirect("agent/main");
			break;
		case "WORKER":
			session.setAttribute("id", userAuth.getId());
			session.setAttribute("role", userAuth.getRole());
			response.sendRedirect("worker/main");
			break;
		default: response.sendRedirect("logout");
		}	
	}
}
