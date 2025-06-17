package com.example.afterSchoolLms.schedule;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.example.afterSchoolLms.dto.VehiclePassenger;
import com.example.afterSchoolLms.mapper.AttendanceMapper;
import com.example.afterSchoolLms.service.AdminService;

import lombok.RequiredArgsConstructor;

// 조서진 강사 출석 체크 스케줄러 필요해서 만듬
@Component
@RequiredArgsConstructor
public class Schedule {

    private final AttendanceMapper attendanceMapper;
	@Autowired AdminService adminService;
	
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


	
	// 수업 끝나기 전 배차 정보 초기화
	@Scheduled(cron = "0 50 15 * * ?") 
	public void initDailyPassangerFirst() {
		init("15:50");
	}
	
	// 수업 끝나기 전 배차 정보 초기화
	@Scheduled(cron = "0 50 17 * * ?") 
	public void initDailyPassangerSecond() {
		init("17:50");
	}
	
	
	public void init(String time) {
		System.out.println("배차 리스트 등록 합니다.");

		LocalDate today = LocalDate.now(); // 오늘 날짜
		String todayWeek = "";
		switch(today.getDayOfWeek()) {
			case MONDAY: todayWeek = "월"; break;
	        case TUESDAY: todayWeek = "화"; break;
	        case WEDNESDAY: todayWeek = "수"; break;
	        case THURSDAY: todayWeek = "목"; break;
	        case FRIDAY: todayWeek = "금"; break;
	        case SATURDAY: todayWeek = "토"; break;
	        case SUNDAY: todayWeek = "일"; break;
		}
        
		// 배차할 수강생 전체 데이터
		Map<String, Object> param = new HashMap<>();
		param.put("dayOfWeek", todayWeek);       	// 오늘 요일
		param.put("targetTime", time);   		 	// 타겟 시간
		
		// 조회
		List<Map<String,Object>> passengerList = adminService.getPassengerList(param);
		
		for(Map<String,Object> ps : passengerList) {
			// 디버깅
			System.out.println(ps.toString());
			
			// INSERT 하기
			VehiclePassenger vp = new VehiclePassenger();
			vp.setAssignmentId((int)ps.get("assignmentId"));
			vp.setPaymentId((int)ps.get("paymentId"));
			
			adminService.insertPassenger(vp);
		}
	}
	
}