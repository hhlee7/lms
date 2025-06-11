package com.example.afterSchoolLms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MaterialRequest {
	private int requestId;
	private int lectureId;
	private String content;
	private String requestedAt;
	private String status;
}
