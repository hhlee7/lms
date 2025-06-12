<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 작성내역 보기</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<hr>
	
	<c:forEach var="history" items="${historyList}">
		<h3>과목 : ${history.subjectName}</h3>
		<h3>강사 : ${history.teacherName}</h3>
		
		<div>
			강사 평점 : ${history.ratingTeacher}
			<br><br>
			강의 평점 : ${history.ratingLecture}
			
			<c:if test="${not empty history.content}">
			    <h3>후기</h3>
			    <p>${history.content}</p>
			</c:if>
		</div>
		<hr>
	</c:forEach>
	
</body>
</html>