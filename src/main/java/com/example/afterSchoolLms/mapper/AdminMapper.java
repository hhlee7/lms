package com.example.afterSchoolLms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.afterSchoolLms.dto.Page;
import com.example.afterSchoolLms.dto.Role;
import com.example.afterSchoolLms.dto.StudentParent;
import com.example.afterSchoolLms.dto.TeacherHistory;
import com.example.afterSchoolLms.dto.User;

@Mapper
public interface AdminMapper {
	
	// SELECT
	List<User> selectUserList(Page page);	// 전체 회원 조회
	int getTotalCount(Page page);			// 전체 데이터 수 조회
	List<Role> selectRoleList();			// 역할 리스트 조회
	Map<String,Object> selectUserByUserId(String userId);				// 회원 아이디로 유저 한 명 조회
	
	TeacherHistory selectTeacherHistoryListByTeacherId(String teacherId);	// 강사 아이디로 경력 조회
	
	List<Map<String,Object>> selectUserByParentId(String parentId);				// 부모 아이디로 자식 조회
	List<Map<String,Object>> selectUserByStudentId(String studentId);			// 자식 아이디로 부모 조회
	List<Map<String,Object>> selectVehicleByDriverId(String driverId);			// 기사 아이디로 차량 조회
	
	// UPDATE
	int modifyUser(User user);				// 회원 데이터 수정
	int modifyHistory(TeacherHistory teacherHistory);	// 강사 경력 수정
	
	// INSERT
	int insertHistory(TeacherHistory teacherHistory);	// 강사 경력 등록
	int insertUser(User user);				// 회원 등록
	int insertStudentParent(StudentParent studentParet);	// 학부모,자녀 관계 등록
}
