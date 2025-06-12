package com.example.afterSchoolLms.service;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.example.afterSchoolLms.mapper.AttendanceMapper;

/**
 * 출결 관련 비즈니스 로직을 담당하는 서비스 클래스
 */
@Service
public class AttendanceService {

    // 출결 관련 Mapper 주입
    private final AttendanceMapper attendanceMapper;

    // 생성자 기반 의존성 주입
    @Autowired
    public AttendanceService(AttendanceMapper attendanceMapper) {
        this.attendanceMapper = attendanceMapper;
    }

    /**
     * 출석 상태 업데이트 처리
     *
     * @param attendanceId - 출결 고유번호
     * @param status - 변경할 출석 상태 (출석, 지각, 결석)
     */
    public void updateAttendanceStatus(int attendanceId, String status) {
        attendanceMapper.updateAttendanceStatus(attendanceId, status);
    }

    /**
     * 출석 상태 최초 입력 처리
     *
     * @param paymentId - 수강 결제 ID
     * @param status - 출석 상태 (출석, 지각, 결석)
     */
    public void insertAttendance(String paymentId, String status) {
        attendanceMapper.insertAttendance(paymentId, status);
    }
}
