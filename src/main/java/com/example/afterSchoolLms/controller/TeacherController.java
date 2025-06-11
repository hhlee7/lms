package com.example.afterSchoolLms.controller;

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
import com.example.afterSchoolLms.mapper.TeacherMapper;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
	
	
	@Controller
	@RequestMapping("/teacher")
	@Slf4j
	public class TeacherController {
		
		private final TeacherMapper teacherMapper;
		
	// 생성자 = 의존성 주입
		public TeacherController(TeacherMapper teacherMapper) {
			this.teacherMapper = teacherMapper;
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
	    public String getStudentList(HttpSession session, Model model) {
	    	User loginUser = (User) session.getAttribute("loginUser");
	    	String teacherId = loginUser.getUserId();
	        List<Map<String, Object>> studentList = teacherMapper.selectStudentListByTeacher(teacherId);
	        model.addAttribute("studentList", studentList);
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




	        
}
