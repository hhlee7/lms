package com.example.afterSchoolLms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.afterSchoolLms.dto.AlbumPhoto;
import com.example.afterSchoolLms.dto.Notice;
import com.example.afterSchoolLms.dto.Subject;
import com.example.afterSchoolLms.dto.User;

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
	Double selectSubjectOneRating(String subjectName);
	
	// 과목 상세 - 리뷰 조회
	List<Map<String, Object>> selectSubjectOneReview(String subjectName);
	
	// 학생 본인 끝난 수업 + 만족도 평가 조회
	List<Map<String, Object>> selectLectureDone(String id);
	
	// 학생 만족도 평가 입력
	int insertEvaluation(String paymentId, String teacherRating, String lectureRating);
	
	// 학생 리뷰 작성
	int insertReview(String satisfactionId, String content);
	
	// 학생이 작성한 만족도평가, 리뷰 보기
	List<Map<String, Object>> selectHistory(String paymentId);
	
	// 학생 본인 출결 조회
	List<Map<String, Object>> selectAttendance(String studentId);
	
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
}
