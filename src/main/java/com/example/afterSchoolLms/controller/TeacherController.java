package com.example.afterSchoolLms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.afterSchoolLms.dto.User;
import com.example.afterSchoolLms.mapper.AttendanceMapper;
import com.example.afterSchoolLms.mapper.TeacherMapper;
import com.example.afterSchoolLms.service.AttendanceService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
	
	
	@Controller
	@RequestMapping("/teacher")
	@Slf4j
	public class TeacherController {
		
		private final TeacherMapper teacherMapper;
		private final AttendanceMapper attendanceMapper;
		private final AttendanceService attendanceService;
		
		
	// 생성자 = 의존성 주입
		public TeacherController(TeacherMapper teacherMapper, AttendanceMapper attendanceMapper, AttendanceService attendanceService) {
		    this.teacherMapper = teacherMapper;
		    this.attendanceMapper = attendanceMapper;
		    this.attendanceService = attendanceService;
		}

		
	// 강사 메인페이지	
	    @GetMapping("/main")
	    public String mainPage() {
	        return "teacher/main"; // /WEB-INF/views/Main.jsp 로 매핑됨
	    }
	    
	// 강사 수업 목록 조회 페이지
	    @GetMapping("/lecture/list")
	    public String getLectureList(HttpSession session, Model model) {
	    	User loginUser = (User) session.getAttribute("loginUser");
	    	String teacherId = loginUser.getUserId();
	    	List<Map<String, Object>> lectureList = teacherMapper.selectLectureListByTeacher(teacherId);
	    	model.addAttribute("lectureList", lectureList);
	    	return "teacher/lectureList";
	    }
	    
	// 강사 학생 조회 페이지
	    @GetMapping("/student/list")
	    public String getStudentList(
	            HttpSession session,
	            Model model,
	            @RequestParam(defaultValue = "1") int page,
	            @RequestParam(defaultValue = "") String keyword
	    ) {
	        User loginUser = (User) session.getAttribute("loginUser");
	        String teacherId = loginUser.getUserId();

	        int rowPerPage = 10;
	        int startRow = (page - 1) * rowPerPage;

	        Map<String, Object> param = new HashMap<>();
	        param.put("teacherId", teacherId);
	        param.put("startRow", startRow);
	        param.put("rowPerPage", rowPerPage);
	        param.put("keyword", keyword);

	        List<Map<String, Object>> studentList = teacherMapper.selectStudentListByTeacher(param);
	        int totalRow = teacherMapper.countStudentListByTeacher(param);
	        int lastPage = (int) Math.ceil((double) totalRow / rowPerPage);

	        model.addAttribute("studentList", studentList);
	        model.addAttribute("page", page);
	        model.addAttribute("lastPage", lastPage);
	        model.addAttribute("keyword", keyword);

	        return "teacher/studentList";
	    }

	    
	// 학생 배차 조회
	    @GetMapping("/student/vehicle")
	    public String getStudentVehicle(HttpSession session, Model model) {
	    	User loginUser = (User) session.getAttribute("loginUser");
	    	String teacherId = loginUser.getUserId();
	    	List<Map<String, Object>> vehicleList = teacherMapper.selectStudentVehicleByTeacher(teacherId);
	    	model.addAttribute("vehicleList", vehicleList);
	    	return "teacher/studentVehicle";
	    }
	    
	 // 개인정보 조회 - 읽기전용
	    @GetMapping("/profile")
	    public String viewProfile(HttpSession session, Model model) {
	    	User loginUser = (User) session.getAttribute("loginUser");
	    	String teacherId = loginUser.getUserId();
	        Map<String, Object> teacher = teacherMapper.selectTeacherProfile(teacherId);
	        model.addAttribute("teacher", teacher);
	        return "teacher/profile"; // 
	    }
	
	 // 개인정보 조회 폼
	    @GetMapping("/profile/edit")
	    public String editProfileForm(HttpSession session, Model model) {
	    	User loginUser = (User) session.getAttribute("loginUser");
	    	String teacherId = loginUser.getUserId();
	        Map<String, Object> teacher = teacherMapper.selectTeacherProfile(teacherId);
	        model.addAttribute("teacher", teacher);
	        return "teacher/profileEdit";
	    }

	 // 개인정보 수정 처리
	    @PostMapping("/profile/edit")
	    public String updateProfile(
	        @RequestParam Map<String, Object> paramMap,
	        HttpSession session,
	        RedirectAttributes ra
	    ) {
	        User loginUser = (User) session.getAttribute("loginUser");
	        String teacherId = loginUser.getUserId();
	        String currentPw = (String) paramMap.get("currentPassword");
	        String newPw = (String) paramMap.get("newPassword");
	        String confirmPw = (String) paramMap.get("confirmPassword");

	        // 현재 비밀번호 검증
	        if (currentPw == null || !loginUser.getPassword().equals(currentPw)) {
	            ra.addFlashAttribute("error", "❌ 현재 비밀번호가 일치하지 않습니다.");
	            return "redirect:/teacher/profile/edit";
	        }

	        // 새 비밀번호 일치 여부 확인
	        if (newPw != null && !newPw.isEmpty()) {
	            if (!newPw.equals(confirmPw)) {
	                ra.addFlashAttribute("error", "❌ 새 비밀번호가 일치하지 않습니다.");
	                return "redirect:/teacher/profile/edit";
	            }
	            paramMap.put("password", newPw);
	        } else {
	            paramMap.remove("password"); // 변경 없으면 제외
	        }

	        paramMap.put("teacherId", teacherId);
	        teacherMapper.updateTeacherProfile(paramMap);
	        ra.addFlashAttribute("success", "✅ 개인정보가 성공적으로 수정되었습니다.");
	        return "redirect:/teacher/profile";
	    }

	 // 교보제 조회
	    @GetMapping("/material/list")
	    public String materialList(HttpSession session, Model model) {
	    	User loginUser = (User) session.getAttribute("loginUser");
	        String teacherId = loginUser.getUserId();
	        
	        List<Map<String, Object>> materialList = teacherMapper.selectMaterialListByTeacher(teacherId);
	        model.addAttribute("materialList", materialList);
	        return "teacher/materialList";
	    }
	    
	 // 교보제 요청 폼
	    @GetMapping("/material/request")
	    public String requestMaterialForm(HttpSession session, Model model) {
	    	User loginUser = (User) session.getAttribute("loginUser");
	        String teacherId = loginUser.getUserId();
	    	
	    	// 강사가 배정된 강좌만 뽑기 (드롭다운)
	        List<Map<String, Object>> lectureList = teacherMapper.selectLectureListByTeacher(teacherId);
	        model.addAttribute("lectureList", lectureList);
	   
	        return "teacher/materialRequestForm";
	    }
	    
	// 교보제 요청 처리
	    @PostMapping("/material/request")
	    public String insertMaterialRequest(@RequestParam Map<String, Object> paramMap, RedirectAttributes ra) {
	    	teacherMapper.insertMaterialRequest(paramMap);
	    	ra.addFlashAttribute("success", "교보제 요청이 등록되었습니다.");
	    	return "redirect:/teacher/main";
	    }

	// 출석조회 (본인수업학생만, 검색+페이징)
	    @GetMapping("/attendance/list")
	    public String getAttendanceList(
	            HttpSession session,
	            Model model,
	            @RequestParam(defaultValue = "1") int page,
	            @RequestParam(defaultValue = "") String keyword
	    ) {
	        User loginUser = (User) session.getAttribute("loginUser");
	        String teacherId = loginUser.getUserId();

	        int rowPerPage = 10;
	        int startRow = (page - 1) * rowPerPage;

	        Map<String, Object> param = new HashMap<>();
	        param.put("teacherId", teacherId);
	        param.put("startRow", startRow);
	        param.put("rowPerPage", rowPerPage);
	        param.put("keyword", keyword);

	        List<Map<String, Object>> attendanceList = teacherMapper.selectAttendanceListByTeacher(param);
	        int totalRow = teacherMapper.countAttendanceListByTeacher(param);
	        int lastPage = (int) Math.ceil((double) totalRow / rowPerPage);

	        model.addAttribute("attendanceList", attendanceList);
	        model.addAttribute("page", page);
	        model.addAttribute("lastPage", lastPage);
	        model.addAttribute("keyword", keyword);

	        return "teacher/attendanceList";
	    }

	  
	 // 출석체크 (오늘 기준)
	    @GetMapping("/attendance/check")
	    public String attendanceCheckForm(HttpSession session, Model model) {
	        User loginUser = (User) session.getAttribute("loginUser");
	        String teacherId = loginUser.getUserId();

	        // 오늘 날짜의 출결 대상자 리스트
	        List<Map<String, Object>> checkList = attendanceMapper.selectAttendanceCheckListByTeacher(teacherId);
	        model.addAttribute("checkList", checkList);
	        return "teacher/attendanceCheck";
	    }
	 // 출석 체크 처리 (기존 ID가 있으면 update, 없으면 insert)
	    @PostMapping("/attendance/check")
	    public String updateAttendanceStatus(@RequestParam(value = "attendanceId", required = false) String attendanceId,
	                                         @RequestParam(value = "paymentId", required = false) String paymentId,
	                                         @RequestParam("status") String status,
	                                         RedirectAttributes redirectAttributes) {
	    	 	
	    	 // 존재하면 수정, 없으면 새로 insert
	        if (attendanceId != null && !attendanceId.isBlank()) {
	            attendanceService.updateAttendanceStatus(Integer.parseInt(attendanceId), status);
	        } else if (paymentId != null && !paymentId.isBlank()) {
	            attendanceService.insertAttendance(paymentId, status);
	        }

	        redirectAttributes.addFlashAttribute("success", "출석 상태가 변경되었습니다.");
	        return "redirect:/teacher/attendance/check";
	    }
	    
	// 공지사항
	    @GetMapping("/notice/list")
	    public String noticeList(Model model,
	                             @RequestParam(defaultValue = "1") int page,
	                             @RequestParam(defaultValue = "") String keyword) {

	        int rowPerPage = 10;
	        int startRow = (page - 1) * rowPerPage;

	        Map<String, Object> param = new HashMap<>();
	        param.put("startRow", startRow);
	        param.put("rowPerPage", rowPerPage);
	        param.put("keyword", keyword);

	        List<Map<String, Object>> noticeList = teacherMapper.selectNoticeList(param);
	        int totalRow = teacherMapper.countNoticeList(keyword);
	        int lastPage = (int) Math.ceil((double) totalRow / rowPerPage);

	        model.addAttribute("noticeList", noticeList);
	        model.addAttribute("page", page);
	        model.addAttribute("lastPage", lastPage);
	        model.addAttribute("keyword", keyword);

	        return "teacher/noticeList"; // JSP 경로에 맞춰 조절
	    }
	 // 사진첩 
	    @GetMapping("/album/list")
	    public String getAlbumList(HttpSession session, Model model,
	                               @RequestParam(defaultValue = "1") int page,
	                               @RequestParam(defaultValue = "") String keyword) {
	        int rowPerPage = 10;
	        int startRow = (page - 1) * rowPerPage;

	        Map<String, Object> param = new HashMap<>();
	        param.put("startRow", startRow);
	        param.put("rowPerPage", rowPerPage);
	        param.put("keyword", keyword);

	        List<Map<String, Object>> albumList = teacherMapper.selectAlbumList(param);
	        int totalRow = teacherMapper.countAlbumList(param);
	        int lastPage = (int) Math.ceil((double) totalRow / rowPerPage);

	        model.addAttribute("albumList", albumList);
	        model.addAttribute("page", page);
	        model.addAttribute("lastPage", lastPage);
	        model.addAttribute("keyword", keyword);

	        return "teacher/albumList";
	    }

	    

	}