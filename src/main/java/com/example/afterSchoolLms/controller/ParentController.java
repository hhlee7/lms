package com.example.afterSchoolLms.controller;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.afterSchoolLms.dto.AlbumPhoto;
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
	
	// 과목소개 전체
	@GetMapping("/parent/subject")
	public String subject(Model model) {
		List<Subject> subjectList = parentService.subject();
		//log.info(subjectList.toString());
		model.addAttribute("subjectList", subjectList);
		return "/parent/subject";
	}
	
	// 과목소개 상세 페이지
	@GetMapping("/parent/subjectOne")
	public String subjectOne(Model model
			, @RequestParam String subjectName) {
		//log.info("subjecName: " + subjectName);
		Subject subject = parentService.subjectOne(subjectName);
		// 과목 평균평점 넣기
		Double rating = parentService.subjectOneRating(subjectName);
		// 과목 리뷰 최신 3개 넣기
		List<Map<String, Object>> reviewList = parentService.subjectOneReview(subjectName);
		//log.info("reviewList: " + reviewList);
		model.addAttribute("subject", subject);
		model.addAttribute("rating", rating);
		model.addAttribute("reviewList", reviewList);
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
		model.addAttribute("isCancelledToday", vehicleInfo.get("isCancelledToday"));

		return "/parent/vehicleInfo";
	}
	
	// 자녀 출결조회
	@GetMapping("/parent/attendance")
	public String attendance(HttpSession session, Model model
			, @RequestParam(required = false) Integer targetYear
            , @RequestParam(required = false) Integer targetMonth) {
		User loginUser = (User) session.getAttribute("loginUser");
		
		// 자녀정보 가져오기
	    Map<String, Object> studentInfo = parentService.getStudentInfo(loginUser.getUserId());
	    String studentId = (String) studentInfo.get("studentId");
		
		List<Map<String, Object>> attendanceList = parentService.selectAttendance(studentId);
		//log.info("attendanceList: " + attendanceList);
      
	      // 날짜별 출결 정보를 Map<String, Map<String, String>> 으로 저장
	    	Map<String, Map<String, String>> attendanceMap = new HashMap<>();
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    	for (Map<String, Object> record : attendanceList) {
		    	  String date = sdf.format(record.get("attendDate"));
		          String status = (String) record.get("status");
		          String teacherName = (String) record.get("teacherName");
		          String subjectName = (String) record.get("subjectName");
		
		          Map<String, String> info = new HashMap<>();
		          info.put("status", status);
		          info.put("teacherName", teacherName);
		          info.put("subjectName", subjectName);
		
		          attendanceMap.put(date, info);
	    	}
	       
	      // 달력
	      Calendar calendar = Calendar.getInstance();
	        calendar.set(Calendar.DATE, 1);
	      
	        if (targetYear != null && targetMonth != null) {
	            calendar.set(Calendar.YEAR, targetYear);
	            calendar.set(Calendar.MONTH, targetMonth);
	        }
	        
	        int year = calendar.get(Calendar.YEAR);
	        int month = calendar.get(Calendar.MONTH); // 0~11
	        int lastDate = calendar.getActualMaximum(Calendar.DATE);
	        int startBlank = calendar.get(Calendar.DAY_OF_WEEK) - 1;
	        int totalCell = startBlank + lastDate;
	        int endBlank = (totalCell % 7 != 0) ? 7 - (totalCell % 7) : 0;
	        totalCell += endBlank;
	        
	        model.addAttribute("attendanceMap", attendanceMap);
	        model.addAttribute("year", year);
	        model.addAttribute("month", month);
	        model.addAttribute("startBlank", startBlank);
	        model.addAttribute("lastDate", lastDate);
	        model.addAttribute("totalCell", totalCell);
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

	    return "redirect:/parent/lecturePayOrCancel";
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
	
	// 수강신청 결제할 목록 페이지
	@GetMapping("/parent/lecturePayOrCancel")
	public String lecturePayOrCancel(HttpSession session, Model model) {
		User loginUser = (User) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로
		}
		
		String userId = loginUser.getUserId();
		List<Map<String, Object>> lecturePayOrCancelList = parentService.lecturePayOrCancel(userId);
		
		
		// 자녀정보 가져오기
	    Map<String, Object> studentInfo = parentService.getStudentInfo(loginUser.getUserId());
	    String studentId = (String) studentInfo.get("studentId");
		model.addAttribute("lecturePayOrCancelList", lecturePayOrCancelList);
		model.addAttribute("userId", userId);
		model.addAttribute("studentId", studentId);
		
		return "/parent/lecturePayOrCancel";
	}
	
	// 수강 취소(결제 전, 환불x 단순 취소)
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
	
	// 환불
	@PostMapping("/parent/refundLeture")
	public String refundLeture(HttpSession session, Model model
							, @RequestParam("lectureId") int lectureId
							, @RequestParam("studentId") String studentId
							, @RequestParam("status") String status
							, @RequestParam("startDate") String startDate
							, RedirectAttributes redirectAttr) {
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로
		}
		
		try {
	        parentService.refundLeture(lectureId, studentId, status, startDate);
	    } catch (IllegalArgumentException e) {
	        // 예외 발생 시 에러 메시지 담아서 redirect
	        redirectAttr.addFlashAttribute("errorMessage", e.getMessage());
	        return "redirect:/parent/lecturePayOrCancel";
	    }
		
		return "redirect:/parent/lecturePayOrCancel";
	}
	
	
	// qna
	@GetMapping("/parent/qnaList")
	public String qnaList(HttpSession session, Model model
						,@RequestParam(defaultValue = "1") int page
						,@RequestParam(defaultValue = "5") int size) {
		User loginUser = (User) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로
		}
		
		String userId = loginUser.getUserId();
		
		Page paging = new Page(size, page, 0);
		int totalCount = parentService.totalCountByParent(userId);
		List<Qna> qnaList = parentService.qnaList(userId, paging.getBeginRow(), size);
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
	
    // 강사 소개 전체
 	@GetMapping("/parent/teacher")
 	public String teacher(Model model) {
 		List<User> teacherList = parentService.teacher();
 		//log.info(teacherList.toString());
 		model.addAttribute("teacherList", teacherList);
 		return "/parent/teacher";
 	}
 	
    // 강사소개 상세 페이지
    @GetMapping("/parent/teacherOne")
    public String teacherOne(Model model
          , @RequestParam String teacherId) {
       log.info(teacherId);
       Map<String, Object> teacher = parentService.teacherOne(teacherId);
       //log.info(teacher.toString());
       // 강사 평균평점 넣기
       Double rating = parentService.teacherOneRating(teacherId);
       // 강사 리뷰 최신 3개 넣기
       List<Map<String, Object>> reviewList = parentService.teacherOneReview(teacherId);
       log.info("reviewList: " + reviewList);
       model.addAttribute("teacher", teacher);
       model.addAttribute("rating", rating);
       model.addAttribute("reviewList", reviewList);
       return "/parent/teacherOne";
    }
 	
 	// 사진첩 페이지
 	@GetMapping("/parent/album")
 	public String albumManagement(Model model
 			,@RequestParam(defaultValue = "1") int page
 			,@RequestParam(defaultValue = "4") int size
 			,@RequestParam(defaultValue = "") String searchWord) {

 		// 페이징
 		Page paging = new Page(size, page, 0, searchWord);
 		int totalCount = parentService.albumTotalCount(searchWord);
 		//log.info("albumTotalCount: " + totalCount);

 		Map<String, Object> paramMap = new HashMap<>();
 		paramMap.put("beginRow", paging.getBeginRow());
 		paramMap.put("size", size);
 		paramMap.put("searchWord", searchWord);
 		
 		List<Map<String,Object>> albumList = parentService.albumList(paramMap);
 		int totalPage = (int) Math.ceil((double) totalCount / size);
 		model.addAttribute("albumList", albumList);
 		model.addAttribute("page", page);
 		model.addAttribute("size", size);
 		model.addAttribute("totalCount", totalCount);
 		model.addAttribute("totalPage", totalPage);
 		model.addAttribute("searchWord", searchWord);
 		return "/parent/album";
 	}
 	
 	// 사진첩 앨범 상세페이지
 	@GetMapping("/parent/albumOne")
 	public String albumOne(Model model
 			, @RequestParam String albumId) {
 		
 		Map<String,Object> album = parentService.albumOne(Integer.parseInt(albumId));
 		List<AlbumPhoto> photoList = parentService.albumPhotoList(Integer.parseInt(albumId));
 		
 		// 웹에 노출 가능한 경로로 변환
 	    for (AlbumPhoto photo : photoList) {
 	        photo.setFilePath("/images/" + photo.getFilePath());
 	    }
 		
 		model.addAttribute("photoList",photoList);
 		model.addAttribute("album",album);
 		return "/parent/albumOne";
 	}

}
