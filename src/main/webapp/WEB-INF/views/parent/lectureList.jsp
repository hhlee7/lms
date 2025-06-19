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
	body {
	font-family: 'Segoe UI', 'Arial', sans-serif;
	background-color: #f4f7fb;
	margin: 0;
	padding: 120px 20px 40px;
	color: #333;
	}
	
	h1 {
		text-align: center;
		font-size: 28px;
		color: #0b3c5d;
		margin-bottom: 30px;
	}
	
	table {
		width: 90%;
		margin: 0 auto 40px;
		border-collapse: collapse;
		background-color: #fff;
		border-radius: 12px;
		overflow: hidden;
		box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
	}
	
	th, td {
		padding: 14px 18px;
		text-align: center;
		border-bottom: 1px solid #eaeaea;
		font-size: 15px;
	}
	
	th {
		background-color: #e6f0ff;
		color: #0b3c5d;
		font-weight: 600;
	}
	
	tr:hover td {
		background-color: #f9fbff;
		transition: background-color 0.3s ease;
	}
	
	button {
		background-color: #007acc;
		color: white;
		border: none;
		border-radius: 6px;
		padding: 8px 16px;
		font-size: 14px;
		cursor: pointer;
		transition: background-color 0.3s ease;
	}
	
	button:hover {
		background-color: #005f9e;
	}
	
	div[style*="color: red"] {
		text-align: center;
		margin-bottom: 20px;
		font-weight: bold;
	}
</style>
</head>
<body>
	<h1>수업 목록</h1>
	
	<c:if test="${not empty param.error}">
	    <div style="color: red; font-weight: bold; margin-bottom: 10px;">
	       ${param.error}
	    </div>
	</c:if>
	
	<table border="1">
		<tr>
			<th>과목명</th>
			<th>강사</th>
			<th>수업시간</th>
			<th>요일</th>
			<th>개강일</th>
			<th>종강일</th>
			<th>교실</th>
			<th>신청인원</th>
			<th>수강료</th>
			<th>수강신청</th>
		</tr>
		
		<c:forEach var="lec" items="${lectureList}">
		  <tr>
		    <td>${lec.subjectName}</td>
		    <td>${lec.teacherName != null ? lec.teacherName : '미정'}</td>
		    <fmt:parseDate value="${lec.startTime}" pattern="HH:mm:ss" var="parsedStartTime"/>
			<fmt:parseDate value="${lec.endTime}" pattern="HH:mm:ss" var="parsedEndTime"/>
			<td>
				<fmt:formatDate value="${parsedStartTime}" pattern="HH:mm" />
				~
				<fmt:formatDate value="${parsedEndTime}" pattern="HH:mm" />
			</td>

		    <td>${lec.dayOfWeek}</td>
		    <td>${lec.startDate}</td>
		    <td>${lec.endDate}</td>
		    <td>${lec.location} ${lec.classroomName}</td>
		    <td>${lec.status}</td>
		    <td><fmt:formatNumber value="${lec.amount}" type="number" groupingUsed="true"/>원</td>
		    <td>
		    	<c:choose>
			        <c:when test="${lec.currentCount lt lec.recruited}">
			          <form action="/parent/lectureApply" method="post" style="margin:0;">
			            <input type="hidden" name="lectureId" value="${lec.lectureId}">
			            <input type="hidden" name="studentId" value="${studentId}">
			            <input type="hidden" name="amount" value="${lec.amount}">
			            <button type="submit">수강신청하기</button>
			          </form>
			        </c:when>
			        <c:otherwise>
			          마감
			        </c:otherwise>
			      </c:choose>
		    </td>
		  </tr>
		</c:forEach>
	</table>
</body>
</html>