<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	  <tr>
	    <!-- 왼쪽 고정 타이틀 -->
	    <th>방과후 교육</th>
	
	    <!-- 수업관리 드롭다운 -->
	    <th>
	      <select onchange="location.href=this.value">
	        <option selected disabled>수업관리</option>
	        <option value="/teacher/lecture/list">수업조회</option>
	        <option value="/teacher/student/list">학생조회</option>
	        <option value="/teacher/student/vehicle">학생배차조회</option>
	      </select>
	    </th>
	
	    <!-- 출석관리 드롭다운 -->
	    <th>
	      <select onchange="location.href=this.value">
	        <option selected disabled>출석관리</option>
	        <option value="/teacher/attendance/check">출석체크</option>
	        <option value="/teacher/attendance/list">출결조회</option>
	      </select>
	    </th>
	
	    <!-- 교보제 드롭다운 -->
	    <th>
	      <select onchange="location.href=this.value">
	        <option selected disabled>교보제</option>
	        <option value="/teacher/material/list">교보제 조회</option>
	        <option value="/teacher/material/request">교보제 요청</option>
	      </select>
	    </th>
	
	    <!-- 사진첩 -->
	    <th><a href="/teacher/album/list">사진첩</a></th>
	    
	    <!-- 공지사항 -->
	    <th><a href="/teacher/notice">공지사항</a></th>
	
	    <!-- 개인정보 수정 -->
	    <th><a href="/teacher/profile">개인정보</a></th>
	  </tr>
	</table>
</body>
</html>