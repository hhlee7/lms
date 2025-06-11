package com.example.afterSchoolLms.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.example.afterSchoolLms.service.StudentService;

@RestController
public class Rest {
	@Autowired StudentService studentService;
	
	// 비밀번호 맞는지 확인 - 황귀환
	
	
	@GetMapping("/checkPw/{userId}/{currentPw}")
	public boolean checkPw(@PathVariable String userId
			, @PathVariable String currentPw) {
		
		if ()
		return true;
	}
}
