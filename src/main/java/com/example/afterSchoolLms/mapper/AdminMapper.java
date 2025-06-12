package com.example.afterSchoolLms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.afterSchoolLms.dto.Classroom;
import com.example.afterSchoolLms.dto.Lecture;
import com.example.afterSchoolLms.dto.Material;
import com.example.afterSchoolLms.dto.Subject;
import com.example.afterSchoolLms.dto.TeacherAssignment;
import com.example.afterSchoolLms.dto.User;

@Mapper
public interface AdminMapper {
	// 과목 조회
	List<Subject> selectSubjectList();
	
	// 과목 추가
	int createSubject(Subject subject);
	
	// 과목 수정 페이지에 표기할 데이터 값을 subjectId를 통해 조회
	Subject selectSubjectById(int subjectId);
	
	// 해당 과목의 데이터 수정
	int modifySubject(Subject subject);

	// 과목 삭제
	int removeSubject(int subjectId);

	// 수강 신청 내역 조회
	List<Map<String, Object>> selectStudentEnrollmentList();

	// 수강료 납부 내역 조회
	List<Map<String, Object>> selectPaymentList();

	// 수강 신청 취소 내역 조회
	List<Map<String, Object>> selectEnrollmentCancelList();

	// 환불 내역 조회 (수강 신청의 status가 'REFUNDWAIT' or 'REFUND'인 데이터만 조회)
	List<Map<String, Object>> selectRefundList();

	// 환불 대기중(수강 신청의 status가 'REFUNDWAIT')인 수강 신청 건 환불 처리
	int changeRefund(int enrollmentId);

	// 환불 처리 후 payment 테이블의 결제 데이터 삭제
	int removePayment(int enrollmentId);

	// 수업 리스트 조회
	List<Map<String, Object>> selectLectureList();
	
	// 수업 등록
	int createLecture(Lecture lecture);

	// 강의실 리스트 조회
	List<Classroom> selectClassroomList();

	// 강사 리스트 조회
	List<User> selectTeacherList();

	// 해당 수업의 강사 배정
	int createTeacherAssignment(TeacherAssignment teacherAssignment);

	// 해당 lectureId를 가지는 lecture 데이터 조회
	Lecture selectLectureById(int lectureId);

	// 해당 lectureId를 가지는 teacherAssignment 데이터 조회
	TeacherAssignment selectTeacherById(int lectureId);

	// 수업 정보 수정
	int modifyLecture(Lecture lecture);

	// 해당 수업의 강사 배정 정보 수정
	int modifyTeacherAssignment(TeacherAssignment teacherAssignment);

	// 강의실 관리 페이지에서 강의실 목록 조회
	List<Map<String, Object>> selectClassroom();

	// 강의실 등록
	int createClassroom(Classroom classroom);
	
	// 해당 classroomId를 가지는 classroom 데이터 조회
	Classroom selectClassroomById(int classroomId);

	// 강의실 정보 수정
	int modifyClassroom(Classroom classroom);

	// 교보재 목록 조회
	List<Map<String, Object>> selectMaterialList();

	// 교보재 정보에 등록할 강좌 및 해당 과목 이름 조회
	List<Map<String, Object>> selectLecture();

	// 교보재 등록
	int createMaterial(Material material);

	// 해당 materialId 값을 가지는 material 정보 조회
	Material selectMaterialById(int materialId);

	// 교보재 수정
	int modifyMaterial(Material material);

	// 교보재 삭제
	int removeMaterial(int materialId);


}
