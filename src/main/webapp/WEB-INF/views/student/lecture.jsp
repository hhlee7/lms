<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 수업 조회</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<hr>
	<c:forEach var="lecture" items="${lectureList}">
		<div>
			<p>과목명: ${lecture.subjectName}</p>
            <p>강사명: ${lecture.teacherName}</p>
            <p>요일: ${lecture.dayOfWeek}</p>
            <p>시간: ${lecture.startTime} ~ ${lecture.endTime}</p>
            <p>강의실: ${lecture.classroomName}</p>
            <p>위치: ${lecture.classroomLocation}</p>
            <p>수업 기간: ${lecture.startDate} ~ ${lecture.endDate}</p>
            <hr>
		</div>
	</c:forEach>
</body>
</html>