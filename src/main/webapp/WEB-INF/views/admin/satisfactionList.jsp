<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>satisfactionList</title>
</head>
<body>
	<h1>만족도 평가 및 리뷰 조회</h1>
	
	<h2>강좌 만족도 평가 및 리뷰 목록</h2>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>과목</th>
			<th>이름</th>
			<th>강좌 평가 점수</th>
			<th>평가 일자</th>
			<th>리뷰</th>
			<th>리뷰 작성 일자</th>
		</tr>
	<c:forEach var="list" items="${LectureSatisfactionList}">
		<tr>
			<td>${list.satisfactionId}</td>
			<td>${list.subjectName}</td>
			<td>${list.studentName}</td>
			<td>${list.ratingLecture}</td>
			<td>${list.createAt}</td>
			<td>${list.content}</td>
			<td>${list.reivewCreateAt}</td>
		</tr>
	</c:forEach>
	</table>
	
	<h2>강사 만족도 평가 목록</h2>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>과목</th>
			<th>이름</th>
			<th>강사</th>
			<th>강사 평가 점수</th>
			<th>평가 일자</th>
		</tr>
	<c:forEach var="list" items="${TeacherSatisfactionList}">
		<tr>
			<td>${list.satisfactionId}</td>
			<td>${list.subjectName}</td>
			<td>${list.studentName}</td>
			<td>${list.teacherName}</td>
			<td>${list.ratingTeacher}</td>
			<td>${list.createAt}</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>