package com.example.afterSchoolLms.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.afterSchoolLms.service.AdminService;

@RestController
public class AdminRestController {
	@Autowired AdminService adminService;
	
	// 수업별 만족도 평가 통계 조회
	@PostMapping("/admin/lectureSatisfactionStats")
	public List<Map<String, Object>> getLectureSatisfactionStats() {
		return adminService.getLectureSatisfactionStats();
	}
	
	// 강사별 만족도 평가 통계 조회
	@PostMapping("/admin/teacherSatisfactionStats")
	public List<Map<String, Object>> getTeacherSatisfactionStats() {
		return adminService.getTeacherSatisfactionStats();
	}
}
