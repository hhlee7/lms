package com.example.afterSchoolLms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.afterSchoolLms.mapper.StudentMapper;

@Service
public class StudentService {
	
	@Autowired StudentMapper studentMapper;
	
	public String checkPw(String id, String pw) {
		return studentMapper.checkPw(id, pw);
	}
}
