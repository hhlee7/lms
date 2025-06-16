package com.example.afterSchoolLms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.afterSchoolLms.dto.Attendance;
import com.example.afterSchoolLms.dto.Classroom;
import com.example.afterSchoolLms.dto.Lecture;
import com.example.afterSchoolLms.dto.Material;
import com.example.afterSchoolLms.dto.Subject;
import com.example.afterSchoolLms.dto.TeacherAssignment;
import com.example.afterSchoolLms.dto.User;

import com.example.afterSchoolLms.dto.Album;
import com.example.afterSchoolLms.dto.AlbumPhoto;
import com.example.afterSchoolLms.dto.Notice;
import com.example.afterSchoolLms.dto.Page;
import com.example.afterSchoolLms.dto.Qna;
import com.example.afterSchoolLms.dto.Role;
import com.example.afterSchoolLms.dto.StudentParent;
import com.example.afterSchoolLms.dto.TeacherHistory;
import com.example.afterSchoolLms.dto.Vehicle;
import com.example.afterSchoolLms.dto.VehicleAssignment;

@Mapper
public interface AdminMapper {
	
	// SELECT
	List<User> selectUserList(Page page);	// 전체 회원 조회
	int getTotalCount(Page page);			// 전체 회원 데이터 수 조회
	List<Role> selectRoleList();			// 역할 리스트 조회
	Map<String,Object> selectUserByUserId(String userId);				// 회원 아이디로 유저 한 명 조회
	
	TeacherHistory selectTeacherHistoryListByTeacherId(String teacherId);	// 강사 아이디로 경력 조회
	
	List<Map<String,Object>> selectNoticeList(Page page);	// 공지사항 검색 조회
	Map<String,Object> selectNoticeOne(int noticeId);		// 공지사항 상세 조회
	int noticeTotalCount(Page page);						// 전체 공지사항 데이터 수 조회
	
	List<Map<String,Object>> selectVehicleList();			// 차량 조회
	List<Map<String,Object>> selectLectureList();			// 수업 조회
	List<User> selectDrvierlist();							// 운전기사 리스트 조회
	
	List<Map<String,Object>> selectAlbumList(Page page);	// 앨범 검색 조회
	List<AlbumPhoto> selectAlbumPhotoList(int albumId);		// 앨범 사진들 조회
	Map<String,Object> selectAlbumOne(int albumId);			// 앨범 상세 조회
	
	List<Qna> selectQnaList();								// Qna 리스트 조회
	Qna selectQnaOne(int qnaId);							// Qna 상세 조회
	
	List<Map<String,Object>> selectUserByParentId(String parentId);				// 부모 아이디로 자식 조회
	List<Map<String,Object>> selectUserByStudentId(String studentId);			// 자식 아이디로 부모 조회
	List<Map<String,Object>> selectVehicleByDriverId(String driverId);			// 기사 아이디로 차량 조회
	
	Vehicle selectVehicleByVehicleId(int vehicleId);							// 차량 아이디로 차량 조회
	VehicleAssignment selectVehicleAssignmentByVehicleId(int vehicleId);		// 차량 아이디로 배정 조회
	
	User selectUserEmail(String email);											// 유저 이메일 중복 검사를 위해 조회
	
	// UPDATE
	int modifyUser(User user);											// 회원 데이터 수정
	int modifyHistory(TeacherHistory teacherHistory);					// 강사 경력 수정
	int modifyVehicle(Vehicle vehicle);									// 차량 정보 수정
	int modifyVehicleAssignment(VehicleAssignment vehicleAssignment);	// 차량 배정 정보 수정
	int modifyNotice(Notice notice);									// 공지사항 수정
	int modifyQna(Qna qna);												// 관리자가 Q&A에 답 합니다.
	
	// INSERT
	int insertNotice(Notice notice);						// 공지사항 등록
	int insertHistory(TeacherHistory teacherHistory);		// 강사 경력 등록
	int insertUser(User user);								// 회원 등록
	int insertStudentParent(StudentParent studentParet);	// 학부모,자녀 관계 등록
	int insertVehicle(Vehicle vehicle);						// 차량 등록
	int insertVehicleAssignment(VehicleAssignment vehicleAssignment);	// 차량 배정 등록

	int insertAlbum(Album album);							// 앨범 등록
	int insertAlbumPhoto(AlbumPhoto albumPhoto);			// 앨범 사진 등록

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
	List<Map<String, Object>> selectStudentEnrollmentList(Page page);
	
	// 수강 신청 전체 데이터 수 조회
	int getTotalStudentEnrollmentList(Page page);

	// 수강료 납부 내역 조회
	List<Map<String, Object>> selectPaymentList(Page page);
	
	// 수강료 납부 내역 전체 카운트 가져오기
	int getTotalPaymentListCount(Page page);

	// 수강 신청 취소 내역 조회
	List<Map<String, Object>> selectEnrollmentCancelList(Page page);
	
	// 수강 신청 취소 내역 전체 카운트 가져오기
	int getTotalenrollmentCancelList(Page page);

	// 환불 내역 조회 (수강 신청의 status가 'REFUNDWAIT' or 'REFUND'인 데이터만 조회)
	List<Map<String, Object>> selectRefundList(Page page);
	
	// 환불 내역 전체 카운트 가져오기
	int getTotalRefundList(Page page);

	// 환불 대기중(수강 신청의 status가 'REFUNDWAIT')인 수강 신청 건 환불 처리
	int changeRefund(int enrollmentId);

	// 환불 처리 후 payment 테이블의 결제 데이터 삭제
	int removePayment(int enrollmentId);

	// 수업 목록 조회(전체 수업 조회 (종강 수업 포함))
	List<Map<String, Object>> selectAllLectureList(Page page);
	
	// 수업 목록 전체 카운트 가져오기
	int getTotalLectureList(Page page);
	
	// 수업 등록
	int createLecture(Lecture lecture);

	// 강의실 리스트 조회
	List<Classroom> selectClassroomList();

	// 강사 리스트 조회
	List<User> selectTeacherList();

	// 해당 수업의 강사 배정
	int createTeacherAssignment(TeacherAssignment teacherAssignment);
	
	// 등록된 배차 정보 조회
	List<Map<String, Object>> selectVehicleAssignmentList(Integer lectureId);

	// 해당 수업의 배차 배정
	int updateVehicleAssignmentByLectureId(VehicleAssignment vehicleAssignment);

	// 해당 lectureId를 가지는 lecture 데이터 조회
	Lecture selectLectureById(int lectureId);

	// 해당 lectureId를 가지는 teacherAssignment 데이터 조회
	TeacherAssignment selectTeacherById(int lectureId);
	
	// 해당 lectureId를 가지는 vehicleAssignment 데이터 조회
	VehicleAssignment selectVehicleAssignmentByLectureId(int lectureId);

	// 수업 정보 수정
	int modifyLecture(Lecture lecture);

	// 해당 수업의 강사 배정 정보 수정
	int modifyTeacherAssignment(TeacherAssignment teacherAssignment);
	
	// 배차 배정 정보 수정 (기존 lectureId null로 변경)
	int updateVehicleAssignmentLectureIdNull(int assignmentId);
	
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

	// 교보재 요청 목록 조회
	List<Map<String, Object>> selectMaterialRequestList();

	// 교보재 요청된 건 완료 처리 (status 값 변경 '요청완료' -> '처리완료')
	int changeMaterialRequestStatus(int requestId);

	// 출결 목록 조회
	List<Map<String, Object>> selectAttendanceList();

	// 해당 attendanceId를 가지는 attendance 데이터 값 조회
	Map<String, Object> selectAttendanceById(int attendanceId);

	// 출결 수정
	int changeAttendanceStatus(Attendance attendance);

	// 강좌 평가 및 리뷰 목록 조회
	List<Map<String, Object>> selectSatisfactionList();

	// 강사 평가 목록 조회
	List<Map<String, Object>> selectTeacherSatisfactionList();

}
