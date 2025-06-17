package com.example.afterSchoolLms.service;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.afterSchoolLms.dto.AlbumPhoto;
import com.example.afterSchoolLms.dto.Attendance;
import com.example.afterSchoolLms.dto.Notice;
import com.example.afterSchoolLms.dto.Page;
import com.example.afterSchoolLms.dto.Qna;
import com.example.afterSchoolLms.dto.Subject;
import com.example.afterSchoolLms.dto.User;
import com.example.afterSchoolLms.mapper.ParentMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
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
	
	// 과목 전체 검색
	public List<Subject> subject() {
		return parentMapper.selectSubject();
	}
	
	// 과목 상세 검색
	public Subject subjectOne(String subjectName) {
		return parentMapper.selectSubjectOne(subjectName);
	}
// 과목 상세 - 평균 평점 조회
	public Double subjectOneRating(String subjectName) {
		return parentMapper.selectSubjectOneRating(subjectName);
	}
	
	// 과목 상세 - 리뷰 조회
	public List<Map<String, Object>> subjectOneReview(String subjectName) {
		return parentMapper.selectSubjectOneReview(subjectName);
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
	public List<Map<String, Object>> getSubjectInfo(String userId) {
		return parentMapper.subjectInfo(userId);
	}

	// 수강신청 가능 리스트 출력
	public List<Map<String, Object>> getLectureList() {
		return parentMapper.lectureList();
	}
	
	// 수강신청(결제x)
	public void lectureApply(String userId, int lectureId, String studentId) {
		// 수강 강좌가 있는지 조회
		int count = parentMapper.isEnrolled(studentId, lectureId);
		
		if (count > 0) {
	        throw new IllegalStateException("이미 신청된 강의입니다.");
	    }
		
		// 해당 강의의 startDate, endDate 조회
	    Map<String, Object> dateMap = parentMapper.getLectureDates(lectureId); // 쿼리 필요
	    String newStartDate = (String) dateMap.get("startDate");
	    String newEndDate = (String) dateMap.get("endDate");
	    
	    // 날짜 겹치는지 확인
	    int overlap = parentMapper.hasOverlappingLecture(studentId, newStartDate, newEndDate);
	    if (overlap > 0) {
	        throw new IllegalStateException("기존 수강 강의와 일정이 겹칩니다.");
	    }

	    // 먼저 기존 신청이 취소된 건지 확인하여 다시 'PENDING'으로 변경
	    int modified = parentMapper.modifyCancelToPending(studentId, lectureId);

	    // 기존 취소건이 없었다면 신규 신청
	    if (modified == 0) {
	        parentMapper.lectureApply(studentId, lectureId);
	    }
	}
	
	// qna게시판
	public List<Qna> qnaList(String userId, int beginRow, int size) {
		return parentMapper.qnaList(userId, beginRow, size);
	}
	
	// qna total수
	public int totalCountByParent() {
		return parentMapper.totalCountByParent();
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
	@Transactional
	public void payment(@Param("lectureId")int lectureId, @Param("lectureId")String studentId
						, @Param("amount")int amount) {
		int row = parentMapper.updateEnrollmentStatus(lectureId, studentId);
		
		if(row == 0) {
			log.info("결제실패");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("lectureId", lectureId);
		map.put("studentId", studentId);
		map.put("amount", amount);
		
		
		parentMapper.insertPayment(map);
	}

	// 수강신청 리스트 -> 결제 or 취소 진행
	public List<Map<String, Object>> lecturePayOrCancel(String userId) {
		return parentMapper.getLecturePayOrCancel(userId);
	}
	
	// 수강 취소 (결제 전) PENDING -> CENCEL
	public void cancelLecture(int lectureId, String studentId, String status) {
		parentMapper.updateToCancel(lectureId, studentId, status);   // 결제 전 상태(status = PENDING) 상태면 단순히 cancel로 변경
	}
	
	// 환불요청 처리 PENDING -> REFUNDWAIT
	public void refundLeture(int lectureId, String studentId, String status, String startDate) {
		
		// 개강일 전 전까지 환불 가능을 위해 날짜 구해오기
		LocalDate start = LocalDate.parse(startDate);  // "yyyy-MM-dd" 형식
	    LocalDate today = LocalDate.now();
	    
	    LocalDate limitDate = today.plusDays(3); // 오늘 기준 일 전 날짜 계산
	    
	    if (start.isBefore(limitDate)) {
	        throw new IllegalArgumentException("개강일 3일 전까지만 환불 신청이 가능합니다.");
	    }
	    
		parentMapper.refundLeture(lectureId, studentId, status, startDate);	
	}

	// 강사 전체 검색
	public List<User> teacher() {
		return parentMapper.selectTeacher();
	}
	
   // 강사 상세 검색
   public Map<String, Object> teacherOne(String teacherId) {
      return parentMapper.selectTeacherOne(teacherId);
   }
   
   // 강사 상세 - 평균 평점 조회
   public Double teacherOneRating(String teacherId) {
      return parentMapper.selectTeacherOneRating(teacherId);
   }
   
   // 강사 상세 - 리뷰 조회
   public List<Map<String, Object>> teacherOneReview(String teacherId) {
      return parentMapper.selectTeacherOneReview(teacherId);
   }

	// 자녀 출결 조회
	public List<Map<String, Object>> selectAttendance(String studentId) {
		return parentMapper.selectAttendance(studentId);
	}
	
	// 사진첩 총개수(검색기능)
	public int albumTotalCount(String searchWord) {
		return parentMapper.selectAlbumTotalCount(searchWord);
	}
	
	// 사진첩(검색기능)
	public List<Map<String, Object>> albumList(Map<String, Object> paramMap) {
		return parentMapper.selectAlbumtList(paramMap);
	}
	
	// 앨범 상세보기
	public Map<String,Object> albumOne(int albumId){
		return parentMapper.selectAlbumOne(albumId);
	}
	
	// 앨범 사진조회
	public List<AlbumPhoto> albumPhotoList(int albumId){
		return parentMapper.selectAlbumPhotoList(albumId);
	}
}
