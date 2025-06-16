package com.example.afterSchoolLms.schedule;

import java.util.List;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.example.afterSchoolLms.mapper.AttendanceMapper;

import lombok.RequiredArgsConstructor;

// 조서진 강사 출석 체크 스케줄러 필요해서 만듬
@Component
@RequiredArgsConstructor
public class Schedule {

    private final AttendanceMapper attendanceMapper;

    // 매일 자정에 오늘 수업 있는 강의만 출결 초기화
    @Scheduled(cron = "0 0 0 * * ?") // 매일 자정 00:00
    public void initDailyAttendance() {
        List<Integer> lectureIds = attendanceMapper.selectLectureIdsForToday();
        if (!lectureIds.isEmpty()) {
            attendanceMapper.insertDailyAttendanceByLectureIds(lectureIds);
            System.out.println("출석 초기화 완료 (대상 수업 수: " + lectureIds.size() + ")");
        } else {
            System.out.println("오늘 수업이 없어 출석 초기화 생략");
        }
    }
}