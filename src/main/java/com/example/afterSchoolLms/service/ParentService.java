package com.example.afterSchoolLms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.afterSchoolLms.dto.Notice;
import com.example.afterSchoolLms.dto.Page;
import com.example.afterSchoolLms.dto.Subject;
import com.example.afterSchoolLms.mapper.ParentMapper;

@Service
public class ParentService {
	@Autowired ParentMapper parentMapper;
	
	// 공지사항
	public List<Notice> notice(int beginRow, int size) {
		return parentMapper.notice(beginRow, size);
	}

	public int totalCount(Page page) {
		return parentMapper.totalCount(page);
	}
	
	// 공지사항 상세 페이지
	public Notice noticeById(int noticeId) {
		return parentMapper.noticeById(noticeId);
	}
	
	// 수업 상세페이지
	public Subject subjectOne(String subjectName) {
		return parentMapper.subjectOne(subjectName);
	}

	// 비밀번호 변경
	public int updatePw(String id, String currentPw, String updatePw) {
		return parentMapper.updatePw(id, currentPw, updatePw);
	}

	// 비밀번호 변경시 원래 비밀번호 맞는지 확인
	public String checkPw(String id, String pw) {
		return parentMapper.checkPw(id, pw);
	}

	public Map<String, Object> getStudentInfo(String userId) {
	    return parentMapper.studentInfo(userId);
	}

}
