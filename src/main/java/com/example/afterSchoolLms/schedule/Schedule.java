package com.example.afterSchoolLms.schedule;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.example.afterSchoolLms.dto.attendance;
import com.example.afterSchoolLms.mapper.AttendanceMapper;

import lombok.RequiredArgsConstructor;

// 조서진 강사 출석 체크 스케줄러 필요해서 만듬
@Component
@RequiredArgsConstructor
public class Schedule {

	private final AttendanceMapper attendanceMapper;
	
	// 매일 자정에 결석으로 출결 초기화
	@Scheduled(cron = "0 0 0 * * ?") // 매일 00:00
	public void initDailyAttendance() {
		attendanceMapper.insertDailyDefaultAttendance();
		System.out.println("출결 초기화 완료(기본값: 결석)");
	}
}
