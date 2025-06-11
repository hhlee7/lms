package com.example.afterSchoolLms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TeacherAssignment {
	private int lectureId;
	private String teacherId;
}
