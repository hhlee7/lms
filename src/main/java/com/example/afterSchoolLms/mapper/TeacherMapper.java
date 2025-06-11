package com.example.afterSchoolLms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TeacherMapper {
	// 수업 조회
	List<Map<String, Object>> selectLectureListByTeacher(String teacherId);
	// 학생 조회
	List<Map<String, Object>> selectStudentListByTeacher(String teacherId);
	// 배차 조회
	List<Map<String, Object>> selectStudentVehicleByTeacher(String teacherId);
	// 개인정보 조회
	Map<String, Object> selectTeacherProfile(String teacherId);
	// 개인정보 수정
	int updateTeacherProfile(Map<String, Object> paramMap);
	
}
