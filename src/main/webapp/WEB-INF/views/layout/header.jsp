<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
  .main-header {
    position: fixed;
    top: 0;
    width: 100%;
    background: linear-gradient(to right, #ffcc70, #ffefa0);
    padding: 20px 30px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    border-radius: 0 0 12px 12px;
    z-index: 1000;
  }

  .nav-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 14px;
  }

  .nav-item {
    padding: 10px 16px;
    background-color: #fff;
    border-radius: 10px;
    font-weight: 600;
    color: #333;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    transition: transform 0.2s ease, background-color 0.3s;
  }

  .nav-item a {
    text-decoration: none;
    color: inherit;
  }

  .nav-item:hover {
    transform: scale(1.05);
    background-color: #ffe6aa;
  }
</style>
</head>
<body>
  <header class="main-header">
    <div class="nav-container">
      <div class="nav-item"><a href="/parent/index">방과후교육</a></div>
      <div class="nav-item"><a href="/parent/notice">공지사항</a></div>
      <div class="nav-item"><a href="/parent/subject">과목소개</a></div>
      <div class="nav-item"><a href="/parent/teacher">강사소개</a></div>
      <div class="nav-item"><a href="/parent/lectureList">수강신청</a></div>
      <div class="nav-item"><a href="/parent/lecturePayOrCancel">결제</a></div>
      <div class="nav-item"><a href="/parent/lectureLegistrationList">수강 신청내역</a></div>
      <div class="nav-item"><a href="/parent/studentSubject">자녀 수업조회</a></div>
      <div class="nav-item"><a href="/parent/attendance">자녀 출결조회</a></div>
      <div class="nav-item"><a href="/parent/vehicleInfo">자녀 배차조회</a></div>
      <div class="nav-item"><a href="/parent/album">사진첩</a></div>
      <div class="nav-item"><a href="/parent/qnaList">QnA</a></div>
      <div class="nav-item"><a href="/parent/modifyInfo">개인정보 수정</a></div>
    </div>
  </header>
</body>
</html>
