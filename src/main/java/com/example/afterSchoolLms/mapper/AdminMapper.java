package com.example.afterSchoolLms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.afterSchoolLms.dto.Subject;

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
}
