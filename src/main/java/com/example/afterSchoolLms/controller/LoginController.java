package com.example.afterSchoolLms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.afterSchoolLms.service.LoginService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LoginController {
	
	@Autowired LoginService userService;
	
	@GetMapping("/")
	public String login() {
		return "login";
	}
}
