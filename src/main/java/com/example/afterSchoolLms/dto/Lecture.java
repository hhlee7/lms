package com.example.afterSchoolLms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Lecture {
	private int lectureId;
	private int subjectId;
	private int classroomId;
	private int recruited;
	private int amount;
	private String startTime;
	private String endTime;
	private String dayOfWeek;
	private String startDate;
	private String endDate;
}
