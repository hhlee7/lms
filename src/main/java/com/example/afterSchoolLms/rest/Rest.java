package com.example.afterSchoolLms.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.example.afterSchoolLms.service.ParentService;

@RestController
public class Rest {
	@Autowired ParentService parentService;
	@GetMapping("/checkPw/{userId}/{currentPw}")
	public boolean checkPw(@PathVariable String userId
			, @PathVariable String currentPw) {
		
		if (parentService.checkPw(userId, currentPw) != null) {
			return true;
		}
		return false;
	}
}
