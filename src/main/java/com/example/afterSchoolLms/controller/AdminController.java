package com.example.afterSchoolLms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.afterSchoolLms.dto.Subject;
import com.example.afterSchoolLms.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
	@Autowired AdminService adminService;
	
	@GetMapping("userManagement")
	public String userManagement() {
		return "admin/userManagement";
	}
	
	// 과목 관리 페이지
	// 과목 리스트 조회
	@GetMapping({"/", "admin/subjectManagement"})
	public String subjectManagement(Model model) {
		List<Subject> subjectList = adminService.getSubjectList();
		model.addAttribute("subjectList", subjectList);
		return "admin/subjectManagement";
	}
	
	// 과목 추가 페이지
	@GetMapping("admin/createSubject")
	public String createSubject() {
		return "admin/createSubject";
	}
	
	// 과목 추가
	@PostMapping("admin/createSubject")
	public String createSubject(Subject subject) {
		adminService.createSubject(subject);
		return "redirect:/admin/subjectManagement";
	}
	
	// 과목 수정 페이지
	@GetMapping("admin/modifySubject")
	public String modifySubject(@RequestParam int subjectId, Model model) {
		Subject subject = adminService.getSubjectById(subjectId);
		model.addAttribute("subject", subject);
		return "admin/modifySubject";
	}
	
	// 해당 과목의 데이터 수정
	@PostMapping("admin/modifySubject")
	public String modifySubject(Subject subject) {
		adminService.modifySubject(subject);
		return "redirect:/admin/subjectManagement";
	}
}
