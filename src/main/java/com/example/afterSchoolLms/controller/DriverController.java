package com.example.afterSchoolLms.controller;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.afterSchoolLms.dto.Notice;
import com.example.afterSchoolLms.dto.Page;
import com.example.afterSchoolLms.dto.User;
import com.example.afterSchoolLms.service.DriverService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DriverController {

	@Autowired DriverService driverService;
	
	// 기사 메인페이지
	@GetMapping("/driver/main")
	public String main(HttpSession session, Model model) {
		User loginUser = (User) session.getAttribute("loginUser");
		model.addAttribute("loginUser", loginUser);
		return "/driver/main";
	}
	
	// 로그아웃
	@GetMapping("/driver/logout")
	public String logout(HttpSession session) {
	    session.invalidate();
	    return "redirect:/";
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
		return "redirect:/driver/logout";
	}

	// 전체 공지사항 조회
	@GetMapping("/driver/notice")
	public String notice(Model model
			,@RequestParam(defaultValue = "1") int page
			,@RequestParam(defaultValue = "4") int size) {
		
		Page paging = new Page(size, page, 0);
		int totalCount = driverService.totalCount();
		//log.info("totalCount" + totalCount);
		
		List<Notice> noticeList = driverService.notice(paging.getBeginRow(), size);
		//log.info("noticeList" + noticeList.toString());
		int totalPage = (int) Math.ceil((double) totalCount / size);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("page", page);
		model.addAttribute("size", size);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalPage", totalPage);
		return "/driver/notice";
	}
	
	// 공지사항 상세보기
	@GetMapping("/driver/noticeOne")
	public String noticeOne(Model model
			, @RequestParam int noticeId) {
		Notice notice = driverService.noticeOne(noticeId);
		model.addAttribute("notice", notice);
		return "/driver/noticeOne";
	}
		
	// 기사 배차 조회
	@GetMapping("/driver/dispatch")
	public String dispatch(HttpSession session, Model model) {
		User loginUser = (User) session.getAttribute("loginUser");
		List<Map<String, Object>> dispatchList = driverService.dispatch(loginUser.getUserId());
		model.addAttribute("dispatchList", dispatchList);
		return "/driver/dispatch";
	}
	
	// 배차된 학생 조회
	@GetMapping("/driver/dispatchStudent")
	public String dispatchStudent(HttpSession session, Model model) {
		User loginUser = (User) session.getAttribute("loginUser");
		List<Map<String, Object>> dispatchStudentList = driverService.dispatchStudent(loginUser.getUserId());
		//log.info(dispatchStudentList.toString());
		
	    // 고유한 시간(endTime) 추출
	    Set<String> timeSet = new LinkedHashSet<>();
	    for (Map<String, Object> student : dispatchStudentList) {
	        Object endTimeObj = student.get("endTime");
	        if (endTimeObj != null) {
	            timeSet.add(endTimeObj.toString());
	        }
	    }
	    
	    log.info("timeSet: " + timeSet.toString());
	    model.addAttribute("dispatchStudentList", dispatchStudentList);
	    model.addAttribute("timeList", timeSet);  // 시간 리스트도 모델에 추가
	    // 오늘 날짜 전달
	    model.addAttribute("now", new Date());
		return "/driver/dispatchStudent";
	}
}
