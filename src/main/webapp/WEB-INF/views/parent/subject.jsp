<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty subject}">
		<h1>${subject.studentName}의 수강 정보</h1>
		<div>과목 : ${subject.subjectName}</div>
		<div>요일 : ${subject.dayOfWeeK}요일</div>
		<div>수업 기간 : ${subject.startDate} ~ ${subject.endDate}</div>
		<div>수업 시간 : <fmt:formatDate value="${subject.startTime}" pattern="HH:mm" /> 
					~ <fmt:formatDate value="${subject.endTime}" pattern="HH:mm" />
        </div>
		<div>강의실 : ${subject.classroomLocation} ${subject.classroomName}</div>
		<div>강사 : ${subject.teacherName}</div>
	</c:if>

	<c:if test="${empty subject}">
		<p>수강중인 과목이 없습니다.</p>
	</c:if>
</body>
</html>