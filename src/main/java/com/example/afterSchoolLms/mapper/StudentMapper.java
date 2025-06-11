package com.example.afterSchoolLms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.afterSchoolLms.dto.Notice;

@Mapper
public interface StudentMapper {
	
	// 비밀번호 변경시 원래 비밀번호 맞는지 확인
	String checkPw(String id, String pw);
	
	// 비밀번호 변경
	int updatePw(String id, String currentPw, String updatePw);
	
	// 학생 본인 수업조회
	List<Map<String, Object>> selectLecture(String id);
	
	// 학생 본인 배차조회
	List<Map<String, Object>> selectDisptach(String id);
	
	// 공지사항 총 개수
	int totalCount();
	
	// 전체 공지사항
	List<Notice> selectNotice(int beginRow, int size);
	
	// 공지사항 하나
	Notice selectNoticeOne(int noticeId);
}
