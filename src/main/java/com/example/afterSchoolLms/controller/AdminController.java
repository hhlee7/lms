package com.example.afterSchoolLms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
	
	@GetMapping("userManagement")
	public String userManagement() {
		return "admin/userManagement";
	}
}
