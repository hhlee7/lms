package com.example.afterSchoolLms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.afterSchoolLms.dto.Notice;
import com.example.afterSchoolLms.dto.User;
import com.example.afterSchoolLms.mapper.DriverMapper;

@Service
@Transactional
public class DriverService {

	@Autowired DriverMapper driverMapper;
	
	// 개인정보 검색
	public User selectInformation(String userId, String password) {
		return driverMapper.selectInformation(userId, password);
	}
	
	// 개인정보 변경
	public int updateInformation(User user) {
		return driverMapper.updateInformation(user);
	}
	
	// 비밀번호 변경
	public int updatePw(String id, String currentPw, String updatePw) {
		return driverMapper.updatePw(id, currentPw, updatePw);
	}
	
	// 공지사항 총 개수
	public int totalCount() {
		return driverMapper.totalCount();
	}
	
	// 전체 공지사항
	public List<Notice> notice(int beginRow, int size) {
		return driverMapper.selectNotice(beginRow, size);
	}
	
	// 공지사항 하나
	public Notice noticeOne(int noticeId) {
		return driverMapper.selectNoticeOne(noticeId);
	}
		
	// 배차조회
	public List<Map<String, Object>> dispatch(String userId) {
		return driverMapper.selectDispatch(userId);
	}
	
	// 배차된 학생 조회
	public List<Map<String, Object>> dispatchStudent(String userId) {
		return driverMapper.selectDispatchStudent(userId);
	}
}
