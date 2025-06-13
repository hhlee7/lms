package com.example.afterSchoolLms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Attendance {
	private int attendanceId;
	private int paymentId;
	private String attendDate;
	private String status;		// 출석, 지각, 결석
}
