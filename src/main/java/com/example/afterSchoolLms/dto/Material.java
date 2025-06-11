package com.example.afterSchoolLms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Material {
	private int materialId;
	private int lectureId;
	private String materialTitle;
	private int totalCount;
	private int usedCount;
}
