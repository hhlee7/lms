package com.example.afterSchoolLms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.afterSchoolLms.dto.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class StudentController {
	
	// 학생 메인페이지
	@GetMapping("/stduent/main")
	public String main(HttpSession session, Model model) {
		User loginUser = (User) session.getAttribute("loginUser");
		model.addAttribute("loginUser", loginUser);
		return "/student/main";
	}
	
	// 학생 개인정보 페이지
	@GetMapping("/student/personalInformation")
	public String personalInformation(HttpSession session, Model model) {
		User loginUser = (User) session.getAttribute("loginUser");
		model.addAttribute("loginUser", loginUser);
		return "/student/personalInformation";
	}
	
	// 학생 개인정보 수정 페이지
	@GetMapping("/student/updateInformation")
	public String updateInformation(HttpSession session, Model model) {
		return "/student/updateInformation";
	}

}
