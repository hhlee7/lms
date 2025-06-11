package com.example.afterSchoolLms.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentMapper {
	// 비밀번호 확인
	String checkPw(String id, String pw);
}
