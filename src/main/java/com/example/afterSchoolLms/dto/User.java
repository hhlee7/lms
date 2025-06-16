package com.example.afterSchoolLms.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {

    @NotBlank(message = "")
    @Size(min = 4, max = 20, message = "")
    private String userId;

    @NotNull(message = "역할을 선택하세요")
    private Integer roleId;

    @NotBlank(message = "이름을 입력하세요")
    @Size(min = 2, max = 10, message = "이름은 2~10자여야 합니다.")
    private String userName;

    @NotBlank(message = "이메일을 입력하세요")
    private String email;

    @NotBlank(message = "비밀번호를 입력하세요")
    @Size(min = 6, message = "비밀번호는 최소 6자 이상이어야 합니다.")
    private String password;

    @NotBlank(message = "전화번호를 입력하세요")
    @Pattern(
    	    regexp = "^(01[0-9]|02|0[3-9][0-9])-(\\d{3,4})-(\\d{4})$",
    	    message = "전화번호는 010-XXXX-XXXX 형식이어야 합니다."
    	)
	private String phone;

    @NotBlank(message = "주소를 입력하세요")
    private String address;

    private String createdAt;

    @NotBlank(message = "생년월일을 입력하세요")
    private String birth;
}
