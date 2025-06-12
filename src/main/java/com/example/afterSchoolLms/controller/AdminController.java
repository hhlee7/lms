package com.example.afterSchoolLms.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.afterSchoolLms.dto.Page;
import com.example.afterSchoolLms.dto.Role;
import com.example.afterSchoolLms.dto.StudentParent;
import com.example.afterSchoolLms.dto.TeacherHistory;
import com.example.afterSchoolLms.dto.User;
import com.example.afterSchoolLms.mapper.TeacherMapper;
import com.example.afterSchoolLms.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Transactional
@Controller
@Slf4j
public class AdminController {
	@Autowired AdminService adminService;
	@Autowired TeacherMapper teacherMapper;
	@Autowired JavaMailSender javaMailSender;
	
	/** 강사 경력 입력/수정 **/
	@PostMapping("modifyHistory")
	public String modifyHistory(TeacherHistory th) {
		TeacherHistory teacherHistory = adminService.selectTeacherHistoryListByTeacherId(th.getTeacherId());
		
		if(teacherHistory == null) { // 강사 경력이 없음
			int row = adminService.insertHistory(th);
			if(row != 1) {	// 삽입 이상
				
				return "redirect:/userOne?userId="+th.getTeacherId();
			}
		}
		else {
			int row = adminService.modifyHistory(th);
			if(row != 1) {	// 갱신 이상
				
				return "redirect:/userOne?userId="+th.getTeacherId();
			}
		}
		
		return "redirect:/userOne?userId="+th.getTeacherId();
	}
	
	/** 회원 등록 페이지 **/
	@GetMapping("userInsert")
	public String userInsert(Model model) {
		
		String uuid = UUID.randomUUID().toString().replaceAll("-","").substring(0,16);
		
		
		// 역할 리스트
		List<Role> roleList = adminService.selectRoleList();
		model.addAttribute("roleList",roleList);
		model.addAttribute("uuid",uuid);
		return "admin/userInsert";
	}
	
	/** 회원 등록 기능 **/
	@PostMapping("userInsert")
	public String userInsert(User user, StudentParent studentParent) {
		
		int row = adminService.insertUser(user);
		
		if(user.getRoleId() == 4) { // 학부모일 때 자녀 관계도 같이 추가
			studentParent.setParentId(user.getUserId());
			int spRow = adminService.insertStudentParent(studentParent);
		}
		
		if(row != 1) {	// 실패 했을 때 코드
			
		}
		
		// 메일로 가입을 알리고 임시 비밀번호와 아이디를 보낸다
		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setFrom("admin@localhost.com");
		msg.setTo(user.getEmail());
		msg.setSubject("ㅇㅇ초등학교 입니다. 계정 가입을 완료 했습니다.");
		msg.setText("아이디 : "+user.getUserId()+" 비밀번호 : "+user.getPassword()+" 로그인 하여 비밀번호를 수정해 주세요.");
		
		javaMailSender.send(msg);
		
		return "redirect:/userOne?userId="+user.getUserId();
	}
	
	/** 회원 한명의 정보를 수정 하는 페이지 **/
	@GetMapping("userOne")
	public String userOne(Model model, @RequestParam String userId) {
		// 회원 한 명 조회
		Map<String,Object> selectedUser = adminService.selectUserByUserId(userId);
		
		// 선택한 회원의 역할 ID를 가져온다
		int roleId = (int) selectedUser.get("roleId");
		// 그 역할 ID마다 추가 데이터가 있다
		switch(roleId) {
			case 1:				// 관리자	
				break;
			case 2:				// 학생
				List<Map<String,Object>> parentUser = new ArrayList<>();
				parentUser = adminService.selectUserByStudentId((String)selectedUser.get("userId"));
				model.addAttribute("parentUser",parentUser);
				break;
			case 3:				// 강사
				List<Map<String,Object>> lectureList = new ArrayList<>();
				TeacherHistory historyList = new TeacherHistory();
				lectureList = teacherMapper.selectLectureListByTeacher((String)selectedUser.get("userId"));
				historyList = adminService.selectTeacherHistoryListByTeacherId((String)selectedUser.get("userId"));
				log.info(historyList.toString());
				model.addAttribute("lectureList",lectureList);
				model.addAttribute("historyList", historyList);
				break;
			case 4:				// 학부모
				List<Map<String,Object>> studentUser = new ArrayList<>();
				studentUser = adminService.selectUserByParentId((String)selectedUser.get("userId"));
				model.addAttribute("studentUser",studentUser);
				break;
			case 5:				// 운전기사
				List<Map<String,Object>> vehicleList = new ArrayList<>();
				vehicleList = adminService.selectVehicleByDriverId((String)selectedUser.get("userId"));
				model.addAttribute("vehicleList",vehicleList);
				break;
		}
		
		// 역할 리스트
		List<Role> roleList = adminService.selectRoleList();
		
		// 모델값 넘기기
		model.addAttribute("selectedUser",selectedUser);
		model.addAttribute("roleList",roleList);
		
		return "admin/userOne";
	}
	
	/** 회원 정보 수정 기능 **/
	@PostMapping("userOne")
	public String userOne(User user) {
		int row = adminService.modifyUser(user);
		
		if(row != 1) {	// 실패 했을 때
			
		}
		
		return "redirect:/userManagement";
	}
	
	
	/** 회원 관리 페이지로 **/
	@GetMapping("userManagement")
	public String userManagement(Model model
			,@RequestParam(defaultValue = "1") int page
			,@RequestParam(defaultValue = "10") int size
			,@RequestParam(defaultValue = "") String searchWord
			,@RequestParam(defaultValue = "all") String searchType) {
		
		
		int roleType = 0;
		switch(searchType) {
		case "관리자":			// 관리자	
			roleType = 1; break;
		case "학생":				// 학생
			roleType = 2; break;
		case "강사":				// 강사
			roleType = 3; break;
		case "학부모":			// 학부모
			roleType = 4; break;
		case "운전기사":			// 운전기사
			roleType = 5; break;
		}
		
		// 페이징
		Page paging = new Page(size, page, 0, searchWord, searchType, roleType);
		
		// 전체 데이터 수 구하기
		int totalCount = adminService.getTotalCount(paging);
		paging.setTotalCount(totalCount);
		
		// 유저 리스트
		List<User> userList = adminService.selectUserList(paging);
		// 역할 리스트
		List<Role> roleList = adminService.selectRoleList();
		
		// 모델 값 넘기기
		model.addAttribute("userList",userList);
		model.addAttribute("roleList",roleList);
		model.addAttribute("page",paging);
		return "admin/userManagement";
	}
}
