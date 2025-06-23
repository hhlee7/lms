<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file ="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

	
	h1 {
		text-align: center;
		color: #004080;
		font-weight: 700;
		margin-bottom: 30px;
		font-size: 2rem;
	}
	
	form {
		width: 95%;
		margin: 0 auto 40px auto;
	}
	
	table {
		width: 100%;
		border-collapse: collapse;
		background-color: #fff;
		border-radius: 12px;
		overflow: hidden;
		box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
	}
	
	th, td {
		padding: 12px 16px;
		text-align: center;
		border-bottom: 1px solid #e3e8ee;
		font-size: 0.95rem;
		color: #444;
	}
	
	th {
		background-color: #e6f0ff;
		color: #003366;
		font-weight: 700;
	}
	
	tr:hover td {
		background-color: #f5faff;
		transition: background-color 0.3s ease;
	}
	
	@media (max-width: 768px) {
		table, th, td {
			font-size: 0.85rem;
			padding: 10px 8px;
		}
	}
</style>
</head>
<body>
	<h1>수강신청 내역</h1>
	
	<form>
		<table border="1">
			<tr>
				<th>수강생 이름</th>
				<th>신청 과목명</th>
				<th>개강일</th>
				<th>종강일</th>
				<th>수업 시간</th>
				<th>수업 요일</th>
				<th>신청일</th>
				<th>수강료</th>
			</tr>
			
			<c:forEach var="lec" items="${lectureLegistrationList}">
				<tr>
					<td>${lec.studentName}</td>
					<td>${lec.subjectName}</td>
					<td>${lec.startDate}</td>
					<td>${lec.endDate}</td>
					<fmt:parseDate value="${lec.startTime}" pattern="HH:mm:ss" var="parsedStartTime"/>
					<fmt:parseDate value="${lec.endTime}" pattern="HH:mm:ss" var="parsedEndTime"/>
					<td>
						<fmt:formatDate value="${parsedStartTime}" pattern="HH:mm" />
						~
						<fmt:formatDate value="${parsedEndTime}" pattern="HH:mm" />
					</td>
					<td>${lec.dayOfWeek}요일</td>
					<fmt:parseDate value="${lec.enrollmentAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate"/>
					<td><fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm"/></td>
					<td><fmt:formatNumber value="${lec.amount}" type="number" groupingUsed="true"/>원</td>
					
				</tr>
			</c:forEach>
		</table>
	</form>
</body>

</html>