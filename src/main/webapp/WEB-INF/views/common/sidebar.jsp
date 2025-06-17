<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
    }

    .sidebar {
      width: 240px;
      height: 100vh;
      background-color: #1f1f2e;
      color: #f1f1f1;
      padding: 20px;
    }

    .menu-title {
      font-size: 16px;
      font-weight: bold;
      margin-bottom: 20px;
    }

    .menu-group {
      margin-bottom: 10px;
    }

    .menu-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 10px;
      color: #f1f1f1;
      background-color: transparent;
      cursor: pointer;
      transition: background 0.2s;
    }

    .menu-header:hover {
      background-color: #2a2a3c;
    }

    .menu-header i {
      font-size: 14px;
    }

    .submenu {
      display: none;
      background-color: #2a2a3c;
    }

    .submenu a {
      display: block;
      padding: 8px 20px;
      font-size: 14px;
      color: #ccc;
      text-decoration: none;
      transition: all 0.2s;
    }

    .submenu a:hover {
      background-color: #3b3b55;
      color: #fff;
    }

    .menu-open > .submenu {
      display: block;
    }

    .submenu a.active {
      font-weight: bold;
      color: #fff;
    }
    
    .qna-badge {
	  background-color: #dc3545;
	  color: white;
	  font-size: 12px;
	  padding: 1px 6px;
	  border-radius: 12px;
	  margin-left: 6px;
	}
  </style>

  <script>
    $(function () {
      $('.menu-header').click(function () {
        $(this).parent('.menu-group').toggleClass('menu-open');
        $(this).find('i.bi').toggleClass('bi-chevron-down bi-chevron-up');
      });

      // 처음엔 모두 접힌 상태 (이 줄 없어도 기본이 접힘)
      $('.menu-group').removeClass('menu-open');
      $('.menu-header i.bi').removeClass('bi-chevron-up').addClass('bi-chevron-down');
    });
  </script>
</head>

<body>
  <nav class="sidebar">
    <div class="menu-title">관리자 메뉴</div>

    <div class="menu-group">
      <div class="menu-header">
        <span>사용자 관리</span>
        <i class="bi bi-chevron-down"></i>
      </div>
      <div class="submenu">
        <a href="/admin/userManagement">회원 관리</a>
        <a href="/admin/satisfactionList">만족도 평가</a>
      </div>
    </div>

    <div class="menu-group">
      <div class="menu-header">
        <span>수업 관리</span>
        <i class="bi bi-chevron-down"></i>
      </div>
      <div class="submenu">
        <a href="/admin/subjectManagement">과목 관리</a>
        <a href="/admin/lectureManagement">수업 관리</a>
        <a href="/admin/albumManagement">수업 사진첩</a>
        <a href="/admin/classroomManagement">강의실 관리</a>
      </div>
    </div>

    <div class="menu-group">
      <div class="menu-header">
        <span>수강 관리</span>
        <i class="bi bi-chevron-down"></i>
      </div>
      <div class="submenu">
        <a href="/admin/studentEnrollmentList">수강 신청 현황</a>
        <a href="/admin/paymentList">수강료 납부 내역</a>
        <a href="/admin/enrollmentCancelList">수강 취소 내역</a>
        <a href="/admin/refundList">환불 관리</a>
      </div>
    </div>

    <div class="menu-group">
      <div class="menu-header">
        <span>교통 관리</span>
        <i class="bi bi-chevron-down"></i>
      </div>
      <div class="submenu">
        <a href="/admin/vehicleManagement">차량 관리</a>
        <a href="/admin/studentDispatchManagement">학생 배차 조회</a>
        <a href="/admin/vehicleCancel">배차 취소 조회</a>
      </div>
    </div>

    <div class="menu-group">
      <div class="menu-header">
        <span>기타</span>
        <i class="bi bi-chevron-down"></i>
      </div>
      <div class="submenu">
        <a href="/admin/noticeManagement">공지사항 관리</a>
        <a href="/admin/qnaManagement">Q&A<c:if test="${qnaCount > 0}"><span class="qna-badge">${qnaCount}</span></c:if></a>
      </div>
    </div>
  </nav>
</body>
</html>
