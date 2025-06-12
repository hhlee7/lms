<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  body {
    margin: 0;
    font-family: 'Arial', sans-serif;
    background-color: #f9f9f9;
  }

  .header {
    background: linear-gradient(to right, #ffcc70, #ffefa0);
    padding: 20px;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: space-around;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    border-radius: 0 0 12px 12px;
  }

  .header div {
    margin: 8px;
    padding: 10px 16px;
    background-color: white;
    border-radius: 12px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    transition: transform 0.2s ease;
    font-weight: bold;
    color: #333;
  }

  .header div:hover {
    transform: scale(1.05);
    background-color: #ffe0a0;
    cursor: pointer;
  }

  .header div a {
    text-decoration: none;
    color: #333;
  }

  .header div:first-child {
    font-size: 1.6em;
    background-color: #ffd966;
    color: #6b4e00;
  }
</style>
</head>
<body>
	<div class="header">
		<div><a href="/parent/index">방과후교육</a></div>
		<div><a href="/parent/notice">공지사항</a></div>
		<div><a href="/parent/subjectInfo">과목소개</a></div>
		<div><a href="/parent/teacherInfo">강사소개</a></div>
		<div><a href="/parent/lectureList">수강신청</a></div>
		<div><a href="/parent/">수업료 납부</a></div>
		<div><a href="/parent/subject">자녀 수업조회</a></div>
		<div><a href="/parent/attendance">자녀 출결조회</a></div>
		<div><a href="/parent/vehicleInfo">자녀 배차조회</a></div>
		<div><a href="/parent/">자녀 배차취소 신청</a></div>
		<div><a href="/parent/album">사진첩</a></div>
		<div><a href="/parent/qnaList">QnA</a></div>
		<div><a href="/parent/modifyInfo">개인정보 수정</a></div>
	</div>
</body>
</html>