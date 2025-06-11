package com.example.afterSchoolLms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.afterSchoolLms.dto.User;
import com.example.afterSchoolLms.service.StudentService;

import jakarta.servlet.http.HttpSession;

@Controller
public class StudentController {
	
	@Autowired StudentService studentService;
	
	// 학생 메인페이지
	@GetMapping("/student/main")
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
	
	// 학생 비밀번호 수정 페이지
	@GetMapping("/student/updateInformation")
	public String updateInformation(HttpSession session, Model model) {
		return "/student/updateInformation";
	}
	
	@PostMapping("/student/updateInformation")
	public String updateInformation(@RequestParam String userId
			, @RequestParam String currentPw
			, @RequestParam String updatePw) {
		studentService.updatePw(userId, currentPw, updatePw);
		return "redirect:/student/main";
	}


}
