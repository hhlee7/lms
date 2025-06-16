package com.example.afterSchoolLms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AttendanceMapper {
    // 매일 자정 출결 초기화: 모든 수강생에게 오늘 날짜 기준으로 '결석' 기록 추가
    void insertDailyDefaultAttendance();
    
    // 강사용 출석 체크 리스트 (오늘 날짜 기준)
    List<Map<String, Object>> selectAttendanceCheckListByTeacher(String teacherId);
    
    // 출석체크
    int updateAttendanceStatus(@Param("attendanceId") int attendanceId, @Param("status") String status);

    // 오늘 요일 기준 수업 ID 조회
    void insertAttendance(@Param("paymentId") String paymentId, @Param("status") String status);
    
    // 수업있는 날만 출석체크
    List<Integer> selectLectureIdsForToday(); // 오늘 수업 있는 lecture_id 조회
    void insertDailyAttendanceByLectureIds(List<Integer> lectureIds);
    
    // 출석 상태 카운트 (검색 + 날짜 포함)
    List<Map<String, Object>> selectAttendanceListByTeacher(Map<String, Object> param);
    int countAttendanceListByTeacher(Map<String, Object> param);

    
}
