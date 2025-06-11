package com.example.afterSchoolLms.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.afterSchoolLms.dto.Notice;
import com.example.afterSchoolLms.dto.Page;
import com.example.afterSchoolLms.dto.User;
import com.example.afterSchoolLms.service.StudentService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StudentController {
	
	@Autowired StudentService studentService;
	
	// 학생 메인페이지
	@GetMapping("/student/main")
	public String main(HttpSession session, Model model) {
		User loginUser = (User) session.getAttribute("loginUser");
		model.addAttribute("loginUser", loginUser);
		return "/student/main";
	}
	
	// 학생 개인정보 페이지
	@GetMapping("/student/personalInformation")
	public String personalInformation(HttpSession session, Model model) {
		User loginUser = (User) session.getAttribute("loginUser");
		model.addAttribute("loginUser", loginUser);
		return "/student/personalInformation";
	}
	
	// 학생 비밀번호 수정 페이지
	@GetMapping("/student/updateInformation")
	public String updateInformation(HttpSession session, Model model) {
		User loginUser = (User) session.getAttribute("loginUser");
		model.addAttribute("loginUser", loginUser);
		return "/student/updateInformation";
	}
	
	// 학생 비밀번호 수정
	@PostMapping("/student/updateInformation")
	public String updateInformation(@RequestParam String userId
			, @RequestParam String currentPw
			, @RequestParam String updatePw) {
		studentService.updatePw(userId, currentPw, updatePw);
		return "redirect:/student/main";
	}

	// 학생 본인 수업조회
	@GetMapping("/student/lecture")
	public String lecture(HttpSession session, Model model) {
		User loginUser = (User) session.getAttribute("loginUser");
        List<Map<String, Object>> lectureList = studentService.selectLecture(loginUser.getUserId());
        //log.info(lectureList.toString());
        model.addAttribute("lectureList", lectureList);
		return "/student/lecture";
	}
	
	// 학생 본인 배차조회
	@GetMapping("/student/dispatch")
	public String dispatch(HttpSession session, Model model) {
		User loginUser = (User) session.getAttribute("loginUser");
		List<Map<String, Object>> dispatchList = studentService.selectDisptach(loginUser.getUserId());
		model.addAttribute("dispatchList", dispatchList);
		return "/student/dispatch";
	}
	
	// 전체 공지사항 조회
	@GetMapping("/student/notice")
	public String notice(Model model
			,@RequestParam(defaultValue = "1") int page
			,@RequestParam(defaultValue = "4") int size) {
		
		Page paging = new Page(size, page, 0);
		int totalCount = studentService.totalCount();
		//log.info("totalCount" + totalCount);
		
		List<Notice> noticeList = studentService.notice(paging.getBeginRow(), size);
		//log.info("noticeList" + noticeList.toString());
		int totalPage = (int) Math.ceil((double) totalCount / size);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("page", page);
		model.addAttribute("size", size);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalPage", totalPage);
		return "/student/notice";
	}
	
	// 공지사항 상세보기
	@GetMapping("/student/noticeOne")
	public String noticeOne(Model model
			, @RequestParam int noticeId) {
		Notice notice = studentService.noticeOne(noticeId);
		model.addAttribute("notice", notice);
		return "/student/noticeOne";
	}
}
