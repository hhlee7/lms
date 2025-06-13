package com.example.afterSchoolLms.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.afterSchoolLms.dto.Attendance;
import com.example.afterSchoolLms.dto.Notice;
import com.example.afterSchoolLms.dto.Page;
import com.example.afterSchoolLms.dto.Qna;
import com.example.afterSchoolLms.dto.Subject;
import com.example.afterSchoolLms.mapper.ParentMapper;

@Service
public class ParentService {
	@Autowired ParentMapper parentMapper;
	
	// 공지사항
	public List<Notice> notice(int beginRow, int size) {
		return parentMapper.notice(beginRow, size);
	}

	public int totalCount(Page page) {
		return parentMapper.totalCount(page);
	}
	
	// 공지사항 상세 페이지
	public Notice noticeById(int noticeId) {
		return parentMapper.noticeById(noticeId);
	}
	
	// 수업 상세페이지
	public Subject subjectOne(String subjectName) {
		return parentMapper.subjectOne(subjectName);
	}

	// 비밀번호 변경
	public int updatePw(String id, String currentPw, String updatePw) {
		return parentMapper.updatePw(id, currentPw, updatePw);
	}

	// 비밀번호 변경시 원래 비밀번호 맞는지 확인
	public String checkPw(String id, String pw) {
		return parentMapper.checkPw(id, pw);
	}
	
	// 부모 개인정보 수정 페이지에 학생 정보 표시
	public Map<String, Object> getStudentInfo(String userId) {
	    return parentMapper.studentInfo(userId);
	}
	
	// 자녀 탑승 차량 조회
	public Map<String, Object> getVehicleInfo(String userId) {
	    return parentMapper.vehicleInfo(userId);
	}

	// 자녀 수업 조회
	public Map<String, Object> getSubjectInfo(String userId) {
		return parentMapper.subjectInfo(userId);
	}

	// 자녀 출결 조회
	public List<Attendance> getAttendance(String userId) {
		return parentMapper.attendance(userId);
	}

	// 수강신청 가능 리스트 출력
	public List<Map<String, Object>> getLectureList() {
		return parentMapper.lectureList();
	}
	
	// 수강신청(결제x)
	public void lectureApply(String userId, int lectureId, String studentId) {
		int count = parentMapper.isEnrolled(studentId, lectureId);
		if (count == 0) {
	        parentMapper.lectureApply(studentId, lectureId);  // 정상 신청
	    } else {
	        // 이미 신청된 경우 예외 발생 (또는 사용자에게 알림)
	        throw new IllegalStateException("수강신청한 강의가 있습니다.");
	    }
	}
	
	// qna게시판
	public List<Qna> qnaList(int beginRow, int size) {
		return parentMapper.qnaList(beginRow, size);
	}
	
	// qna 질문
	public int insertQna(String userId, String question) {
		return parentMapper.insertQna(userId, question);
	}

	public int modifyQna(int qnaId, String question) {
		return parentMapper.modifyQna(qnaId, question);
	}

	public int qnaDelete(int qnaId) {
		return parentMapper.qnaDelete(qnaId);
	}
	
	// 배차 취소 신청
	public void insertVehicleCancel(String parentId, String reason) {
		Map<String, Object> map = parentMapper.findPaymentAndAssignmentByParentId(parentId);
		if (map != null) {
			int paymentId = (int) map.get("paymentId");
			int assignmentId = (int) map.get("assignmentId");
			
			Map<String, Object> param = new HashMap<>();
			param.put("paymentId", paymentId);
			param.put("assignmentId", assignmentId);
			param.put("reason", reason);
			
			    parentMapper.insertVehicleCancel(param);
			}
		
	}
	
	// 수강신청 내역
	public List<Map<String, Object>> getLectureLegistrationList(String userId) {
		return parentMapper.lectureLegistrationList(userId);
	}

	// 수강료 결제
	public void payment(int lectureId, String studentId, int amount) {
		Map<String, Object> param = new HashMap<>();
		param.put("lectureId", lectureId);
		param.put("studentId", studentId);
		param.put("amount", amount);
		
		int row = parentMapper.updateEnrollmentStatus(param);
		
		parentMapper.insertPayment(param);
	}

}
