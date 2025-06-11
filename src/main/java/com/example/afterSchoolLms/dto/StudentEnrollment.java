package com.example.afterSchoolLms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StudentEnrollment {
	private int enrollmentId;
	private String studentId;
	private int lectureId;
	private String status;
	private String enrolledAt;
}
