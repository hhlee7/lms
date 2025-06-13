package com.example.afterSchoolLms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.afterSchoolLms.dto.Notice;
import com.example.afterSchoolLms.dto.Page;
import com.example.afterSchoolLms.dto.Role;
import com.example.afterSchoolLms.dto.StudentParent;
import com.example.afterSchoolLms.dto.TeacherHistory;
import com.example.afterSchoolLms.dto.User;
import com.example.afterSchoolLms.dto.Vehicle;
import com.example.afterSchoolLms.dto.VehicleAssignment;
import com.example.afterSchoolLms.mapper.AdminMapper;

@Service
public class AdminService {
	@Autowired AdminMapper adminMapper;
	
	// ------ SELECT ------
	/** 리스트 전체 카운트 가져오기 **/
	public int getTotalCount(Page page) {
		return adminMapper.getTotalCount(page);
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
}
