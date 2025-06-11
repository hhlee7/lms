package com.example.afterSchoolLms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	private String userId;
	private int roleId;
	private String userName;
	private String email;
	private String password;
	private String phone;
	private String address;
	private String createdAt;
	private String birth;
}
