package com.example.afterSchoolLms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.afterSchoolLms.dto.Page;
import com.example.afterSchoolLms.dto.Role;
import com.example.afterSchoolLms.dto.User;
import com.example.afterSchoolLms.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
	@Autowired AdminService adminService;
	
	/** 회원 관리 페이지로 **/
	@GetMapping("userManagement")
	public String userManagement(Model model
			,@RequestParam(defaultValue = "1") int page
			,@RequestParam(defaultValue = "10") int size
			,@RequestParam(defaultValue = "") String searchWord
			,@RequestParam(defaultValue = "all") String searchType) {
		
		
		int roleType = 0;
		switch(searchType) {
		case "관리자":			// 관리자	
			roleType = 1; break;
		case "학생":			// 학생
			roleType = 2; break;
		case "강사":			// 강사
			roleType = 3; break;
		case "학부모":			// 학부모
			roleType = 4; break;
		case "운전기사":			// 운전기사
			roleType = 5; break;
		}
		
		Page paging = new Page(size, page, 0, searchWord, searchType, roleType);
		
		int totalCount = adminService.getTotalCount(paging);
		paging.setTotalCount(totalCount);
		
		// 유저 리스트
		List<User> userList = adminService.selectUserList(paging);
		// 역할 리스트
		List<Role> roleList = adminService.selectRoleList();
		
		// 모델 값 넘기기
		model.addAttribute("userList",userList);
		model.addAttribute("roleList",roleList);
		model.addAttribute("page",paging);
		return "admin/userManagement";
	}
}
