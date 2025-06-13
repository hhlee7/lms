package com.example.afterSchoolLms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

// 로그아웃 필요해서 만듬 -- 조서진
@Controller
public class LogoutController {
	@GetMapping("/logout")
	public String logout(HttpSession session) {
	    session.invalidate(); // 세션 날림
	    return "redirect:/"; // 홈으로 이동
	}
}
