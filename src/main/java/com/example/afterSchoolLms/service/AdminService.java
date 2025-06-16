package com.example.afterSchoolLms.service;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.afterSchoolLms.dto.Album;
import com.example.afterSchoolLms.dto.AlbumPhoto;
import com.example.afterSchoolLms.dto.Notice;
import com.example.afterSchoolLms.dto.Page;
import com.example.afterSchoolLms.dto.Qna;
import com.example.afterSchoolLms.dto.Role;
import com.example.afterSchoolLms.dto.StudentParent;
import com.example.afterSchoolLms.dto.TeacherHistory;
import com.example.afterSchoolLms.dto.User;
import com.example.afterSchoolLms.dto.Vehicle;
import com.example.afterSchoolLms.dto.VehicleAssignment;


import com.example.afterSchoolLms.dto.Attendance;
import com.example.afterSchoolLms.dto.Classroom;
import com.example.afterSchoolLms.dto.Lecture;
import com.example.afterSchoolLms.dto.Material;
import com.example.afterSchoolLms.dto.Subject;
import com.example.afterSchoolLms.dto.TeacherAssignment;
import com.example.afterSchoolLms.mapper.AdminMapper;

@Service
public class AdminService {
	@Autowired AdminMapper adminMapper;
	
	// ------ SELECT ------
	/** 리스트 전체 카운트 가져오기 **/
	public int getTotalCount(Page page) {
		return adminMapper.getTotalCount(page);
	}
	
	/** Q&A 리스트 조회 **/
	public List<Qna> selectQnaList() {
		return adminMapper.selectQnaList();
	}
	
	/** Q&A 상세 조회 **/
	public Qna selectQnaOne(int qnaId) {
		return adminMapper.selectQnaOne(qnaId);
	}
	
	/** 앨범 전체 리스트 조회 **/
	public List<Map<String,Object>> selectAlbumList(Page page){
		return adminMapper.selectAlbumList(page);
	}
	
	/** 앨범 상세 조회 **/
	public Map<String,Object> selectAlbumOne(int albumId){
		return adminMapper.selectAlbumOne(albumId);
	}
	
	/** 앨범 사진 조회 **/
	public List<AlbumPhoto> selectAlbumPhotoList(int albumId){
		return adminMapper.selectAlbumPhotoList(albumId);
	}
	
	/** 공지사항 전체 카운트 가져오기 **/
	public int noticeTotalCount(Page page) {
		return adminMapper.noticeTotalCount(page);
	}
	
	/** 관리자가 유저 리스트를 가져옴 **/
	public List<User> selectUserList(Page page){
		return adminMapper.selectUserList(page);
	}
	
	/** 유저 한명을 아이디로 조회합니다 **/
	public Map<String,Object> selectUserByUserId(String userId) {
		return adminMapper.selectUserByUserId(userId);
	}
	
	/** 이메일 중복 검사를 위한 조회 **/
	public boolean isUserEmailExists(String email) {
	    User user = adminMapper.selectUserEmail(email);
	    return user != null;  // 있으면 true (중복 존재), 없으면 false
	}

	/** 공지사항 조회 **/
	public List<Map<String,Object>> selectNoticeList(Page page){
		return adminMapper.selectNoticeList(page);
	}
	
	/** 공지사항 상세 조회 **/
	public Map<String,Object> selectNoticeOne(int noticeId){
		return adminMapper.selectNoticeOne(noticeId);
	}
	
	/** 공지사항 수정 **/
	public int modifyNotice(Notice notice) {
		return adminMapper.modifyNotice(notice);
	}
	
	/** 역할 리스트를 가져옴 **/
	public List<Role> selectRoleList(){
		return adminMapper.selectRoleList();
	}
	
	/** 수업 리스트를 가져옴 **/
	public List<Map<String,Object>> selectLectureList(){
		return adminMapper.selectLectureList();
	}
	
	/** 운전기사 리스트를 가져옴 **/
	public List<User> selectDriverList(){
		return adminMapper.selectDrvierlist();
	}
	
	/** 부모 아이디로 자식 조회 **/
	public List<Map<String,Object>> selectUserByParentId(String parentId) {
		return adminMapper.selectUserByParentId(parentId);
	}
	
	/** 자식 아이디로 부모 조회 **/
	public List<Map<String,Object>> selectUserByStudentId(String studentId) {
		return adminMapper.selectUserByStudentId(studentId);
	}
	
	/** 강사 아이디로 경력 조회 **/
	public TeacherHistory selectTeacherHistoryListByTeacherId(String teacherId){
		return adminMapper.selectTeacherHistoryListByTeacherId(teacherId);
	}
	
	/** 기사 아이디로 차량 조회 **/
	public List<Map<String,Object>> selectVehicleByDriverId(String driverId){
		return adminMapper.selectVehicleByDriverId(driverId);
	}
	
	/** 차량 아이디로 배정 조회 **/
	public VehicleAssignment selectVehicleAssignmentByVehicleId(int vehicleId) {
		return adminMapper.selectVehicleAssignmentByVehicleId(vehicleId);
	}
	
	/** 차량 리스트 조회 **/
	public List<Map<String,Object>> selectVehicleList(){
		return adminMapper.selectVehicleList();
	}
	
	/** 차량 아이디로 차량 조회 **/
	public Vehicle selectVehicleByVehicleId(int vehicleId) {
		return adminMapper.selectVehicleByVehicleId(vehicleId);
	}
	
	// ------ UPDATE ------
	
	/** 회원 정보 수정 **/
	public int modifyUser(User user) {
		return adminMapper.modifyUser(user);
	}
	
	/** 강사 경력 수정 **/
	public int modifyHistory(TeacherHistory th) {
		return adminMapper.modifyHistory(th);
	}
	
	/** 차량 정보 수정 **/
	public int modifyVehicle(Vehicle vc) {
		return adminMapper.modifyVehicle(vc);
	}
	
	/** 차량 배정 정보 수정 **/
	public int modifyVehicleAssignment(VehicleAssignment va) {
		return adminMapper.modifyVehicleAssignment(va);
	}
	
	/** Q&A 관리자 답하기 **/
	public int modifyQna(Qna qna) {
		return adminMapper.modifyQna(qna);
	}
	
	// ------ DELETE ------
	
	// ------ INSERT ------
	
	/** 회원 등록 **/
	public int insertUser(User user) {
		return adminMapper.insertUser(user);
	}
	
	/** 학부모 자녀 등록 **/
	public int insertStudentParent(StudentParent studentParent) {
		return adminMapper.insertStudentParent(studentParent);
	}
	
	/** 강사 경력 등록 **/
	public int insertHistory(TeacherHistory th) {
		return adminMapper.insertHistory(th);
	}
	
	/** 차량 등록 **/
	public int insertVehicle(Vehicle vc) {
		return adminMapper.insertVehicle(vc);
	}
	
	/** 차량 배정 등록 **/
	public int insertVehicleAssignment(VehicleAssignment va) {
		return adminMapper.insertVehicleAssignment(va);
	}
	
	/** 공지사항 등록 **/
	public int insertNotice(Notice notice) {
		return adminMapper.insertNotice(notice);
	}
	
	// ------ 파일 등록 ------
	public void insertAlbum(Album album, List<MultipartFile> photoFiles) {
	    // 1. 앨범 등록
	    int result = adminMapper.insertAlbum(album); // 이 시점에 album.getAlbumId()가 세팅돼야 함 (useGeneratedKeys=true)
	    if (result != 1) {
	        throw new RuntimeException("앨범 등록 실패");
	    }

	    // 2. 사진 등록
	    if (photoFiles != null && !photoFiles.isEmpty()) {
	        for (MultipartFile file : photoFiles) {
	            if (file.isEmpty()) continue;

	            // 파일명 생성
	            String uuidName = UUID.randomUUID().toString().replace("-", "");
	            String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
	            String fullName = uuidName + ext;

	            // DB 저장용 DTO
	            AlbumPhoto photo = new AlbumPhoto();
	            photo.setAlbumId(album.getAlbumId());
	            photo.setFilePath(fullName);

	            int insertRow = adminMapper.insertAlbumPhoto(photo);
	            if (insertRow != 1) {
	                throw new RuntimeException("앨범 사진 DB 저장 실패");
	            }

	            // 파일 실제 저장
	            File targetFile = new File("c:/project/albumUpload/" + fullName);
	            try {
	                file.transferTo(targetFile);
	            } catch (Exception e) {
	                throw new RuntimeException("앨범 사진 파일 저장 실패", e);
	            }
	        }
	    }
	}
	
	// 과목 조회
	public List<Subject> getSubjectList() {
		return adminMapper.selectSubjectList();
	}
	
	// 과목 추가
	public int createSubject(Subject subject) {
		return adminMapper.createSubject(subject);
	}
	
	// 과목 수정 페이지에 표기할 데이터 값을 subjectId를 통해 조회
	public Subject getSubjectById(int subjectId) {
		return adminMapper.selectSubjectById(subjectId);
	}

	// 해당 과목의 데이터 수정
	public int modifySubject(Subject subject) {
		return adminMapper.modifySubject(subject);
	}
	
	// 과목 삭제
	public int removeSubject(int subjectId) {
		return adminMapper.removeSubject(subjectId);
	}
	
	// 수강 신청 내역 조회
	public List<Map<String, Object>> getStudentEnrollmentList(Page page) {
		return adminMapper.selectStudentEnrollmentList(page);
	}
	
	// 수강 신청 리스트 전체 카운트 가져오기
	public int getTotalStudentEnrollmentCount(Page page) {
		return adminMapper.getTotalStudentEnrollmentList(page);
	}

	// 수강료 납부 내역 조회
	public List<Map<String, Object>> getPaymentList() {
		return adminMapper.selectPaymentList();
	}

	// 수강 신청 취소 내역 조회
	public List<Map<String, Object>> getEnrollmentCancelList() {
		return adminMapper.selectEnrollmentCancelList();
	}

	// 환불 내역 조회 (수강 신청의 status가 'REFUNDWAIT' or 'REFUND'인 데이터만 조회)
	public List<Map<String, Object>> getRefundList() {
		return adminMapper.selectRefundList();
	}

	// 환불 대기중(수강 신청의 status가 'REFUNDWAIT')인 수강 신청 건 환불 처리
	public int changeRefund(int enrollmentId) {
		return adminMapper.changeRefund(enrollmentId);
	}

	// 환불 처리 후 payment 테이블의 결제 데이터 삭제
	public int removePayment(int enrollmentId) {
		return adminMapper.removePayment(enrollmentId);
	}

	// 수업 리스트 조회
	public List<Map<String, Object>> getLectureList() {
		return adminMapper.selectAllLectureList();
	}

	// 수업 등록
	public int createLecture(Lecture lecture) {
		return adminMapper.createLecture(lecture);
	}
	
	// 강의실 리스트 조회
	public List<Classroom> getClassroomList() {
		return adminMapper.selectClassroomList();
	}

	// 강사 리스트 조회
	public List<User> getTeacherList() {
		return adminMapper.selectTeacherList();
	}

	// 해당 수업의 강사 배정
	public int createTeacherAssignment(TeacherAssignment teacherAssignment) {
		return adminMapper.createTeacherAssignment(teacherAssignment);
	}
	
	// 등록된 배차 정보 조회
	public List<Map<String, Object>> getVehicleAssignmentList() {
		return adminMapper.selectVehicleAssignmentList();
	}
	
	// 해당 수업의 배차 배정
	public int updateVehicleAssignmentByLectureId(VehicleAssignment vehicleAssignment) {
		return adminMapper.updateVehicleAssignmentByLectureId(vehicleAssignment);
	}

	// 해당 lectureId를 가지는 lecture 데이터 조회
	public Lecture getLectureById(int lectureId) {
		return adminMapper.selectLectureById(lectureId);
	}

	// 해당 lectureId를 가지는 teacherAssignment 데이터 조회
	public TeacherAssignment getTeacherById(int lectureId) {
		return adminMapper.selectTeacherById(lectureId);
	}
	
	// 해당 lectureId를 가지는 vehicleAssignment 데이터 조회
	public VehicleAssignment getVehicleAssignmentByLectureId(int lectureId) {
		return adminMapper.selectVehicleAssignmentByLectureId(lectureId);
	}

	// 수업 정보 수정
	public int modifyLecture(Lecture lecture) {
		return adminMapper.modifyLecture(lecture);
	}

	// 해당 수업의 강사 배정 정보 수정
	public int modifyTeacherAssignment(TeacherAssignment teacherAssignment) {
		return adminMapper.modifyTeacherAssignment(teacherAssignment);
	}

	// 배차 배정 정보 수정 (기존 lectureId null로 변경)
	public int updateVehicleAssignmentLectureIdNull(int assignmentId) {
		return adminMapper.updateVehicleAssignmentLectureIdNull(assignmentId);
	}

	// 강의실 관리 페이지에서 강의실 목록 조회
	public List<Map<String, Object>> getClassroom() {
		return adminMapper.selectClassroom();
	}

	// 강의실 등록
	public int createClassroom(Classroom classroom) {
		return adminMapper.createClassroom(classroom);
	}
	
	// 해당 classroomId를 가지는 classroom 데이터 조회
	public Classroom getClassroomById(int classroomId) {
		return adminMapper.selectClassroomById(classroomId);
	}

	// 강의실 정보 수정
	public int modifyClassroom(Classroom classroom) {
		return adminMapper.modifyClassroom(classroom);
	}

	// 교보재 목록 조회
	public List<Map<String, Object>> getMaterialList() {
		return adminMapper.selectMaterialList();
	}

	// 교보재 정보에 등록할 강좌 및 해당 과목 이름 조회
	public List<Map<String, Object>> getLecture() {
		return adminMapper.selectLecture();
	}

	// 교보재 등록
	public int createMaterial(Material material) {
		return adminMapper.createMaterial(material);
	}

	// 해당 materialId 값을 가지는 material 정보 조회
	public Material getMaterialById(int materialId) {
		return adminMapper.selectMaterialById(materialId);
	}

	// 교보재 수정
	public int modifyMaterial(Material material) {
		return adminMapper.modifyMaterial(material);
	}

	// 교보재 삭제
	public int removeMaterial(int materialId) {
		return adminMapper.removeMaterial(materialId);
	}

	// 교보재 요청 목록 조회
	public List<Map<String, Object>> getMaterialRequestList() {
		return adminMapper.selectMaterialRequestList();
	}

	// 교보재 요청된 건 완료 처리 (status 값 변경 '요청완료' -> '처리완료')
	public int changeMaterialRequestStatus(int requestId) {
		return adminMapper.changeMaterialRequestStatus(requestId);
	}

	// 출결 목록 조회
	public List<Map<String, Object>> getAttendanceList() {
		return adminMapper.selectAttendanceList();
	}

	// 해당 attendanceId를 가지는 attendance 데이터 값 조회
	public Map<String, Object> getAttendanceById(int attendanceId) {
		return adminMapper.selectAttendanceById(attendanceId);
	}

	// 출결 수정
	public int changeAttendanceStatus(Attendance attendance) {
		return adminMapper.changeAttendanceStatus(attendance);
	}

	// 강좌 평가 및 리뷰 목록 조회
	public List<Map<String, Object>> getLectureSatisfactionList() {
		return adminMapper.selectSatisfactionList();
	}

	// 강사 평가 목록 조회
	public List<Map<String, Object>> getTeacherSatisfactionList() {
		return adminMapper.selectTeacherSatisfactionList();
	}

}
