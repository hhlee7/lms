package com.example.afterSchoolLms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
