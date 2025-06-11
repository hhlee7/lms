package com.example.afterSchoolLms.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.afterSchoolLms.dto.Attendance;
import com.example.afterSchoolLms.dto.Notice;
import com.example.afterSchoolLms.dto.Page;
import com.example.afterSchoolLms.dto.Subject;
import com.example.afterSchoolLms.dto.User;
import com.example.afterSchoolLms.service.ParentService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ParentController {
	@Autowired ParentService parentService;
	
	@GetMapping("/index")
	public String index() {
		return "parent/index";
	}
	
	// 공지사항
	@GetMapping("/parent/notice")
	public String notice(HttpSession session, Model model
						,@RequestParam(defaultValue = "1") int page
						,@RequestParam(defaultValue = "10") int size) {
		
		Page paging = new Page(size, page, 0);
		int totalCount = parentService.totalCount(paging);
		List<Notice> noticeList = parentService.notice(paging.getBeginRow(), size);
		int totalPage = (int) Math.ceil((double) totalCount / size);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("page", page);
		model.addAttribute("size", size);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalPage", totalPage);

		return "parent/notice";
	}
	
	// 공지사항 상세페이지
	@GetMapping("/parent/noticeOne")
	public String noticeOne(Model model, @RequestParam("noticeId") int noticeId) {
		Notice notice = parentService.noticeById(noticeId); // 해당 공지사항 조회
		model.addAttribute("notice", notice);
		return "/parent/noticeOne";
	}
	
	// 과목 소개 페이지
	@GetMapping("/parent/subjectInfo")
	public String subjectInfo() {
		return "/parent/subjectInfo";
	}

	// 과목별 상세 페이지
	@GetMapping("/parent/subjectOne")
	public String soccer(Model model, @RequestParam("type") String type) {
		log.info("type:" + type);
		
		// 영어 → 한글 매핑
		String subjectName = switch (type) {
			case "soccer" -> "축구";
			case "piano" -> "피아노";
			case "coding" -> "코딩";
			default -> null;
		};

		if (subjectName == null) {
			log.warn("잘못된 type 파라미터입니다.");
			return "redirect:/parent/subjectInfo"; // 또는 에러 페이지로 이동
		}
		
		Subject subject = parentService.subjectOne(subjectName);
		log.info("subject:" + subject);
		model.addAttribute("subject", subject);
		return "/parent/subjectOne";
	}
	
	// 개인정보 수정
	@GetMapping("/parent/modifyInfo")
	public String showModifyInfoPage(HttpSession session, Model model) {
	    User loginUser = (User) session.getAttribute("loginUser");

	    if (loginUser == null) {
	        return "redirect:/login";
	    }
	    
	    // 자녀정보 가져오기
	    Map<String, Object> studentInfo = parentService.getStudentInfo(loginUser.getUserId());

	    model.addAttribute("loginUser", loginUser);
	    model.addAttribute("studentInfo", studentInfo);

	    return "/parent/modifyInfo";
	}

	// 학부모 비밀번호 수정
	@PostMapping("/parent/modifyInfo")
	public String updateInformation(HttpSession session, Model model
			, @RequestParam String userId
			, @RequestParam String currentPw
			, @RequestParam String updatePw) {
		User loginUser = (User) session.getAttribute("loginUser");
	    model.addAttribute("loginUser", loginUser);
		parentService.updatePw(userId, currentPw, updatePw);
		return "redirect:/login";
	}
	
	// 자녀 배차 조회
	@GetMapping("/parent/vehicleInfo")
	public String vehicleInfo(HttpSession session, Model model) {
		User loginUser = (User) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로
		}
		String userId = loginUser.getUserId();
		Map<String, Object> vehicleInfo = parentService.getVehicleInfo(userId);
		model.addAttribute("vehicleInfo", vehicleInfo);
		return "/parent/vehicleInfo";
	}
	
	//자녀 수업 조회
	@GetMapping("/parent/subject")
	public String subjectInfo(HttpSession session, Model model) {
		User loginUser = (User) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로
		}
		
		String userId = loginUser.getUserId();
		Map<String, Object> subject = parentService.getSubjectInfo(userId);
		model.addAttribute("subject", subject);
		
		return "/parent/subject";
	}
	
	// 자녀 출석 조회
	@GetMapping("/parent/attendance")
	public String attendance(HttpSession session, Model model) {
		User loginUser = (User) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로
		}
		
		String userId = loginUser.getUserId();
		List<Attendance> attendance = parentService.getAttendance(userId);
		model.addAttribute("attendance", attendance);
		
		return "/parent/attendance";
	}
	
	
	
	// 강사 소개 페이지
	@GetMapping("/parent/teacherInfo")
	public String teacherInfo() {
		return "/parent/teacherInfo";
	}
	
}
