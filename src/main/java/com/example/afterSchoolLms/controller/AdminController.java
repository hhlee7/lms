package com.example.afterSchoolLms.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.afterSchoolLms.dto.Classroom;
import com.example.afterSchoolLms.dto.Lecture;
import com.example.afterSchoolLms.dto.Subject;
import com.example.afterSchoolLms.dto.TeacherAssignment;
import com.example.afterSchoolLms.dto.User;
import com.example.afterSchoolLms.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {

	@Autowired AdminService adminService;
	
	@GetMapping("userManagement")
	public String userManagement() {
		return "admin/userManagement";
	}
	
	// 과목 관리 페이지
	// 과목 리스트 조회
	@GetMapping("/admin/subjectManagement")
	public String subjectManagement(Model model) {
		List<Subject> subjectList = adminService.getSubjectList();
		model.addAttribute("subjectList", subjectList);
		return "admin/subjectManagement";
	}
	
	// 과목 추가 페이지
	@GetMapping("/admin/createSubject")
	public String createSubject() {
		return "admin/createSubject";
	}
	
	// 과목 추가
	@PostMapping("/admin/createSubject")
	public String createSubject(Subject subject) {
		int row = adminService.createSubject(subject);
		
		if(row != 1) {
			log.info("insert error");
			return "redirect:/admin/subjectManagement";
		}
		
		return "redirect:/admin/subjectManagement";
	}
	
	// 과목 수정 페이지
	@GetMapping("/admin/modifySubject")
	public String modifySubject(@RequestParam int subjectId, Model model) {
		Subject subject = adminService.getSubjectById(subjectId);
		model.addAttribute("subject", subject);
		return "admin/modifySubject";
	}
	
	// 해당 과목의 데이터 수정
	@PostMapping("/admin/modifySubject")
	public String modifySubject(Subject subject) {
		int row = adminService.modifySubject(subject);
		
		if(row != 1) {
			log.info("update error");
			return "redirect:/admin/subjectManagement";
		}
		
		return "redirect:/admin/subjectManagement";
	}
	
	// 과목 삭제
	@PostMapping("/admin/removeSubject")
	public String removeSubject(@RequestParam int subjectId) {
		int row = adminService.removeSubject(subjectId);
		
		if(row != 1) {
			log.info("delete error");
			return "redirect:/admin/subjectManagement";
		}
		
		return "redirect:/admin/subjectManagement";
	}
	
	// 수강 신청 현황 조회 페이지
	@GetMapping("/admin/studentEnrollmentList")
	public String studentEnrollmentList(Model model) {
		List<Map<String, Object>> list = adminService.getStudentEnrollmentList();
		model.addAttribute("studentEnrollmentList", list);
		return "admin/studentEnrollmentList";
	}
	
	// 수강료 납부 내역 조회 페이지
	@GetMapping("/admin/paymentList")
	public String paymentList(Model model) {
		List<Map<String, Object>> list = adminService.getPaymentList();
		model.addAttribute("paymentList", list);
		return "admin/paymentList";
	}
	
	// 수강 신청 취소 내역 조회 페이지
	@GetMapping("/admin/enrollmentCancelList")
	public String enrollmentCancelList(Model model) {
		List<Map<String, Object>> list = adminService.getEnrollmentCancelList();
		model.addAttribute("enrollmentCancelList", list);
		return "admin/enrollmentCancelList";
	}
	
	// 환불 내역 조회 (수강 신청의 status가 'REFUNDWAIT' or 'REFUND'인 데이터만 조회)
	@GetMapping("/admin/refundList")
	public String refundList(Model model) {
		List<Map<String, Object>> list = adminService.getRefundList();
		model.addAttribute("refundList", list);
		return "admin/refundList";
	}
	
	// 환불 대기중(수강 신청의 status가 'REFUNDWAIT')인 수강 신청 건 환불 처리
	@PostMapping("/admin/changeRefund")
	public String changeRefund(@RequestParam int enrollmentId) {
		int row = adminService.changeRefund(enrollmentId);
		
		if(row != 1) {
			log.info("update error");
			return "redirect:/admin/refundList";
		}
		
	// 환불 처리 후 payment 테이블의 결제 데이터 삭제
		int row2 = adminService.removePayment(enrollmentId);
		
		if(row2 != 1) {
			log.info("delete error");
			return "redirect:/admin/refundList";
			
		}
		
		return "redirect:/admin/refundList";
	}
	
	// 수업 리스트 조회
	@GetMapping("/admin/lectureList")
	public String lectureList(Model model) {
		List<Map<String, Object>> list = adminService.getLectureList();
		model.addAttribute("lectureList", list);
		return "admin/lectureList";
	}
	
	// 수업 등록 페이지
	@GetMapping("/admin/createLecture")
	public String createLecture(Model model) {
		// 등록된 과목 조회
		List<Subject> subjectList = adminService.getSubjectList();
		model.addAttribute("subjectList", subjectList);
		
		// 등록된 강의실 조회
		List<Classroom> classroomList = adminService.getClassroomList();
		model.addAttribute("classroomList", classroomList);
		
		// 등록된 강사 조회
		List<User> teacherList = adminService.getTeacherList();
		model.addAttribute("teacherList", teacherList);
		
		return "admin/createLecture";
	}
	
	// 수업 등록
	@PostMapping("/admin/createLecture")
	public String createLecture(Lecture lecture, TeacherAssignment teacherAssignment) {
		// 수업 등록 폼에서 전달된 데이터 확인용 출력
		log.info(lecture.toString());
		
		// 수업 등록
		int row = adminService.createLecture(lecture);
		
		if(row != 1) {
			log.info("insert error");
			return "redirect:/admin/lectureList";
		}
		
		// DB에서 생성된 PK값(lectureId) 확인용 출력
		log.info("생성된 lectureId: " + lecture.getLectureId());
		
		// 강사 배정 정보 준비
		teacherAssignment.setLectureId(lecture.getLectureId());
		
		// DB에 강사 배정 정보 등록
		int row2 = adminService.createTeacherAssignment(teacherAssignment);
		
		if(row2 != 1) {
			log.info("강사 배정 insert 실패");
			return "redirect:/admin/lectureList";
		}
		
		return "redirect:/admin/lectureList";
	}
	
	// 수업 수정 페이지
	@GetMapping("/admin/modifyLecture")
	public String modifyLecture(@RequestParam int lectureId, Model model) {
		// 등록된 과목 조회
		List<Subject> subjectList = adminService.getSubjectList();
		model.addAttribute("subjectList", subjectList);
		
		// 등록된 강의실 조회
		List<Classroom> classroomList = adminService.getClassroomList();
		model.addAttribute("classroomList", classroomList);
		
		// 등록된 강사 조회
		List<User> teacherList = adminService.getTeacherList();
		model.addAttribute("teacherList", teacherList);
		
		// 해당 lectureId를 가지는 lecture 데이터 조회
		Lecture lecture = adminService.getLectureById(lectureId);
		model.addAttribute("lecture", lecture);
		
		// 해당 lectureId를 가지는 teacherAssignment 데이터 조회
		TeacherAssignment teacherAssignment = adminService.getTeacherById(lecture.getLectureId());
		model.addAttribute("teacherId", teacherAssignment);
		return "admin/modifyLecture";
	}
	
	// 수업 수정
	@PostMapping("/admin/modifyLecture")
	public String modifyLecture(Lecture lecture, @RequestParam String teacherId) {
		
		// 수업 정보 수정
		int row = adminService.modifyLecture(lecture);
		
		if(row != 1) {
			log.info("수업 정보 update error");
			return "redirect:/admin/lectureList";
		}
		
		// 강사 배정 정보 수정
		TeacherAssignment teacherAssignment = new TeacherAssignment();
		teacherAssignment.setLectureId(lecture.getLectureId());
		teacherAssignment.setTeacherId(teacherId);
		int row2 = adminService.modifyTeacherAssignment(teacherAssignment);
		
		if(row2 != 1) {
			log.info("강사 배정 정보 update error");
			return "redirect:/admin/lectureList";
		}
		
		return "redirect:/admin/lectureList";
	}
}
