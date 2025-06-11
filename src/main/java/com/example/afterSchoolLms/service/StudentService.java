package com.example.afterSchoolLms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.afterSchoolLms.dto.Notice;
import com.example.afterSchoolLms.mapper.StudentMapper;

@Service
@Transactional
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
	
	// 학생 본인 수업조회
	public List<Map<String, Object>> selectLecture(String id) {
		return studentMapper.selectLecture(id);
	}
	
	// 학생 본인 배차조회
	public List<Map<String, Object>> selectDisptach(String id) {
		return studentMapper.selectDisptach(id);
	}
	
	// 공지사항 총 개수
	public int totalCount() {
		return studentMapper.totalCount();
	}
	
	// 전체 공지사항
	public List<Notice> notice(int beginRow, int size) {
		return studentMapper.selectNotice(beginRow, size);
	}
	
	// 공지사항 하나
	public Notice noticeOne(int noticeId) {
		return studentMapper.selectNoticeOne(noticeId);
	}
}
