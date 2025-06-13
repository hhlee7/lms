package com.example.afterSchoolLms.mapper;

import java.util.List;
import java.util.Map;

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
	
	// 배차 조회
	List<Map<String, Object>> selectDispatch(String userId);
	
	// 배차된 학생 조회
	List<Map<String, Object>> selectDispatchStudent(String userId);
}
