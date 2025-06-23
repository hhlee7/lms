<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file ="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강중인 과목 조회</title>
<style>
	  html, body {
  background-color: #f4f7fb !important;
	}
  body {
    font-family: 'Arial', sans-serif;
    min-height: 100vh;
    background: linear-gradient(to bottom, #ffffff, #f4f7fb 600px, #ffffff);
    margin: 0;
  }
	

	.content-area {
		max-width: 900px;
		margin: 0 auto;
		padding: 50px 20px 40px;
		background-color: #f9fafc;
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		color: #222;
	}

	.content-area h1 {
		font-size: 2.2rem;
		font-weight: 700;
		color: #0b3c5d;
		margin-bottom: 24px;
		text-align: center;
		border-bottom: 2px solid #007acc;
		padding-bottom: 12px;
	}

	.content-area div {
		background: #fff;
		padding: 18px 24px;
		border-radius: 12px;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
		margin-bottom: 16px;
		font-size: 1rem;
		line-height: 1.5;
	}

	.content-area p {
		text-align: center;
		font-size: 1.1rem;
		color: #666;
		margin-top: 50px;
	}
</style>
</head>
<body>
	<div class="content-area">
		<c:if test="${not empty subject}">
			<c:forEach var="s" items="${subject}">
				<h1>'${s.studentName}' 학생의 수강 정보</h1>
				<div>과목 : ${s.subjectName}</div>
				<div>강사 : ${s.teacherName}</div>
				<div>요일 : ${s.dayOfWeeK}요일</div>
				<div>수업 기간 : ${s.startDate} ~ ${s.endDate}</div>
				<fmt:parseDate value="${s.startTime}" pattern="HH:mm:ss" var="parsedStartTime"/>
				<fmt:parseDate value="${s.endTime}" pattern="HH:mm:ss" var="parsedEndTime"/>
				<div>수업 시간 :
					<fmt:formatDate value="${parsedStartTime}" pattern="HH:mm" />
					~
					<fmt:formatDate value="${parsedEndTime}" pattern="HH:mm" />
				</div>
				<div>강의실 : ${s.classroomLocation} ${s.classroomName}</div>
			</c:forEach>
		</c:if>

		<c:if test="${empty subject}">
			<p>수강중인 과목이 없습니다.</p>
		</c:if>
	</div>
</body>
</html>
