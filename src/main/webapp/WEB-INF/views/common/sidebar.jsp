<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<!-- /WEB-INF/views/common/sidebar.jsp -->
<nav class="sidebar">
  <h5 class="fw-bold mb-3">관리자 메뉴</h5>
  <div class="mb-3">${loginUser.userName} 님 반갑습니다!</div>
  <ul class="nav flex-column small">
    <li class="fw-bold text-secondary">사용자 관리</li>
    <li><a href="/admin/userManagement" class="nav-link">회원 관리</a></li>
    <li><a href="/admin/satisfactionList" class="nav-link">만족도 평가</a></li>
    
    <li class="fw-bold text-secondary mt-3">수업 관리</li>
    <li><a href="/admin/subjectManagement" class="nav-link">과목 관리</a></li>
    <li><a href="/admin/lectureManagement" class="nav-link">수업 관리</a></li>
    <li><a href="/admin/albumManagement" class="nav-link">수업 사진첩</a></li>
    <li><a href="/admin/classroomManagement" class="nav-link">강의실 관리</a></li>
    
    <li class="fw-bold text-secondary mt-3">수강 관리</li>
    <li><a href="/admin/studentEnrollmentList" class="nav-link">수강 신청 현황</a></li>
    <li><a href="/admin/paymentList" class="nav-link">수강료 납부 내역</a></li>
    <li><a href="/admin/enrollmentCancelList" class="nav-link">수강 취소 내역</a></li>
    <li><a href="/admin/refundList" class="nav-link">환불 관리</a></li>
    
    <li class="fw-bold text-secondary mt-3">교통 관리</li>
    <li><a href="/admin/vehicleManagement" class="nav-link">차량 관리</a></li>
    <li><a href="/admin/studentDispatchManagement" class="nav-link">학생 배차 조회</a></li>
    <li><a href="/admin/vehicleCancel" class="nav-link">배차 취소 조회</a></li>
    
    <li class="fw-bold text-secondary mt-3">기타</li>
    <li><a href="/admin/noticeManagement" class="nav-link">공지사항 관리</a></li>
    <li><a href="/admin/qnaManagement" class="nav-link">Q&A</a></li>
  </ul>
</nav>
</body>
</html>