package com.example.afterSchoolLms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.afterSchoolLms.dto.Classroom;
import com.example.afterSchoolLms.dto.Lecture;
import com.example.afterSchoolLms.dto.Material;
import com.example.afterSchoolLms.dto.Subject;
import com.example.afterSchoolLms.dto.TeacherAssignment;
import com.example.afterSchoolLms.dto.User;
import com.example.afterSchoolLms.mapper.AdminMapper;

@Service
public class AdminService {
	@Autowired AdminMapper adminMapper;
	
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
	public List<Map<String, Object>> getStudentEnrollmentList() {
		return adminMapper.selectStudentEnrollmentList();
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
		return adminMapper.selectLectureList();
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

	// 해당 lectureId를 가지는 lecture 데이터 조회
	public Lecture getLectureById(int lectureId) {
		return adminMapper.selectLectureById(lectureId);
	}

	// 해당 lectureId를 가지는 teacherAssignment 데이터 조회
	public TeacherAssignment getTeacherById(int lectureId) {
		return adminMapper.selectTeacherById(lectureId);
	}

	// 수업 정보 수정
	public int modifyLecture(Lecture lecture) {
		return adminMapper.modifyLecture(lecture);
	}

	// 해당 수업의 강사 배정 정보 수정
	public int modifyTeacherAssignment(TeacherAssignment teacherAssignment) {
		return adminMapper.modifyTeacherAssignment(teacherAssignment);
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


}
