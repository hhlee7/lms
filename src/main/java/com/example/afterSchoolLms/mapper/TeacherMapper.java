package com.example.afterSchoolLms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Transactional;

@Mapper
@Transactional
public interface TeacherMapper {
    
    // 수업 조회: 강사 ID로 강사의 수업 목록 조회
    List<Map<String, Object>> selectLectureListByTeacher(String teacherId);
    
    // 학생 조회: 페이징 및 검색 포함, 강사 수업에 등록된 학생 목록 조회
    List<Map<String, Object>> selectStudentListByTeacher(Map<String, Object> param);
    
    // 학생 목록 총 개수 조회: 페이징 및 검색 조건에 따른 학생 목록 총 개수 반환
    int countStudentListByTeacher(Map<String, Object> param);
    
    // 배차 조회: 강사 ID로 강사의 수업에 배차된 차량 및 학생 정보 조회
    List<Map<String, Object>> selectStudentVehicleByTeacher(String teacherId);
    
    // 배차 목록 총 개수 조회: 페이징 및 검색 조건에 따른 배차 목록 총 개수 반환
    int countStudentVehicleByTeacher(Map<String, Object> param);
    
    // 개인정보 조회: 강사 ID로 강사의 개인정보 상세 조회
    Map<String, Object> selectTeacherProfile(String teacherId);
    
    // 개인정보 수정: 강사 개인정보 수정 (전화번호, 주소, 비밀번호 등)
    int updateTeacherProfile(Map<String, Object> paramMap);
    
    // 교보제 조회: 강사 ID로 강사가 사용하는 교보제 목록 조회
    List<Map<String, Object>> selectMaterialListByTeacher(String teacherId);
    
    // 교보제 요청: 교보제 요청 데이터 삽입
    void insertMaterialRequest(Map<String, Object> paramMap);
    
    // 출결 조회: 강사 ID로 본인 수업 학생들의 출결 목록 조회
    List<Map<String, Object>> selectAttendanceListByTeacher(Map<String, Object> param);
    
    // 출결 목록 총 개수 조회: 페이징 및 검색 조건에 따른 출결 목록 총 개수 반환
    int countAttendanceListByTeacher(Map<String, Object> param);
    
    // 출석 상태 업데이트: 출석 ID와 상태를 받아 출석 상태 수정
    int updateAttendanceStatus(@Param("attendanceId") int attendanceId, @Param("status") String status);
    
    // 공지사항 목록 조회: 페이징 및 키워드 검색 조건에 따른 공지사항 목록 조회
    List<Map<String, Object>> selectNoticeList(Map<String, Object> param);
    
    // 공지사항 총 개수 조회: 키워드 조건에 따른 전체 공지사항 개수 반환 (페이징용)
    int countNoticeList(String keyword);
    
    // 전체 사진첩 조회 (검색+페이징)
    List<Map<String, Object>> selectAlbumList(Map<String, Object> param);

    // 전체 사진첩 총 개수 조회
    int countAlbumList(Map<String, Object> param);

}
