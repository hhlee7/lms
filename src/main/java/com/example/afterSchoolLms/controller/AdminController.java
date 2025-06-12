package com.example.afterSchoolLms.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.afterSchoolLms.dto.Page;
import com.example.afterSchoolLms.dto.Role;
import com.example.afterSchoolLms.dto.StudentParent;
import com.example.afterSchoolLms.dto.TeacherHistory;
import com.example.afterSchoolLms.dto.User;
import com.example.afterSchoolLms.dto.Vehicle;
import com.example.afterSchoolLms.mapper.TeacherMapper;
import com.example.afterSchoolLms.service.AdminService;

import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;

@Transactional
@Controller
@Slf4j
public class AdminController {
	@Autowired AdminService adminService;
	@Autowired TeacherMapper teacherMapper;
	@Autowired JavaMailSender javaMailSender;
	
	/** 관리자 메인 페이지 **/
	@GetMapping("adminMain")
	public String adminMain() {
		return "admin/adminMain";
	}
	
	/** 차량 관리 페이지 **/
	@GetMapping("vehicleManagement")
	public String vehicleManagement(Model model) {
		List<Map<String,Object>> vehicleList = adminService.selectVehicleList();
		model.addAttribute("vehicleList",vehicleList);
		return "admin/vehicleManagement";
	}
	
	/** 차량 등록 페이지 **/
	@GetMapping("vehicleInsert")
	public String vehicleInsert() {
		return "admin/vehicleInsert";
	}
	
	/** 차량 등록 기능 **/
	@PostMapping("vehicleInsert")
	public String vehicleInsert(Vehicle vc) {
		int row = adminService.insertVehicle(vc);
		
		if(row != 1) {	// 삽입 이상
			
		}
		
		return "redirect:/vehicleManagement";
	}
	
	/** 차량 수정 페이지 **/
	@GetMapping("vehicleModify")
	public String vehicleModify(@RequestParam String vehicleId, Model model) {
		Vehicle vc = adminService.selectVehicleByVehicleId(Integer.parseInt(vehicleId));
		model.addAttribute(vc);
		return "admin/vehicleModify";
	}
	
	/** 차량 수정 기능 **/
	@PostMapping("vehicleModify")
	public String vehicleModify(Vehicle vc) {
		int row = adminService.modifyVehicle(vc);
		
		if(row != 1) {	// 갱신 이상
			
		}
		
		return "redirect:/vehicleManagement";
	}
	
	/** 차량 배정 페이지 **/
	@GetMapping("vehicleAssignmentInsert")
	public String vehicleAssignmentInsert(@RequestParam String vehicleId, Model model) {
		
		// 차량 정보
		Vehicle vehicle = adminService.selectVehicleByVehicleId(Integer.parseInt(vehicleId));
		model.addAttribute("vehicle",vehicle);
		
		// 강좌 리스트
		List<Map<String,Object>> lectureList = adminService.selectLectureList();
		model.addAttribute("lectureList",lectureList);
		
		// 운전기사 리스트
		
		return "admin/vehicleAssignmentInsert";
	}
	
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
    	// 랜덤 임시 비밀번호
        String uuid = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 16);
        model.addAttribute("uuid", uuid);

        model.addAttribute("user", new User()); // 유효성 검사 및 <form:form> 사용을 위한 필수

        List<Role> roleList = adminService.selectRoleList();
        model.addAttribute("roleList", roleList);

        return "admin/userInsert"; // JSP 경로
    }

    /** 회원 등록 기능 **/
    @PostMapping("userInsert")
    public String userInsert(@Valid @ModelAttribute("user") User user,
                             BindingResult result,
                             @ModelAttribute StudentParent studentParent,
                             Errors errors,
                             Model model) {

        // 유효성 검사 실패 시 다시 등록 폼으로
    	if (result.hasErrors() || user.getBirth().trim().isEmpty()) {
    		for(FieldError e : errors.getFieldErrors()) {
				model.addAttribute(e.getField() + "Error", e.getDefaultMessage());				
			}
    		// 랜덤 임시 비밀번호 재발급
            String uuid = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 16);
            model.addAttribute("uuid", uuid);
            model.addAttribute("roleList", adminService.selectRoleList()); // 폼에 필요한 데이터 유지
            return "admin/userInsert"; // redirect 말고 이걸로
        }
    	
        int row = adminService.insertUser(user);

        if (user.getRoleId() == 4) { // 학부모일 때 자녀 관계도 같이 추가
            studentParent.setParentId(user.getUserId());
            int spRow = adminService.insertStudentParent(studentParent);
        }

        // 실패 처리 예시
        if (row != 1) {
            model.addAttribute("error", "회원 등록에 실패했습니다.");
            model.addAttribute("roleList", adminService.selectRoleList());
            return "admin/userInsert";
        }

        // 이메일 발송
        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setFrom("admin@localhost.com");
        msg.setTo(user.getEmail());
        msg.setSubject("ㅇㅇ초등학교입니다. 계정 가입을 완료했습니다.");
        msg.setText("아이디 : " + user.getUserId() + "\n비밀번호 : " + user.getPassword() + "\n로그인 후 비밀번호를 수정해 주세요.");
        try {
            javaMailSender.send(msg);
        } catch (MailException e) {	// 이메일 전송 실패
            // 예외 로그 출력 (원하는 로깅 방식 사용)
            // e.printStackTrace();

            // 필요하면 사용자에게 이메일 발송 실패 메시지 전달
            // 예: model.addAttribute("emailError", "이메일 발송에 실패했습니다.");
        }

        return "redirect:/userOne?userId=" + user.getUserId();
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
	
	/** 회원 정보 수정 페이지 **/
	@GetMapping("userModify")
	public String userModify(@Valid @ModelAttribute("user") User user,
					            BindingResult result,
					            @ModelAttribute StudentParent studentParent,
					            Errors errors,
					            Model model,
					            @RequestParam String userId) {
		// 회원 한 명 조회
		Map<String,Object> selectedUser = adminService.selectUserByUserId(userId);
		// 역할 리스트
		List<Role> roleList = adminService.selectRoleList();
		
		// 모델값 넘기기
		model.addAttribute("selectedUser",selectedUser);
		model.addAttribute("roleList",roleList);
		
		return "admin/userModify";
	}
	
	/** 회원 정보 수정 기능 **/
	@PostMapping("userModify")
	public String userModify(User user) {
		int row = adminService.modifyUser(user);
				
		if(row != 1) {	// 실패 했을 때
			
		}
		
		return "redirect:/userOne?userId="+user.getUserId();
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
