package com.example.afterSchoolLms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.afterSchoolLms.dto.Notice;
import com.example.afterSchoolLms.dto.Subject;
import com.example.afterSchoolLms.dto.User;
import com.example.afterSchoolLms.mapper.StudentMapper;

@Service
@Transactional
public class StudentService {
	
	@Autowired StudentMapper studentMapper;
	
	// 비밀번호 변경시 원래 비밀번호 맞는지 확인
	public String checkPw(String id, String pw) {
		return studentMapper.checkPw(id, pw);
	}
	
	// 비밀번호 변경
	public int updatePw(String id, String currentPw, String updatePw) {
		return studentMapper.updatePw(id, currentPw, updatePw);
	}
	
	// 학생 본인 수업조회
	public List<Map<String, Object>> selectLecture(String id) {
		return studentMapper.selectLecture(id);
	}
	
	// 학생 본인 배차조회
	public List<Map<String, Object>> selectDisptach(String id) {
		return studentMapper.selectDisptach(id);
	}
	
	// 공지사항 총 개수
	public int totalCount() {
		return studentMapper.totalCount();
	}
	
	// 전체 공지사항
	public List<Notice> notice(int beginRow, int size) {
		return studentMapper.selectNotice(beginRow, size);
	}
	
	// 공지사항 하나
	public Notice noticeOne(int noticeId) {
		return studentMapper.selectNoticeOne(noticeId);
	}
	
	// 과목 전체 검색
	public List<Subject> subject() {
		return studentMapper.selectSubject();
	}
	
	// 과목 상세 검색
	public Subject subjectOne(String subjectName) {
		return studentMapper.selectSubjectOne(subjectName);
	}
	
	// 과목 상세 - 평균 평점 조회
	public Double subjectOneRating(String subjectName) {
		return studentMapper.selectSubjectOneRating(subjectName);
	}
	
	// 과목 상세 - 리뷰 조회
	public List<Map<String, Object>> subjectOneReview(String subjectName) {
		return studentMapper.selectSubjectOneReview(subjectName);
	}
	
	// 학생 본인 끝난 수업 + 만족도 평가 조회
	public List<Map<String, Object>> selectLectureDone(String id) {
		return studentMapper.selectLectureDone(id);
	}
	
	// 학생 만족도 평가 입력
	public int insertEvaluation(String paymentId, String teacherRating, String lectureRating) {
		return studentMapper.insertEvaluation(paymentId, teacherRating, lectureRating);
	}
	
	// 학생 리뷰 작성
	public int insertReview(String satisfactionId, String content) {
		return studentMapper.insertReview(satisfactionId, content);
	}
	
	// 학생이 작성한 만족도평가, 리뷰 보기
	public List<Map<String, Object>> selectHistory(String paymentId) {
		return studentMapper.selectHistory(paymentId);
	}
	
	// 학생 본인 출결 조회
	public List<Map<String, Object>> selectAttendance(String studentId) {
		return studentMapper.selectAttendance(studentId);
	}
	
	// 강사 전체 검색
	public List<User> teacher() {
		return studentMapper.selectTeacher();
	}
	
	// 강사 상세 검색
	public Map<String, Object> teacherOne(String teacherId) {
		return studentMapper.selectTeacherOne(teacherId);
	}
	
	// 강사 상세 - 평균 평점 조회
	public Double teacherOneRating(String teacherId) {
		return studentMapper.selectTeacherOneRating(teacherId);
	}
	
	// 강사 상세 - 리뷰 조회
	public List<Map<String, Object>> teacherOneReview(String teacherId) {
		return studentMapper.selectTeacherOneReview(teacherId);
	}
}
