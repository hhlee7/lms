package com.example.afterSchoolLms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.afterSchoolLms.dto.AlbumPhoto;
import com.example.afterSchoolLms.dto.Attendance;
import com.example.afterSchoolLms.dto.Notice;
import com.example.afterSchoolLms.dto.Page;
import com.example.afterSchoolLms.dto.Qna;
import com.example.afterSchoolLms.dto.Subject;
import com.example.afterSchoolLms.dto.User;


@Mapper
public interface ParentMapper {
	
	// 공지사항
	List<Notice> notice(int beginRow, int size);
	
	// 공지사항 토탈카운트
	int totalCount(Page page);

	// 공지사항 상세페이지
	Notice noticeById(int noticeId);

	// 과목 전체
	List<Subject> selectSubject();
	
	// 과목 상세
	Subject selectSubjectOne(String subjectName);
	
	// 과목 상세 - 평균 평점 조회
	Double selectSubjectOneRating(String subjectName);
	
	// 과목 상세 - 리뷰 조회
	List<Map<String, Object>> selectSubjectOneReview(String subjectName);
	

	int updatePw(String id, String currentPw, String updatePw);

	String checkPw(String id, String pw);

	// 부모개인정보 수정시 자녀 정보 표시
	Map<String, Object> studentInfo(String userId);
	
	// 자녀 탑승 차량 조회
	Map<String, Object> vehicleInfo(String userId);

	// 자녀 수업 조회
	List<Map<String, Object>> subjectInfo(String userId);

	// 자녀 출결 조회
	List<Attendance> attendance(String userId);
	
	
	List<Map<String, Object>> selectAttendance(String studentId);
	
	// 수강신청 가능 리스트 출력
	List<Map<String, Object>> lectureList();

    // 전체 사진첩 조회 (검색+페이징)
    List<Map<String, Object>> selectAlbumList(Map<String, Object> param);
    
    // 전체 사진첩 총 개수 조회
    int countAlbumList(Map<String, Object> param);

	// 수강신청(기존 신청여부 확인)
    int isEnrolled(String studentId, int lectureId);
    // 신규 등록
    void lectureApply(String studentId, int lectureId);
    // 취소한 강의면 'cancel' -> 'PENDING'으로 수정
    int modifyCancelToPending(String studentId, int lectureId);
    
	// qna게시판
	int totalCountByParent();
	
	List<Qna> qnaList(String userId, int beginRow, int size);

	// qna 질문
	int insertQna(String userId, String question);

	// qna 수정
	int modifyQna(int qnaId, String question);
	
	// qna 삭제
	int qnaDelete(int qnaId);
	
	// 자녀 탑승 취소신청을 위한 FK키값 구해오기
	Map<String, Object> findPaymentAndAssignmentByParentId(String parentId);
	// 자녀 탑승 취소신청
	void insertVehicleCancel(Map<String, Object> param);

	// 수강신청 조회
	List<Map<String, Object>> lectureLegistrationList(String userId);

	// 수강료 결제
	int updateEnrollmentStatus(int lectureId, String studentId);
	void insertPayment(Map<String, Object> map);

	// 결제전 수강 취소
	void updateToCancel(int lectureId, String studentId, String status);
	
	// 환불처리 
	int refundLeture(Map<String, Object> param);

	// 수강 신청 리스트 -> 결제 및 취소 진행
	List<Map<String, Object>> getLecturePayOrCancel(String userId);

	Map<String, Object> getLectureDates(int lectureId);

	int hasOverlappingLecture(String studentId, String newStartDate, String newEndDate);

	// 강사 전체
	List<User> selectTeacher();
	
   // 강사 상세
   Map<String, Object> selectTeacherOne(String teacherId);
   
   // 강사 상세 - 평균 평점 조회
   Double selectTeacherOneRating(String teacherId);
   
   // 강사 상세 - 리뷰 조회
   List<Map<String, Object>> selectTeacherOneReview(String teacherId);

	// 사진첩 총개수(검색기능)
	int selectAlbumTotalCount(String searchWord);
	
	// 사진첩(검색기능)
	List<Map<String, Object>> selectAlbumtList(Map<String, Object> paramMap);
	
	// 앨범 상세 보기
	Map<String,Object> selectAlbumOne(int albumId);
	
	// 앨범 사진조회
	List<AlbumPhoto> selectAlbumPhotoList(int albumId);

	void autoCancelLectures();
	
}
