package com.example.afterSchoolLms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.afterSchoolLms.dto.Notice;
import com.example.afterSchoolLms.dto.Subject;

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
	
	// 과목 전체
	List<Subject> selectSubject();
	
	// 과목 상세
	Subject selectSubjectOne(String subjectName);
	
	// 과목 상세 - 평균 평점 조회
	double selectSubjectOneRating(String subjectName);
	
	// 과목 상세 - 리뷰 조회
	List<Map<String, Object>> selectSubjectOneReview(String subjectName);
	
	// 학생 본인 끝난 수업 + 만족도 평가
	List<Map<String, Object>> selectLectureDone(String id);
}
