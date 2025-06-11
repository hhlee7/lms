package com.example.afterSchoolLms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.afterSchoolLms.dto.Notice;
import com.example.afterSchoolLms.dto.Page;
import com.example.afterSchoolLms.service.ParentService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ParentController {
	@Autowired ParentService parentService;
	
	@GetMapping("/parent")
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
		List<Notice> noticeList = parentService.notice();
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
}
