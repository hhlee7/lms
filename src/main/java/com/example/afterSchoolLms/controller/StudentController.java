package com.example.afterSchoolLms.controller;

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

import com.example.afterSchoolLms.dto.AlbumPhoto;
import com.example.afterSchoolLms.dto.Notice;
import com.example.afterSchoolLms.dto.Page;
import com.example.afterSchoolLms.dto.Role;
import com.example.afterSchoolLms.dto.Subject;
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
	
	// 과목소개 전체
	@GetMapping("/student/subject")
	public String subject(Model model) {
		List<Subject> subjectList = studentService.subject();
		//log.info(subjectList.toString());
		model.addAttribute("subjectList", subjectList);
		return "/student/subject";
	}
	
	// 과목소개 상세 페이지
	@GetMapping("/student/subjectOne")
	public String subjectOne(Model model
			, @RequestParam String subjectName) {
		//log.info("subjecName: " + subjectName);
		Subject subject = studentService.subjectOne(subjectName);
		// 과목 평균평점 넣기
		Double rating = studentService.subjectOneRating(subjectName);
		// 과목 리뷰 최신 3개 넣기
		List<Map<String, Object>> reviewList = studentService.subjectOneReview(subjectName);
		//log.info("reviewList: " + reviewList);
		model.addAttribute("subject", subject);
		model.addAttribute("rating", rating);
		model.addAttribute("reviewList", reviewList);
		return "/student/subjectOne";
	}
	
	// 학생 만족도 평가 가능 과목 보여주기
	@GetMapping("/student/satisfaction")
	public String satisfaction(HttpSession session, Model model) {
		User loginUser = (User) session.getAttribute("loginUser");
		// 끝난 수업과 만족도평가 여부를 조회해서 넘겨줌
		List<Map<String, Object>> lectureDoneList = studentService.selectLectureDone(loginUser.getUserId());
		//log.info("lectureDone: " + lectureDoneList);
		model.addAttribute("lectureDoneList", lectureDoneList);
		return "/student/satisfaction";
	}
	
	// 학생 만족도 평가 실시
	@GetMapping("/student/evaluation")
	public String evaluation(Model model
			, @RequestParam String paymentId
			, @RequestParam String subjectName
			, @RequestParam String teacherName) {
		//log.info("paymentId: " + paymentId);
		//log.info("subjectName: " + subjectName);
		//log.info("teacherName: " + teacherName);
		model.addAttribute("paymentId", paymentId);
		model.addAttribute("subjectName", subjectName);
		model.addAttribute("teacherName", teacherName);
		return "/student/evaluation";
	}
	
	@PostMapping("/student/evaluation")
	public String evaluation(@RequestParam String paymentId
			, @RequestParam String teacherRating
			, @RequestParam String lectureRating) {
		//log.info("paymentId: " + paymentId);
		//log.info("teacherRating: " + teacherRating);
		//log.info("contentRating: " + lectureRating);
		studentService.insertEvaluation(paymentId, teacherRating, lectureRating);
		return "redirect:/student/satisfaction";
	}
	
	// 학생 리뷰 작성
	@GetMapping("/student/review")
	public String reveiw(Model model
			, @RequestParam String satisfactionId
			, @RequestParam String subjectName
			, @RequestParam String teacherName) {
		model.addAttribute("satisfactionId", satisfactionId);
		model.addAttribute("subjectName", subjectName);
		model.addAttribute("teacherName", teacherName);
		return "/student/review";
	}
	
	@PostMapping("/student/review")
	public String review(@RequestParam String satisfactionId
			, @RequestParam String content) {
		//log.info("satisfactionId: " + satisfactionId);
		//log.info("content: " + content);
		studentService.insertReview(satisfactionId, content);
		return "redirect:/student/satisfaction";
	}
	
	// 학생이 작성한 만족도평가, 리뷰 보기
	@GetMapping("/student/history")
	public String history(Model model
			, @RequestParam String paymentId) {
		List<Map<String, Object>> historyList = studentService.selectHistory(paymentId);
		model.addAttribute("historyList", historyList);
		return "/student/history";
	}
	
	// 학생 본인 출결 조회
	@GetMapping("/student/attendance")
	public String attendance(HttpSession session, Model model
			, @RequestParam(required = false) Integer targetYear
            , @RequestParam(required = false) Integer targetMonth) {
		User loginUser = (User) session.getAttribute("loginUser");
		List<Map<String, Object>> attendanceList = studentService.selectAttendance(loginUser.getUserId());
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
		return "/student/attendance";
	}
	
	// 강사 소개 전체
	@GetMapping("/student/teacher")
	public String teacher(Model model) {
		List<User> teacherList = studentService.teacher();
		//log.info(teacherList.toString());
		model.addAttribute("teacherList", teacherList);
		return "/student/teacher";
	}
	
	// 강사소개 상세 페이지
	@GetMapping("/student/teacherOne")
	public String teacherOne(Model model
			, @RequestParam String teacherId) {
		//log.info(teacherId);
		Map<String, Object> teacher = studentService.teacherOne(teacherId);
		//log.info(teacher.toString());
		// 강사 평균평점 넣기
		Double rating = studentService.teacherOneRating(teacherId);
		// 강사 리뷰 최신 3개 넣기
		List<Map<String, Object>> reviewList = studentService.teacherOneReview(teacherId);
		//log.info("reviewList: " + reviewList);
		model.addAttribute("teacher", teacher);
		model.addAttribute("rating", rating);
		model.addAttribute("reviewList", reviewList);
		return "/student/teacherOne";
	}
	
	// 사진첩 페이지
	@GetMapping("/student/album")
	public String albumManagement(Model model
			,@RequestParam(defaultValue = "1") int page
			,@RequestParam(defaultValue = "4") int size
			,@RequestParam(defaultValue = "") String searchWord) {

		// 페이징
		Page paging = new Page(size, page, 0, searchWord);
		int totalCount = studentService.albumTotalCount(searchWord);
		//log.info("albumTotalCount: " + totalCount);

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", paging.getBeginRow());
		paramMap.put("size", size);
		paramMap.put("searchWord", searchWord);
		
		List<Map<String,Object>> albumList = studentService.albumList(paramMap);
		int totalPage = (int) Math.ceil((double) totalCount / size);
		model.addAttribute("albumList", albumList);
		model.addAttribute("page", page);
		model.addAttribute("size", size);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("searchWord", searchWord);
		return "/student/album";
	}
	
	// 사진첩 앨범 상세페이지
	@GetMapping("/student/albumOne")
	public String albumOne(Model model
			, @RequestParam String albumId) {
		
		Map<String,Object> album = studentService.albumOne(Integer.parseInt(albumId));
		List<AlbumPhoto> photoList = studentService.albumPhotoList(Integer.parseInt(albumId));
		
		// 웹에 노출 가능한 경로로 변환
	    for (AlbumPhoto photo : photoList) {
	        photo.setFilePath("/upload/" + photo.getFilePath());
	    }
		
		model.addAttribute("photoList",photoList);
		model.addAttribute("album",album);
		return "/student/albumOne";
	}
}
