package com.example.afterSchoolLms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.afterSchoolLms.dto.Subject;

@Mapper
public interface AdminMapper {
	// 과목 조회
	List<Subject> selectSubjectList();
	
	// 과목 추가
	int createSubject(Subject subject);
	
	// 과목 수정 페이지에 표기할 데이터 값을 subjectId를 통해 조회
	Subject selectSubjectById(int subjectId);
	
	// 해당 과목의 데이터 수정
	void modifySubject(Subject subject);
}
