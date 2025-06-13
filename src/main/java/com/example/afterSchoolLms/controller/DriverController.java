package com.example.afterSchoolLms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.afterSchoolLms.dto.User;
import com.example.afterSchoolLms.service.DriverService;

import jakarta.servlet.http.HttpSession;

@Controller
public class DriverController {

	@Autowired DriverService driverService;
	
	// 기사 메인페이지
	@GetMapping("/driver/main")
	public String main(HttpSession session, Model model) {
		User loginUser = (User) session.getAttribute("loginUser");
		model.addAttribute("loginUser", loginUser);
		return "/driver/main";
	}
	
	// 기사 개인정보 페이지
	@GetMapping("/driver/personalInformation")
	public String personalInformation(HttpSession session, Model model) {
		User loginUser = (User) session.getAttribute("loginUser");
		User user = driverService.selectInformation(loginUser.getUserId(), loginUser.getPassword());
		model.addAttribute(user);
		return "/driver/personalInformation";
	}
	
	// 기사 개인정보 수정 페이지
	@GetMapping("/driver/updateInformation")
	public String updateInformation(HttpSession session, Model model) {
		User loginUser = (User) session.getAttribute("loginUser");
		User user = driverService.selectInformation(loginUser.getUserId(), loginUser.getPassword());
		model.addAttribute(user);
		return "/driver/updateInformation";
	}
	
	// 기사 개인정보 수정
	@PostMapping("/driver/updateInformation")
	public String updateInformation(@RequestParam String userId
			, @RequestParam String email
			, @RequestParam String address
			, @RequestParam String phone
			, @RequestParam String password) {
		User user = new User();
		user.setUserId(userId);
		user.setEmail(email);
		user.setAddress(address);
		user.setPhone(phone);
		user.setPassword(password);
		driverService.updateInformation(user);
		return "redirect:/driver/personalInformation";
	}
	
	// 기사 비밀번호 수정 페이지
	@GetMapping("/driver/updatePassword")
	public String updatePassword(HttpSession session, Model model) {
		User loginUser = (User) session.getAttribute("loginUser");
		User user = driverService.selectInformation(loginUser.getUserId(), loginUser.getPassword());
		model.addAttribute(user);
		return "/driver/updatePassword";
	}
	
	// 기사 비밀번호 수정
	@PostMapping("/driver/updatePassword")
	public String updateInformation(@RequestParam String userId
			, @RequestParam String currentPw
			, @RequestParam String updatePw) {
		driverService.updatePw(userId, currentPw, updatePw);
		return "redirect:/";
	}

}
