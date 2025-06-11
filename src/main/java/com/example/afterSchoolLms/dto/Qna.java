package com.example.afterSchoolLms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Qna {
	private int qnaId;
	private String parentId;
	private String adminId;
	private String question;
	private String answer;
	private String createdAt;
	private String answeredAt;
}
