<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file ="/WEB-INF/views/layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<c:if test="${not empty subject}">
		<c:forEach var="s" items="${subject}">
			<h1>${s.studentName}의 수강 정보</h1>
			<div>과목 : ${s.subjectName}</div>
			<div>요일 : ${s.dayOfWeek}요일</div>
			<div>수업 기간 : ${s.startDate} ~ ${s.endDate}</div>
			<div>수업 시간 : <fmt:formatDate value="${s.startTime}" pattern="HH:mm" /> 
						~ <fmt:formatDate value="${s.endTime}" pattern="HH:mm" />
	        </div>
			<div>강의실 : ${s.classroomLocation} ${s.classroomName}</div>
			<div>강사 : ${s.teacherName}</div>
		</c:forEach>
	</c:if>

	<c:if test="${empty subject}">
		<p>수강중인 과목이 없습니다.</p>
	</c:if>
</body>
</html>