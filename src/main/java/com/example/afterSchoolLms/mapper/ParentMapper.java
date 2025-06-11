package com.example.afterSchoolLms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.afterSchoolLms.dto.Notice;
import com.example.afterSchoolLms.dto.Page;
import com.example.afterSchoolLms.dto.Subject;

@Mapper
public interface ParentMapper {
	
	// 공지사항
	List<Notice> notice(int beginRow, int size);
	
	// 공지사항 토탈카운트
	int totalCount(Page page);

	// 공지사항 상세페이지
	Notice noticeById(int noticeId);

	// 수업 정보
	Subject subjectOne(String subjectName);

	int updatePw(String id, String currentPw, String updatePw);

	String checkPw(String id, String pw);

	// 부모개인정보 수정시 자녀 정보 표시
	Map<String, Object> studentInfo(String userId);


}
