package com.example.afterSchoolLms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice {
	private int noticeId;
	private String adminId;
	private String title;
	private String content;
	private int targetRoleId;
	private String createdAt;
}
