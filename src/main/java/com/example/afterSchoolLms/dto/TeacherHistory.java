package com.example.afterSchoolLms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TeacherHistory {
	private int historyId;
	private String teacherId;
	private String lastEducation;
	private String personalHistory;
}
