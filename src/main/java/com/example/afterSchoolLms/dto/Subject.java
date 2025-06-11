package com.example.afterSchoolLms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Subject {
	private int subjectId;
	private String name;  // subjectName -> name으로 수정 DB와 통일
	private String description;
	private String createdAt;
}
