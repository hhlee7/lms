package com.example.afterSchoolLms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.afterSchoolLms.mapper.StudentMapper;

@Service
public class StudentService {
	
	@Autowired StudentMapper studentMapper;
	
	// 비밀번호 변경시 원래 비밀번호 맞는지 확인
	public String checkPw(String id, String pw) {
		return studentMapper.checkPw(id, pw);
	}
	
	// 비밀번호 변경
	public int updatePw(String id, String currentPw, String updatePw) {
		return studentMapper.updatePw(id, currentPw, updatePw);
	}
}
