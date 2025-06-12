package com.example.afterSchoolLms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.afterSchoolLms.dto.Attendance;
import com.example.afterSchoolLms.dto.Notice;
import com.example.afterSchoolLms.dto.Page;
import com.example.afterSchoolLms.dto.Subject;
import com.example.afterSchoolLms.dto.Lecture;

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
	
	// 자녀 탑승 차량 조회
	Map<String, Object> vehicleInfo(String userId);

	// 자녀 수업 조회
	Map<String, Object> subjectInfo(String userId);

	// 자녀 출결 조회
	List<Attendance> attendance(String userId);
	
	// 수강신청 가능 리스트 출력
	List<Map<String, Object>> lectureList();

    // 전체 사진첩 조회 (검색+페이징)
    List<Map<String, Object>> selectAlbumList(Map<String, Object> param);
    
    // 전체 사진첩 총 개수 조회
    int countAlbumList(Map<String, Object> param);

}
