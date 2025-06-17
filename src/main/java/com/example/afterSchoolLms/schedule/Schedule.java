package com.example.afterSchoolLms.schedule;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.example.afterSchoolLms.mapper.AttendanceMapper;
import com.example.afterSchoolLms.mapper.ParentMapper;

import lombok.RequiredArgsConstructor;

// 조서진 강사 출석 체크 스케줄러 필요해서 만듬
@Component
@RequiredArgsConstructor
public class Schedule {

	private final AttendanceMapper attendanceMapper;
	private final ParentMapper parentMapper;
	
	// 매일 자정에 결석으로 출결 초기화
	@Scheduled(cron = "0 0 0 * * ?") // 매일 00:00
	public void initDailyAttendance() {
		attendanceMapper.insertDailyDefaultAttendance();
		System.out.println("출결 초기화 완료(기본값: 결석)");
	}
	
	//[장정수] 수강신청 후 3일이내 미 결제시 pending -> cancel로 변경 
	@Scheduled(cron = "0 0 0 * * ?")
    public void cancelExpiredPendingLectures() {
        parentMapper.autoCancelLectures();
        System.out.println("3일 미결제 PENDING -> CANCEL로 수강 자동 취소 완료");
    }
	
}
