package com.example.afterSchoolLms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Album {
	private int albumId;
	private int lectureId;
	private String title;
	private String description;
	private String createdAt;
}
