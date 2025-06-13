package com.example.afterSchoolLms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.afterSchoolLms.dto.User;
import com.example.afterSchoolLms.service.LoginService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LoginController {
	
	@Autowired LoginService loginService;
	
	@GetMapping({"/","login"})
	public String login() {
		return "login";
	}
	
	@PostMapping("login")
	public String login(User user, HttpSession session) {
		User loginUser = loginService.login(user);
		if(loginUser == null) {
			return "redirect:/";
		}
		
		session.setAttribute("loginUser", loginUser);
		
		switch(loginUser.getRoleId()) {
			case 1:							// 관리자
				return "redirect:/adminMain";
			case 2:							// 학생
				return "redirect:/student/main";
			case 3:							// 강사
				return "/teacher/test";
			case 4:							// 학부모
				return "/parent/test";
			case 5:							// 운전기사
				return "redirect:/driver/main";
		}
		return "";
	}
}
