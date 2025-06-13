package com.example.afterSchoolLms.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.afterSchoolLms.dto.User;

@Mapper
public interface DriverMapper {

	// 기사 개인정보 검색
	User selectInformation(String id, String password);
	
	// 개인정보 변경
	int updateInformation(User user);
	
	// 비밀번호 변경
	int updatePw(String id, String currentPw, String updatePw);
}
