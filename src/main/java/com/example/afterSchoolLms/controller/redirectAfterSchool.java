package com.example.afterSchoolLms.controller;

import org.springframework.web.bind.annotation.GetMapping;

import com.example.afterSchoolLms.dto.User;

import jakarta.servlet.http.HttpSession;

public class redirectAfterSchool {
	@GetMapping("/afterSchool")
	public String redirectAfterSchool(HttpSession session) {
	    User loginUser = (User) session.getAttribute("loginUser");

	    if (loginUser == null) {
	        return "redirect:/login";
	    }

	    // 역할별 방과후 페이지로 리디렉션
	    switch (loginUser.getRoleId()) {
	        case 1: return "redirect:/admin/main";
	        case 2: return "redirect:/student/main";
	        case 3: return "redirect:/teacher/main";
	        case 4: return "redirect:/parent/main";
	        case 5: return "redirect:/driver/main";
	        default: return "redirect:/login";
	    }
	}
}
