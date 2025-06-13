package com.example.afterSchoolLms.controller;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
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
import com.example.afterSchoolLms.dto.Qna;
import com.example.afterSchoolLms.dto.Subject;
import com.example.afterSchoolLms.dto.User;
import com.example.afterSchoolLms.mapper.ParentMapper;
import com.example.afterSchoolLms.service.ParentService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class ParentController {
	@Autowired ParentService parentService;
	@Autowired ParentMapper parentMapper;
	
	@GetMapping("/parent/index")
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
		model.addAttribute("userId", userId);
		
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
	
	// 수강신청 목록
	// 개강일 기준 3일전 까지만 출력(수강신청가능)
	@GetMapping("/parent/lectureList")
	public String lectureList(HttpSession session, Model model) {
		User loginUser = (User) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로
		}
		
		String userId = loginUser.getUserId();
		List<Map<String, Object>> lectureList = parentService.getLectureList();
		// 자녀정보 가져오기
	    Map<String, Object> studentInfo = parentService.getStudentInfo(loginUser.getUserId());
	    String studentId = (String) studentInfo.get("studentId");
		model.addAttribute("lectureList", lectureList);
		model.addAttribute("userId", userId);
		model.addAttribute("studentId", studentId);
		return "/parent/lectureList";
	}
	
	// 수강신청 접수(결제x)
	@PostMapping("/parent/lectureApply")
	public String lectureApply(HttpSession session, Model model
							, @RequestParam("lectureId") int lectureId
							, @RequestParam("studentId") String studentId
							, @RequestParam("amount") int amount) {
		User loginUser = (User) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로
		}
		
		String userId = loginUser.getUserId();
		try {
	        // 중복 확인 포함한 수강신청
	        parentService.lectureApply(userId, lectureId, studentId);
	    } catch (IllegalStateException e) {
	        // 이미 신청된 경우: 메시지와 함께 목록 페이지로 리다이렉트
	        model.addAttribute("error", e.getMessage());
	        String errorMessage = URLEncoder.encode(e.getMessage(), StandardCharsets.UTF_8);
	        return "redirect:/parent/lectureList?error=" + errorMessage;
	    }

	    return "redirect:/parent/lectureLegistrationList";
	}
	
	// 수강료 결제
	@GetMapping("/parent/payment")
	public String payment(HttpSession session, Model model
						, @RequestParam("lectureId") int lectureId
						, @RequestParam("studentId") String studentId
						, @RequestParam("amount") int amount)	{
		
		User loginUser = (User) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로
		}
		
		String userId = loginUser.getUserId();
		
		model.addAttribute("lectureId",lectureId);
		model.addAttribute("studentId",studentId);
		model.addAttribute("amount",amount);
		model.addAttribute("userId", userId);
		return "/parent/payment";

	}
	
	@PostMapping("/parent/payment")
	public String insertpayment(HttpSession session, Model model
						, @RequestParam("lectureId") int lectureId
						, @RequestParam("studentId") String studentId
						, @RequestParam("amount") int amount) {
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로
		}
		
		parentService.payment(lectureId, studentId,amount);
		
		return "redirect:/parent/lectureLegistrationList";
	}
	
	// 수강 취소 및 환불신청
	@PostMapping("/parent/cancelLecture")
	public String cancelLecture(HttpSession session
							, @RequestParam("lectureId") int lectureId
							, @RequestParam("studentId") String studentId
							, @RequestParam("status") String status) {
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로
		}
		
		parentService.cancelLecture(lectureId,studentId,status);
		
		return "redirect:/parent/lectureLegistrationList";
	}
	
	
	// qna
	@GetMapping("/parent/qnaList")
	public String qnaList(HttpSession session, Model model
						,@RequestParam(defaultValue = "1") int page
						,@RequestParam(defaultValue = "10") int size) {
		User loginUser = (User) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로
		}
		
		String userId = loginUser.getUserId();
		
		Page paging = new Page(size, page, 0);
		int totalCount = parentService.totalCount(paging);
		List<Qna> qnaList = parentService.qnaList(paging.getBeginRow(), size);
		int totalPage = (int) Math.ceil((double) totalCount / size);
		model.addAttribute("page", page);
		model.addAttribute("size", size);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("userId", userId);
		model.addAttribute("qnaList", qnaList);
		return "/parent/qnaList";
	}
	
	// qna작성
	@GetMapping("/parent/insertQna")
	public String insertQna(HttpSession session, Model model) {
		User loginUser = (User) session.getAttribute("loginUser");
	    if (loginUser == null) {
	        return "redirect:/login";
	    }
	    
	    String userId = loginUser.getUserId();
		model.addAttribute("userId", userId);
		return "/parent/insertQna";
	}
	
	@PostMapping("/parent/insertQna")
	public String insertQna(HttpSession session
				, @RequestParam("question") String question) {
		User loginUser = (User) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로
		}
		String userId = loginUser.getUserId();
		parentService.insertQna(userId, question);
		return "redirect:/parent/qnaList";
	}
	
	// qna 수정
	@GetMapping("/parent/modifyQna")
	public String modifyQna(HttpSession session, Model model
						, @RequestParam("qnaId") int qnaId) {
		User loginUser = (User) session.getAttribute("loginUser");
		log.info("qnaId: {}", qnaId);
		if (loginUser == null) {
			return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로
		} 
		String userId = loginUser.getUserId();
		model.addAttribute("qnaId", qnaId);
		return "parent/modifyQna";
	}
	
	@PostMapping("/parent/modifyQna")
	public String modifyQna(HttpSession session
						, @RequestParam("qnaId") int qnaId
						, @RequestParam("question") String question) {
		User loginUser = (User) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로
		} 
		
		parentService.modifyQna(qnaId, question);
		
		return "redirect:/parent/qnaList";
	}
	
	// qna 삭제
	@PostMapping("/parent/qnaDelete")
	public String qnaDelete(@RequestParam("qnaId") int qnaId) {
		parentService.qnaDelete(qnaId);
		return "redirect:/parent/qnaList";
	}
	
	
    // 사진첩 
    @GetMapping("/parent/album")
    public String getAlbumList(HttpSession session, Model model,
                               @RequestParam(defaultValue = "1") int page,
                               @RequestParam(defaultValue = "") String keyword) {
        int rowPerPage = 10;
        int startRow = (page - 1) * rowPerPage;

        Map<String, Object> param = new HashMap<>();
        param.put("startRow", startRow);
        param.put("rowPerPage", rowPerPage);
        param.put("keyword", keyword);

        List<Map<String, Object>> albumList = parentMapper.selectAlbumList(param);
        int totalRow = parentMapper.countAlbumList(param);
        int lastPage = (int) Math.ceil((double) totalRow / rowPerPage);

        model.addAttribute("albumList", albumList);
        model.addAttribute("page", page);
        model.addAttribute("lastPage", lastPage);
        model.addAttribute("keyword", keyword);
        

        return "parent/album";
    }

	// 배차 취소 신청
    @GetMapping("/parent/cancelVehicle")
    public String cancelVehicle(HttpSession session, Model model) {
    	
    	User loginUser = (User) session.getAttribute("loginUser");
    	if (loginUser == null) {
			return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로
		}
    	Map<String, Object> studentInfo = parentService.getStudentInfo(loginUser.getUserId());
    	String studentName = (String) studentInfo.get("studentName");
    	
    	model.addAttribute("studentName", studentName);
		return "/parent/cancelVehicle";
    }
    
    // 차량 배차 취소
    @PostMapping("/parent/cancelVehicle")
    public String cancelVehicle(HttpSession session
    						, @RequestParam("reason") String reason) {
    	
    	User loginUser = (User) session.getAttribute("loginUser");
    	if (loginUser == null) {
			return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로
		}
    	// FK키 payment_id, assignment_id 값 구해오기
    	parentService.insertVehicleCancel(loginUser.getUserId(), reason);
    	
		return "redirect:/parent/vehicleInfo";
    }
    
    @GetMapping("/parent/lectureLegistrationList")
    public String lectureLegistrationList(HttpSession session, Model model) {
    	
    	User loginUser = (User) session.getAttribute("loginUser");
    	if (loginUser == null) {
			return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로
		}
    	
    	String userId = loginUser.getUserId();
    	List<Map<String, Object>> lectureLegistrationList = parentService.getLectureLegistrationList(userId);
    	
    	model.addAttribute("lectureLegistrationList", lectureLegistrationList);
    	
    	return "/parent/lectureLegistrationList";
    }
	
	
	
	// 강사 소개 페이지
	@GetMapping("/parent/teacherInfo")
	public String teacherInfo() {
		return "/parent/teacherInfo";
	}
	
}
