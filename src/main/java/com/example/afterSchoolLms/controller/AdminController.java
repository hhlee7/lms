package com.example.afterSchoolLms.controller;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.afterSchoolLms.dto.Album;
import com.example.afterSchoolLms.dto.AlbumPhoto;
import com.example.afterSchoolLms.dto.Attendance;
import com.example.afterSchoolLms.dto.Classroom;
import com.example.afterSchoolLms.dto.Lecture;
import com.example.afterSchoolLms.dto.Material;
import com.example.afterSchoolLms.dto.Notice;
import com.example.afterSchoolLms.dto.Page;
import com.example.afterSchoolLms.dto.Qna;
import com.example.afterSchoolLms.dto.Role;
import com.example.afterSchoolLms.dto.StudentParent;
import com.example.afterSchoolLms.dto.Subject;
import com.example.afterSchoolLms.dto.TeacherAssignment;
import com.example.afterSchoolLms.dto.TeacherHistory;
import com.example.afterSchoolLms.dto.User;
import com.example.afterSchoolLms.dto.Vehicle;
import com.example.afterSchoolLms.dto.VehicleAssignment;
import com.example.afterSchoolLms.mapper.TeacherMapper;
import com.example.afterSchoolLms.service.AdminService;
import com.example.afterSchoolLms.service.LoginService;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {

    private final LoginService loginService;
	@Autowired AdminService adminService;
	@Autowired TeacherMapper teacherMapper;
	@Autowired JavaMailSender javaMailSender;

    AdminController(LoginService loginService) {
        this.loginService = loginService;
    }
	
    /** 관리자 대시보드 페이지 **/
    @GetMapping("/admin/dashboard")
    public String dashboard() {
    	return "/admin/dashboard";
    }
    
    /** 학생 배차 취소 조회 페이지 **/
    @GetMapping("/admin/vehicleCancel")
    public String vehicleCancel(Model model
			,@RequestParam(defaultValue = "1") int page
			,@RequestParam(defaultValue = "10") int size
			,@RequestParam(defaultValue = "") String searchName
			,@RequestParam(defaultValue = "") String searchDate) {
    	
		// 페이징
		Page paging = new Page(size, page, 0, searchName, searchDate, null);
		
		// 전체 데이터 수 구하기
		int totalCount = adminService.cancelCount(paging);
		paging.setTotalCount(totalCount);
		
		model.addAttribute("page",paging);

		// 전체 리스트
		List<Map<String, Object>> cancelList = adminService.selectCancelList(paging);
		model.addAttribute("cancelList",cancelList);
    	
    	return "/admin/vehicleCancel";
    }
    
    /** 학생 배차 관리 페이지 **/
    @GetMapping("/admin/studentDispatchManagement")
    public String studentDispatchManagement(Model model
    		, @RequestParam(defaultValue="") String lectureId
    		, @RequestParam(defaultValue="") String searchName) {
    	
    	// 수업 리스트
    	List<Map<String,Object>> lectureList = adminService.selectLectureList();
    	model.addAttribute("lectureList",lectureList);
    	
    	// 선택된 수업이 없다면 -> 전체 배차 조회
    	Map<String, Object> target = new HashMap<>();
    	target.put("lectureId", lectureId);
    	target.put("searchName", searchName);
    	List<Map<String,Object>> dispatchList = adminService.selectPassengerList(target);
    	

    	int currentYear = LocalDate.now().getYear();

    	for (Map<String, Object> dp : dispatchList) {
    	    Object birthObj = dp.get("birth");

    	    int birthYear = 0;

    	    if (birthObj instanceof java.sql.Date) {
    	        // java.sql.Date는 toLocalDate()를 제공하므로 아래처럼 처리
    	        birthYear = ((java.sql.Date) birthObj).toLocalDate().getYear();

    	    } else if (birthObj instanceof java.util.Date) {
    	        birthYear = ((java.util.Date) birthObj).toInstant()
    	                        .atZone(ZoneId.systemDefault())
    	                        .toLocalDate()
    	                        .getYear();

    	    } else if (birthObj instanceof String) {
    	        // 형식이 "1991-08-20"이면 substring 가능
    	        birthYear = Integer.parseInt(((String) birthObj).substring(0, 4));
    	    } else {
    	        // 예외 상황 처리
    	        log.warn("Unsupported birth format: {}", birthObj);
    	        dp.put("grade", "-");
    	        continue;
    	    }

    	    int grade = currentYear - birthYear - 6;

    	    if (grade >= 1 && grade <= 6) {
    	        dp.put("grade", grade + "학년");
    	    } else {
    	        dp.put("grade", "-");
    	    }
    	}
    	
    	model.addAttribute("dispatchList",dispatchList);
    	
    	// 수업 아이디, 검색 이름 저장
    	model.addAttribute("lectureId",lectureId); 		
    	model.addAttribute("searchName",searchName);
    	
    	
    	return "admin/studentDispatchManagement";
    }
    
	/** 관리자 메인 페이지 **/
	@GetMapping("/admin/main")
	public String adminMain(Model model) {
		
		// 미응답 Q&A 수
		int qnaCount = adminService.qnaCount();
		if(qnaCount != 0) {
			model.addAttribute("qnaCount",qnaCount);
		}
		
		return "admin/main";
	}
	
	/** Q&A 리스트 페이지 **/
	@GetMapping("/admin/qnaManagement")
	public String qnaManagement(Model model
			,@RequestParam(defaultValue = "1") int page
			,@RequestParam(defaultValue = "10") int size
			,@RequestParam(defaultValue = "") String searchWord
			,@RequestParam(defaultValue = "") String searchType) {
		
		// 페이징
		Page paging = new Page(size, page, 0, searchWord, searchType, null);
		
		// 전체 데이터 수 구하기
		int totalCount = adminService.qnaTotalCount(paging);
		paging.setTotalCount(totalCount);
		
		model.addAttribute("page",paging);
		
		// 전체 리스트
		List<Qna> qnaList = adminService.selectQnaList(paging);
		model.addAttribute("qnaList",qnaList);
		
		// 미응답 Q&A 수
		int qnaCount = adminService.qnaCount();
		if(qnaCount != 0) {
			model.addAttribute("qnaCount",qnaCount);			
		}
		
		return "admin/qnaManagement";
	}
	
	/** Q&A 상세 페이지 **/
	@GetMapping("/admin/qnaOne")
	public String qnaOne(Model model, @RequestParam String qnaId) {
		Qna qna = adminService.selectQnaOne(Integer.parseInt(qnaId));
		model.addAttribute(qna);
		return "admin/qnaOne";
	}
	
	/** Q&A 관리자 응답 **/
	@PostMapping("/admin/qnaAnswer")
	public String qnaAnswer(Qna qna) {
		int row = adminService.modifyQna(qna);
		
		if(row != 1) {	// 갱신 이상
			
		}
		
		return "redirect:/admin/qnaOne?qnaId="+qna.getQnaId();
	}
	
	/** 앨범 등록 페이지 **/
	@GetMapping("/admin/albumInsert")
	public String albumInsert(Model model) {
		List<Map<String, Object>> lectureList = adminService.selectLectureList();
		
		for(Map<String, Object> m : lectureList) {
			log.info(m.toString());
		}
		
		model.addAttribute("lectureList",lectureList);
		return "admin/albumInsert";
	}
	
	/** 앨범 등록 기능 **/
	@PostMapping("/admin/albumInsert")
	public String albumInsert(Album album, @RequestParam("photoFiles") List<MultipartFile> photoFiles) {
	    adminService.insertAlbum(album, photoFiles);
	    for(MultipartFile f : photoFiles) {
	    	log.info("ssssssssssss"+f.toString());
	    }
	    return "redirect:/admin/albumManagement";
	}
	
	/** 앨범 상세 페이지 **/
	@GetMapping("/admin/albumOne")
	public String albumOne(Model model, @RequestParam String albumId) {
		List<AlbumPhoto> photoList = adminService.selectAlbumPhotoList(Integer.parseInt(albumId));
		Map<String,Object> album = adminService.selectAlbumOne(Integer.parseInt(albumId));
		
		// 웹에 노출 가능한 경로로 변환
	    for (AlbumPhoto photo : photoList) {
	    	photo.setFilePath(photo.getFilePath()); // ubuntu 폴더 기준으로 변경
	    }
		
		model.addAttribute("photoList",photoList);
		model.addAttribute("album",album);
		return "admin/albumOne";
	}
	
	/** 앨범 관리 페이지 **/
	@GetMapping("/admin/albumManagement")
	public String albumManagement(Model model,
	        @RequestParam(defaultValue = "1") int page,
	        @RequestParam(defaultValue = "10") int size,
	        @RequestParam(defaultValue = "all") String searchType,  // lectureId 필터
	        @RequestParam(defaultValue = "") String searchWord) {   // title 검색
		
	    Page paging = new Page(size, page, 0, searchWord, searchType, null);

	    int totalCount = adminService.albumCount(paging);
	    paging.setTotalCount(totalCount);

	    List<Map<String, Object>> albumList = adminService.selectAlbumList(paging);
	    List<Map<String, Object>> lectureList = adminService.selectLectureList();

	    model.addAttribute("lectureList", lectureList);
	    model.addAttribute("albumList", albumList);
	    model.addAttribute("page", paging);

	    return "admin/albumManagement";
	}
	
	/** 공지사항 관리 페이지 **/
	@GetMapping("/admin/noticeManagement")
	public String noticeManagement(Model model
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
		int totalCount = adminService.noticeTotalCount(paging);
		paging.setTotalCount(totalCount);
		
		List<Map<String,Object>> noticeList = adminService.selectNoticeList(paging);
		
		// 역할 리스트
		List<Role> roleList = adminService.selectRoleList();

		model.addAttribute("roleList",roleList);
		model.addAttribute("page",paging);
		model.addAttribute("noticeList",noticeList);
		return "admin/noticeManagement";
	}
	
	/** 공지사항 등록 페이지 **/
	@GetMapping("/admin/noticeInsert")
	public String noticeInsert(Model model) {
		List<Role> roleList = adminService.selectRoleList();
        model.addAttribute("roleList", roleList);
		return "admin/noticeInsert";
	}
	
	/** 공지사항 등록 기능 **/
	@PostMapping("/admin/noticeInsert")
	public String noticeInsert(Notice notice) {
		int row =adminService.insertNotice(notice);
		
		if(row != 1) {	// 삽입 이상
			
		}

		return "redirect:/admin/noticeManagement";
	}
	
	/** 공지사항 상세 페이지 **/
	@GetMapping("/admin/noticeOne")
	public String noticeOne(Model model, @RequestParam String noticeId) {
		Map<String,Object> notice = adminService.selectNoticeOne(Integer.parseInt(noticeId));
		model.addAttribute("notice",notice);
		return "admin/noticeOne";
	}
	
	/** 공지사항 수정 페이지 **/
	@GetMapping("/admin/noticeModify")
	public String noticeModify(Model model, @RequestParam String noticeId) {
		List<Role> roleList = adminService.selectRoleList();
		Map<String,Object> notice = adminService.selectNoticeOne(Integer.parseInt(noticeId));
		model.addAttribute("notice",notice);
		model.addAttribute("roleList", roleList);
		return "admin/noticeModify";
	}
	
	/** 공지사항 수정 기능 **/
	@PostMapping("/admin/noticeModify")
	public String noticeModify(Notice notice) {
		int row = adminService.modifyNotice(notice);
		
		if(row != 1) {	// 갱신 이상
			
		}

		return "redirect:/admin/noticeOne?noticeId="+notice.getNoticeId();
	}
	
	/** 차량 관리 페이지 **/
	@GetMapping("/admin/vehicleManagement")
	public String vehicleManagement(Model model) {
		List<Map<String,Object>> vehicleList = adminService.selectVehicleList();
		model.addAttribute("vehicleList",vehicleList);
		return "admin/vehicleManagement";
	}
	
	/** 차량 등록 페이지 **/
	@GetMapping("/admin/vehicleInsert")
	public String vehicleInsert(Model model) {
		return "admin/vehicleInsert";
	}
	
	/** 차량 등록 기능 **/
	@PostMapping("/admin/vehicleInsert")
	public String vehicleInsert(Vehicle vc, RedirectAttributes ra) {
	    // 유효성 검사
	    if (vc.getVehicleNo() == null || !vc.getVehicleNo().matches("^[0-9]{2,3}[가-힣][0-9]{4}$")) {
	        ra.addFlashAttribute("msg", "차량 번호 형식이 올바르지 않습니다.");
	        return "redirect:/admin/vehicleForm";
	    }

	    if (vc.getCapacity() < 1 || vc.getCapacity() > 1000) {
	        ra.addFlashAttribute("msg", "최대 수용 인원은 1~1000명 사이여야 합니다.");
	        return "redirect:/admin/vehicleForm";
	    }

	    int row = adminService.insertVehicle(vc);

	    if (row != 1) {
	        ra.addFlashAttribute("msg", "차량 등록에 실패했습니다. 다시 시도해주세요.");
	        return "redirect:/admin/vehicleForm";
	    }

	    ra.addFlashAttribute("msg", "차량이 성공적으로 등록되었습니다.");
	    return "redirect:/admin/vehicleManagement";
	}
	
	/** 차량 수정 페이지 **/
	@GetMapping("/admin/vehicleModify")
	public String vehicleModify(@RequestParam String vehicleId, Model model) {
		Vehicle vc = adminService.selectVehicleByVehicleId(Integer.parseInt(vehicleId));
		model.addAttribute(vc);
		return "admin/vehicleModify";
	}
	
	/** 차량 수정 기능 **/
	@PostMapping("/admin/vehicleModify")
	public String vehicleModify(Vehicle vc) {
		int row = adminService.modifyVehicle(vc);
		
		if(row != 1) {	// 갱신 이상
			
		}
		
		return "redirect:/admin/vehicleManagement";
	}
	
	/** 차량 배정 페이지 **/
	@GetMapping("/admin/vehicleAssignmentInsert")
	public String vehicleAssignmentInsert(@RequestParam String vehicleId, Model model) {
		// 차량 정보
		Vehicle vehicle = adminService.selectVehicleByVehicleId(Integer.parseInt(vehicleId));
		model.addAttribute("vehicle",vehicle);
		
		// 운전기사 리스트
		List<User> driverList = adminService.selectDriverList();
		model.addAttribute("driverList", driverList);
		
		VehicleAssignment vehicleAssignment = adminService.selectVehicleAssignmentByVehicleId(Integer.parseInt(vehicleId));
		if(vehicleAssignment != null) {
			model.addAttribute("vehicleAssignment",vehicleAssignment);
		}
		
		return "admin/vehicleAssignmentInsert";
	}
	
	/** 차량 배정 등록 **/
	@PostMapping("/admin/vehicleAssignmentInsert")
	public String vehicleAssignmentInsert(@RequestParam(defaultValue = "") String driverId, VehicleAssignment va) {
		if (driverId == null || driverId.isEmpty()) {	// 기사를 선택 안 함
		    va.setDriverId(null);
		}
		
		if(va.getAssignmentId() != null) {	// 배정이 있을때는 UPDATE
			int row = adminService.modifyVehicleAssignment(va);
			log.info("차량 배정 업데이트");
			if(row != 1) {	// 갱신 이상
				
			}
		}
		else {	// 배정이 없을때는 INSERT
			int row = adminService.insertVehicleAssignment(va);
			log.info("차량 배정 등록");
			if(row != 1) {	// 삽입 이상
				
			}
		}
		
		return "redirect:/admin/vehicleManagement";
	}
	
	/** 강사 경력 입력/수정 **/
	@PostMapping("/admin/modifyHistory")
	public String modifyHistory(TeacherHistory th) {
		TeacherHistory teacherHistory = adminService.selectTeacherHistoryListByTeacherId(th.getTeacherId());
		
		if(teacherHistory == null) { // 강사 경력이 없음
			int row = adminService.insertHistory(th);
			if(row != 1) {	// 삽입 이상
				
				return "redirect:/admin/userOne?userId="+th.getTeacherId();
			}
		}
		else {
			int row = adminService.modifyHistory(th);
			if(row != 1) {	// 갱신 이상
				
				return "redirect:/admin/userOne?userId="+th.getTeacherId();
			}
		}
		
		return "redirect:/admin/userOne?userId="+th.getTeacherId();
	}
	

    /** 회원 등록 페이지 **/
    @GetMapping("/admin/userInsert")
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
    @PostMapping("/admin/userInsert")
    public String userInsert(@Valid @ModelAttribute("user") User user,
                             BindingResult result,
                             @ModelAttribute StudentParent studentParent,
                             Errors errors,
                             Model model)  throws MessagingException {

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
        msg.setSubject("송린초등학교입니다. 계정 가입을 완료했습니다.");


     // 메일 생성
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

        helper.setTo(user.getEmail());
        helper.setFrom("admin@localhost.com");
        helper.setSubject("송린초등학교 회원가입 완료 안내");

        String htmlContent = "<div style='font-family:Arial,sans-serif;padding:30px;background:#f9f9f9;border:1px solid #ddd;border-radius:10px;'>"
                + "<h2 style='color:#2c3e50;'>회원가입을 환영합니다!</h2>"
                + "<p>안녕하세요, <strong>송린초등학교</strong>입니다.</p>"
                + "<p>방과후 교육에 참여해주셔서 진심으로 감사드립니다.<br/>아이들 교육에 최선을 다하겠습니다.</p>"
                + "<hr style='margin:20px 0;'>"
                + "<p><strong>아이디:</strong> " + user.getUserId() + "</p>"
                + "<p><strong>임시 비밀번호:</strong> " + user.getPassword() + "</p>"
                + "<p style='color:#e74c3c;'>※ 로그인 후 반드시 비밀번호를 변경해주세요.</p>"
                + "<br><p style='font-size:12px;color:#888;'>본 메일은 발신 전용입니다.</p>"
                + "</div>";

        helper.setText(htmlContent, true); // true = HTML

        try {
            javaMailSender.send(message);
        } catch (MailException e) {	// 이메일 전송 실패
            // 예외 로그 출력 (원하는 로깅 방식 사용)
            // e.printStackTrace();

            // 필요하면 사용자에게 이메일 발송 실패 메시지 전달
            // 예: model.addAttribute("emailError", "이메일 발송에 실패했습니다.");
        }

        return "redirect:/admin/userOne?userId=" + user.getUserId();
    }
	
	/** 회원 한명의 정보를 수정 하는 페이지 **/
	@GetMapping("/admin/userOne")
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
				lectureList = adminService.selectLectureByTeacherId((String)selectedUser.get("userId"));
				historyList = adminService.selectTeacherHistoryListByTeacherId((String)selectedUser.get("userId"));
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
	@GetMapping("/admin/userModify")
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
	@PostMapping("/admin/userModify")
	public String userModify(User user) {
		int row = adminService.modifyUser(user);
		log.info(user.toString());
		if(row != 1) {	// 실패 했을 때
			
		}
		
		return "redirect:/admin/userOne?userId="+user.getUserId();
	}
	
	/** 회원 관리 페이지로 **/
	@GetMapping("/admin/userManagement")
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
		List<Map<String,Object>> userList = adminService.selectUserList(paging);
		
		// 역할 리스트
		List<Role> roleList = adminService.selectRoleList();
		
		// 모델 값 넘기기
		model.addAttribute("userList",userList);
		model.addAttribute("roleList",roleList);
		model.addAttribute("page",paging);
		return "admin/userManagement";
	}
	
	// 과목 관리 페이지
	@GetMapping("/admin/subjectManagement")
	public String subjectManagement(Model model) {
		// 과목 목록 조회
		List<Subject> subjectList = adminService.getSubjectList();
		model.addAttribute("subjectList", subjectList);
		return "admin/subjectManagement";
	}
	
	// 과목 등록 페이지
	@GetMapping("/admin/createSubject")
	public String createSubject() {
		return "admin/createSubject";
	}
	
	// 과목 등록
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
	public String studentEnrollmentList(Model model
										,@RequestParam(defaultValue = "1") int page
										,@RequestParam(defaultValue = "10") int size
										,@RequestParam(defaultValue = "") String searchWord
										,@RequestParam(defaultValue = "all") String searchType) {
		// 페이징
		Page paging = new Page(size, page, 0, searchWord, searchType);
		
		// 전체 데이터 수 구하기
		int totalCount = adminService.getTotalStudentEnrollmentCount(paging);
		paging.setTotalCount(totalCount);
		
		
		// 수강 신청 리스트
		List<Map<String, Object>> list = adminService.getStudentEnrollmentList(paging);
		// 과목 리스트
		List<Subject> subjectList = adminService.getSubjectList();
		
		// 모델에 값 전달
		model.addAttribute("studentEnrollmentList", list);
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("page", paging);
		
		return "admin/studentEnrollmentList";
	}
	
	// 수강료 납부 내역 조회 페이지
	@GetMapping("/admin/paymentList")
	public String paymentList(Model model
							,@RequestParam(defaultValue = "1") int page
							,@RequestParam(defaultValue = "10") int size
							,@RequestParam(defaultValue = "") String searchWord
							,@RequestParam(defaultValue = "all") String searchType) {
		// 페이징
		Page paging = new Page(size, page, 0, searchWord, searchType);
		
		// 전체 데이터 수 구하기
		int totalCount = adminService.getTotalPaymentListCount(paging);
		paging.setTotalCount(totalCount);
		
		// 수강료 납부 리스트
		List<Map<String, Object>> list = adminService.getPaymentList(paging);
		// 과목 리스트
		List<Subject> subjectList = adminService.getSubjectList();
		
		// 모델에 값 전달
		model.addAttribute("paymentList", list);
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("page", paging);
		
		return "admin/paymentList";
	}
	
	// 수강 신청 취소 내역 조회 페이지
	@GetMapping("/admin/enrollmentCancelList")
	public String enrollmentCancelList(Model model
										,@RequestParam(defaultValue = "1") int page
										,@RequestParam(defaultValue = "10") int size
										,@RequestParam(defaultValue = "") String searchWord
										,@RequestParam(defaultValue = "all") String searchType) {
		// 페이징
		Page paging = new Page(size, page, 0, searchWord, searchType);
		
		// 전체 데이터 수 구하기
		int totalCount = adminService.getTotalenrollmentCancelList(paging);
		paging.setTotalCount(totalCount);
		
		// 수강 신청 취소 리스트
		List<Map<String, Object>> list = adminService.getEnrollmentCancelList(paging);
		// 과목 리스트
		List<Subject> subjectList = adminService.getSubjectList();
		
		// 모델에 값 전달
		model.addAttribute("enrollmentCancelList", list);
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("page", paging);
		
		return "admin/enrollmentCancelList";
	}
	
	// 환불 내역 조회 (수강 신청의 status가 'REFUNDWAIT' or 'REFUND'인 데이터만 조회)
	@GetMapping("/admin/refundList")
	public String refundList(Model model
							,@RequestParam(defaultValue = "1") int page
							,@RequestParam(defaultValue = "10") int size
							,@RequestParam(defaultValue = "") String searchWord
							,@RequestParam(defaultValue = "all") String searchType) {
		// 페이징
		Page paging = new Page(size, page, 0, searchWord, searchType);
		
		// 전체 데이터 수 구하기
		int totalCount = adminService.getTotalrefundList(paging);
		paging.setTotalCount(totalCount);
		
		// 환불 리스트
		List<Map<String, Object>> list = adminService.getRefundList(paging);
		// 과목 리스트
		List<Subject> subjectList = adminService.getSubjectList();
		
		// 모델에 값 전달
		model.addAttribute("refundList", list);
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("page", paging);
		
		return "admin/refundList";
	}
	
	// 환불 처리 서비스 호출
	@PostMapping("/admin/changeRefund")
	public String changeRefund(@RequestParam int enrollmentId, RedirectAttributes redirectAttributes) {
		adminService.refundEnrollment(enrollmentId);
		redirectAttributes.addFlashAttribute("msg", "환불 처리가 완료되었습니다.");
		
		return "redirect:/admin/refundList";
	}
	
	// 수업 관리 페이지
	@GetMapping("/admin/lectureManagement")
	public String lectureManagement(Model model
									,@RequestParam(defaultValue = "1") int page
									,@RequestParam(defaultValue = "10") int size
									,@RequestParam(defaultValue = "") String searchWord
									,@RequestParam(defaultValue = "all") String searchType) {
		// 페이징
		Page paging = new Page(size, page, 0, searchWord, searchType);
		
		// 전체 데이터 수 구하기
		int totalCount = adminService.getTotalLectureList(paging);
		paging.setTotalCount(totalCount);
		
		// 수업 목록 조회
		List<Map<String, Object>> list = adminService.getLectureList(paging);
		// 과목 목록 조회
		List<Subject> subjectList = adminService.getSubjectList();
		
		// 모델에 값 전달
		model.addAttribute("lectureList", list);
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("page", paging);
		
		return "admin/lectureManagement";
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
		List<Map<String, Object>> teacherList = adminService.getTeacherList();
		model.addAttribute("teacherList", teacherList);
		
		// 등록된 배차 정보 조회 (이미 수업에 배정된 배차 정보는 제외)
		List<Map<String, Object>> vehicleAssignmentList = adminService.getVehicleAssignmentList(null);
		model.addAttribute("vehicleAssignmentList", vehicleAssignmentList);
		
		return "admin/createLecture";
	}
	
	// 수업 등록
	@PostMapping("/admin/createLecture")
	public String createLecture(Lecture lecture, TeacherAssignment teacherAssignment, @RequestParam(required = false) Integer assignmentId) {
		// 수업 등록 폼에서 전달된 데이터 확인용 출력
		log.info(lecture.toString());
		
		// 수업 등록
		int row = adminService.createLecture(lecture);
		
		if(row != 1) {
			log.info("insert error");
			return "redirect:/admin/lectureManagement";
		}
		
		// DB에서 생성된 PK값(lectureId) 확인용 출력
		log.info("생성된 lectureId: " + lecture.getLectureId());
		
		// 강사 배정 정보 준비
		teacherAssignment.setLectureId(lecture.getLectureId());
		
		// DB에 강사 배정 정보 등록
		int row2 = adminService.createTeacherAssignment(teacherAssignment);
		
		if(row2 != 1) {
			log.info("강사 배정 insert 실패");
			return "redirect:/admin/lectureManagement";
		}
		
		// 배차 정보가 있을 경우에만 연결
		if(assignmentId != null) {
			VehicleAssignment vehicleAssignment = new VehicleAssignment();
			vehicleAssignment.setLectureId(lecture.getLectureId());
			vehicleAssignment.setAssignmentId(assignmentId);
			
			// DB에 배차 배정 정보 등록
			int row3 = adminService.updateVehicleAssignmentByLectureId(vehicleAssignment);
			
			if(row3 != 1) {
				log.info("배차 배정 update 실패");
				return "redirect:/admin/lectureManagement";
			}
		}
		
		return "redirect:/admin/lectureManagement";
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
		List<Map<String, Object>> teacherList = adminService.getTeacherList();
		model.addAttribute("teacherList", teacherList);
		
		// 등록된 배차 정보 조회 (현재 수업에 배정된 배차 정보 포함 / 다른 수업에 배정된 배차 정보는 제외)
		List<Map<String, Object>> vehicleAssignmentList = adminService.getVehicleAssignmentList(lectureId);
		model.addAttribute("vehicleAssignmentList", vehicleAssignmentList);
		
		// 해당 lectureId를 가지는 lecture 데이터 조회
		Lecture lecture = adminService.getLectureById(lectureId);
		model.addAttribute("lecture", lecture);
		
		// 해당 lectureId를 가지는 teacherAssignment 데이터 조회
		TeacherAssignment teacherAssignment = adminService.getTeacherById(lecture.getLectureId());
		model.addAttribute("teacherId", teacherAssignment);
		
		// 해당 lectureId를 가지는 vehicleAssignment 데이터 조회
		VehicleAssignment vehicleAssignment = adminService.getVehicleAssignmentByLectureId(lecture.getLectureId());
		model.addAttribute("vehicleAssignment", vehicleAssignment);
		
		return "admin/modifyLecture";
	}
	
	// 수업 수정
	@PostMapping("/admin/modifyLecture")
	public String modifyLecture(Lecture lecture,
								@RequestParam String teacherId,
								@RequestParam(required = false) Integer assignmentId) {
		
		// 수업 정보 수정
		int row = adminService.modifyLecture(lecture);
		
		if(row != 1) {
			log.info("수업 정보 update error");
			return "redirect:/admin/lectureManagement";
		}
		
		// 강사 배정 정보 수정
		TeacherAssignment teacherAssignment = new TeacherAssignment();
		teacherAssignment.setLectureId(lecture.getLectureId());
		teacherAssignment.setTeacherId(teacherId);
		int row2 = adminService.modifyTeacherAssignment(teacherAssignment);
		
		if(row2 != 1) {
			log.info("강사 배정 정보 update error");
			return "redirect:/admin/lectureManagement";
		}
		
		// 기존 수업에 배정된 assignmentId 조회 및 연결 해제
		VehicleAssignment preVehicleAssignment = adminService.getVehicleAssignmentByLectureId(lecture.getLectureId());
		if(preVehicleAssignment != null) {
			if(adminService.updateVehicleAssignmentLectureIdNull(preVehicleAssignment.getAssignmentId()) != 1) {
				log.info("기존 배차 연결 해제 실패");
				return "redirect:/admin/lectureManagement";
			}
		}
		
		// 새로운 배차가 선택된 경우에만 연결
		if(assignmentId != null) {
			VehicleAssignment vehicleAssignment = new VehicleAssignment();
			vehicleAssignment.setLectureId(lecture.getLectureId());
			vehicleAssignment.setAssignmentId(assignmentId);
			if(adminService.updateVehicleAssignmentByLectureId(vehicleAssignment) != 1) {
				log.info("새 배차 연결 실패");
				return "redirect:/admin/lectureManagement";
			}
		}
		
		return "redirect:/admin/lectureManagement";
	}
	
	// 강의실 관리 페이지
	@GetMapping("/admin/classroomManagement")
	public String classroomManagement(Model model
									,@RequestParam(defaultValue = "1") int page
									,@RequestParam(defaultValue = "10") int size
									,@RequestParam(defaultValue = "") String searchWord
									,@RequestParam(defaultValue = "all") String searchType) {
		// 페이징
		Page paging = new Page(size, page, 0, searchWord, searchType);
		
		// 전체 데이터 수 구하기
		int totalCount = adminService.getTotalClassroomList(paging);
		paging.setTotalCount(totalCount);
		
		// 강의실 목록 조회
		List<Map<String, Object>> list = adminService.getClassroom(paging);
		// 과목 목록 조회
		List<Subject> subjectList = adminService.getSubjectList();
				
		// 모델에 값 전달
		model.addAttribute("classroomList", list);
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("page", paging);
		
		return "admin/classroomManagement";
	}
	
	// 강의실 등록 페이지
	@GetMapping("/admin/createClassroom")
	public String createClassroom() {
		return "admin/createClassroom";
	}
	
	// 강의실 등록
	@PostMapping("/admin/createClassroom")
	public String createClassroom(Classroom classroom) {
		int row = adminService.createClassroom(classroom);
		
		if(row != 1) {
			log.info("강의실 등록 insert error");
			return "redirect:/admin/classroomManagement";
		}
		return "redirect:/admin/classroomManagement";
	}
	
	// 강의실 수정 페이지
	@GetMapping("/admin/modifyClassroom")
	public String modifyClassroom(@RequestParam int classroomId, Model model) {
		// 해당 classroomId를 가지는 classroom 데이터 조회
		Classroom classroom = adminService.getClassroomById(classroomId);
		model.addAttribute("classroom", classroom);
		return "admin/modifyClassroom";
	}
	
	// 강의실 정보 수정
	@PostMapping("/admin/modifyClassroom")
	public String modifyClassroom(Classroom classroom) {
		int row = adminService.modifyClassroom(classroom);
		
		if(row != 1) {
			log.info("강의실 정보 update error");
			return "redirect:/admin/classroomManagement";
		}
		
		return "redirect:/admin/classroomManagement";
	}
	
	// 교보재 관리 페이지
	@GetMapping("/admin/materialManagement")
	public String materialManagement(Model model
									,@RequestParam(defaultValue = "1") int page
									,@RequestParam(defaultValue = "10") int size
									,@RequestParam(defaultValue = "") String searchWord
									,@RequestParam(defaultValue = "all") String searchType) {
		// 페이징
		Page paging = new Page(size, page, 0, searchWord, searchType);
		
		// 전체 데이터 수 구하기
		int totalCount = adminService.getTotalMaterialList(paging);
		paging.setTotalCount(totalCount);
		
		// 교보재 목록 조회
		List<Map<String, Object>> list = adminService.getMaterialList(paging);
		// 과목 목록 조회
		List<Subject> subjectList = adminService.getSubjectList();
		
		// 모델에 값 넘기기
		model.addAttribute("materialList", list);
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("page", paging);
		
		return "admin/materialManagement";
	}
	
	// 교보재 등록 페이지
	@GetMapping("/admin/createMaterial")
	public String createMaterial(Model model) {
		// 교보재 정보에 등록할 강좌 및 해당 과목 이름 조회
		List<Map<String, Object>> list = adminService.getLecture();
		model.addAttribute("list", list);
		return "admin/createMaterial";
	}
	
	// 교보재 등록
	@PostMapping("/admin/createMaterial")
	public String createMeterial(Material material) {
		int row = adminService.createMaterial(material);
		if(row != 1) {
			log.info("교보재 등록 실패");
			return "redirect:/admin/materialManagement";
		}
		return "redirect:/admin/materialManagement";
	}
	
	// 교보재 수정 페이지
	@GetMapping("/admin/modifyMaterial")
	public String modifyMaterial(@RequestParam int materialId, Model model) {
		// 해당 materialId 값을 가지는 material 정보 조회
		Material material = adminService.getMaterialById(materialId);
		model.addAttribute("material", material);
		
		// 교보재 정보에 등록할 강좌 및 해당 과목 이름 조회
		List<Map<String, Object>> list = adminService.getLecture();
		model.addAttribute("list", list);
		return "admin/modifyMaterial";
	}
	
	// 교보재 수정
	@PostMapping("/admin/modifyMaterial")
	public String modifyMaterial(Material material) {
		int row = adminService.modifyMaterial(material);
		
		if(row != 1) {
			log.info("교보재 수정 실패");
			return "redirect:/admin/materialManagement";
		}
		
		return "redirect:/admin/materialManagement";
	}
	
	// 교보재 삭제
	@PostMapping("/admin/removeMaterial")
	public String removeMaterial(@RequestParam int materialId) {
		int row = adminService.removeMaterial(materialId);
		
		if(row != 1) {
			log.info("교보재 삭제 실패");
			return "redirect:/admin/materialManagement";
		}
		
		return "redirect:/admin/materialManagement";
	}
	
	// 교보재 요청 관리 페이지
	@GetMapping("/admin/materialRequestManagement")
	public String materialRequestManagement(Model model
											,@RequestParam(defaultValue = "1") int page
											,@RequestParam(defaultValue = "10") int size
											,@RequestParam(defaultValue = "") String searchWord
											,@RequestParam(defaultValue = "all") String searchType) {
		// 페이징
		Page paging = new Page(size, page, 0, searchWord, searchType);
		
		// 전체 데이터 수 구하기
		int totalCount = adminService.getTotalMaterialRequestList(paging);
		paging.setTotalCount(totalCount);
		
		// 교보재 요청 목록 조회
		List<Map<String, Object>> list = adminService.getMaterialRequestList(paging);
		// 과목 목록 조회
		List<Subject> subjectList = adminService.getSubjectList();
		
		// 모델에 값 넘기기
		model.addAttribute("materialRequestList", list);
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("page", paging);
		
		return "admin/materialRequestManagement";
	}
	
	// 교보재 요청된 건 완료 처리 (status 값 변경 '요청완료' -> '처리완료')
	@PostMapping("/admin/changeMaterialRequestStatus")
	public String changeMaterialRequestStatus(@RequestParam int requestId) {
		int row = adminService.changeMaterialRequestStatus(requestId);
		
		if(row != 1) {
			log.info("교보재 요청 완료 처리 실패");
			return "redirect:/admin/materialRequestManagement";
		}
		
		return "redirect:/admin/materialRequestManagement";
	}
	
	// 출결 관리 페이지
	@GetMapping("/admin/attendanceManagement")
	public String attendanceManagement(Model model
										,@RequestParam(defaultValue = "1") int page
										,@RequestParam(defaultValue = "10") int size
										,@RequestParam(defaultValue = "") String searchWord
										,@RequestParam(defaultValue = "all") String searchType) {
		// 페이징
		Page paging = new Page(size, page, 0, searchWord, searchType);
		
		// 전체 데이터 수 구하기
		int totalCount = adminService.getTotalAttendanceList(paging);
		paging.setTotalCount(totalCount);
		
		// 출결 목록 조회
		List<Map<String, Object>> list = adminService.getAttendanceList(paging);
		// 과목 목록 조회
		List<Subject> subjectList = adminService.getSubjectList();
		
		// 모델에 값 넘기기
		model.addAttribute("attendanceList", list);
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("page", paging);
		
		return "admin/attendanceManagement";
	}
	
	// 출결 수정 페이지
	@GetMapping("/admin/modifyAttendance")
	public String modifyAttendance(@RequestParam int attendanceId, Model model) {
		// 해당 attendanceId를 가지는 attendance 데이터 값 조회
		Map<String, Object> attendance = adminService.getAttendanceById(attendanceId);
		model.addAttribute("attendance", attendance);
		return "admin/modifyAttendance";
	}
	
	// 출결 수정
	@PostMapping("/admin/changeAttendanceStatus")
	public String changeAttendanceStatus(Attendance attendance) {
		int row = adminService.changeAttendanceStatus(attendance);
		
		if(row != 1) {
			log.info("출결 상태 변경 실패");
			return "redirect:/admin/attendanceManagement";
		}
		
		return "redirect:/admin/attendanceManagement";
	}

	// 수업 만족도 평과 결과 및 리뷰 조회 페이지
	@GetMapping("/admin/lectureSatisfactionList")
	public String satisfactionList(Model model
								,@RequestParam(defaultValue = "1") int page
								,@RequestParam(defaultValue = "10") int size
								,@RequestParam(defaultValue = "") String searchWord
								,@RequestParam(defaultValue = "all") String searchType) {
		// 페이징
		Page paging = new Page(size, page, 0, searchWord, searchType);
		
		// 전체 데이터 수 구하기
		int totalCount = adminService.getTotalLectureSatisfactionList(paging);
		paging.setTotalCount(totalCount);
		
		// 수업 만족도 평가 및 리뷰 목록 조회
		List<Map<String, Object>> list = adminService.getLectureSatisfactionList(paging);
		// 수업 목록 조회
		List<Map<String, Object>> LectureList = adminService.getLectureListForSearch();
				
		// 모델에 값 넘기기
		model.addAttribute("LectureSatisfactionList", list);
		model.addAttribute("lectureList", LectureList);
		model.addAttribute("page", paging);
		
		return "admin/lectureSatisfactionList";
	}
	
	// AJAX 요청용 (수업 만족도 평과 및 리뷰 목록 테이블만 반환)
	@GetMapping("/admin/lectureSatisfactionTable")
	public String getLectureSatisfactionTable(Model model
								,@RequestParam(defaultValue = "1") int page
								,@RequestParam(defaultValue = "10") int size
								,@RequestParam(defaultValue = "") String searchWord
								,@RequestParam(defaultValue = "all") String searchType) {
		// 페이징
		Page paging = new Page(size, page, 0, searchWord, searchType);
		
		// 전체 데이터 수 구하기
		int totalCount = adminService.getTotalLectureSatisfactionList(paging);
		paging.setTotalCount(totalCount);
		
		// 수업 만족도 평가 및 리뷰 목록 조회
		List<Map<String, Object>> list = adminService.getLectureSatisfactionList(paging);
				
		// 모델에 값 넘기기
		model.addAttribute("LectureSatisfactionList", list);
		model.addAttribute("page", paging);
		
		return "admin/fragment/lectureSatisfactionTable";
	}
	
	// 강사 만족도 평가 조회 페이지
	@GetMapping("/admin/teacherSatisfactionList")
	public String teacherSatisfactionList(Model model
										,@RequestParam(defaultValue = "1") int page
										,@RequestParam(defaultValue = "10") int size
										,@RequestParam(defaultValue = "") String searchWord
										,@RequestParam(defaultValue = "all") String searchType) {
		// 페이징
		Page paging = new Page(size, page, 0, searchWord, searchType);
		
		// 전체 데이터 수 구하기
		int totalCount = adminService.getTotalTeacherSatisfactionList(paging);
		paging.setTotalCount(totalCount);
		
		// 강사 평가 목록 조회
		List<Map<String, Object>> list = adminService.getTeacherSatisfactionList(paging);
		// 과목 목록 조회
		List<Subject> subjectList = adminService.getSubjectList();
		
		// 모델에 값 넘기기
		model.addAttribute("TeacherSatisfactionList", list);
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("page", paging);
		
		return "admin/teacherSatisfactionList";
	}
	
	// AJAX 요청용 (강사 만족도 평과 목록 테이블만 반환)
	@GetMapping("/admin/teacherSatisfactionTable")
	public String getTeacherSatisfactionTable(Model model
			,@RequestParam(defaultValue = "1") int page
			,@RequestParam(defaultValue = "10") int size
			,@RequestParam(defaultValue = "") String searchWord
			,@RequestParam(defaultValue = "all") String searchType) {
		// 페이징
		Page paging = new Page(size, page, 0, searchWord, searchType);
		
		// 전체 데이터 수 구하기
		int totalCount = adminService.getTotalTeacherSatisfactionList(paging);
		paging.setTotalCount(totalCount);
		
		// 강사 평가 목록 조회
		List<Map<String, Object>> list = adminService.getTeacherSatisfactionList(paging);
		
		// 모델에 값 넘기기
		model.addAttribute("TeacherSatisfactionList", list);
		model.addAttribute("page", paging);
		
		return "admin/fragment/teacherSatisfactionTable";
	}
}
