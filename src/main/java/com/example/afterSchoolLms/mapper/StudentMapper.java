package com.example.afterSchoolLms.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentMapper {
	
	// 비밀번호 변경시 원래 비밀번호 맞는지 확인
	String checkPw(String id, String pw);
	
	// 비밀번호 변경
	int updatePw(String id, String currentPw, String updatePw);
}
