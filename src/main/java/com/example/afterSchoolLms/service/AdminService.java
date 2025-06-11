package com.example.afterSchoolLms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.afterSchoolLms.dto.Subject;
import com.example.afterSchoolLms.mapper.AdminMapper;

@Service
public class AdminService {
	@Autowired AdminMapper adminMapper;
	
	// 과목 조회
	public List<Subject> getSubjectList() {
		return adminMapper.selectSubjectList();
	}
	
	// 과목 추가
	public void createSubject(Subject subject) {
		adminMapper.createSubject(subject);
	}
	
	// 과목 수정 페이지에 표기할 데이터 값을 subjectId를 통해 조회
	public Subject getSubjectById(int subjectId) {
		return adminMapper.selectSubjectById(subjectId);
	}

	// 해당 과목의 데이터 수정
	public void modifySubject(Subject subject) {
		adminMapper.modifySubject(subject);
	}
}
