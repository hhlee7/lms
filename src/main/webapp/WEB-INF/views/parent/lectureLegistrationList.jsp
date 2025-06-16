<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file ="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<td>${lec.startTime} ${lec.endTime}</td>
					<td>${lec.dayOfWeek}</td>
					<td>${lec.enrollmentAt}</td>
					<td><fmt:formatNumber value="${lec.amount}" type="number" groupingUsed="true"/>원</td>
					
				</tr>
			</c:forEach>
		</table>
	</form>
</body>

</html>