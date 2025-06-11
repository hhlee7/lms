package com.example.afterSchoolLms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Satisfaction {
	private int satisfactionId;
	private int paymentId;
	private double ratingLecture;
	private double ratingTeacher;
	private String createdAt;
}
