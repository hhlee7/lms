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
	<h1>수업 목록</h1>
	
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
		    <td>${lec.teacherName}</td>
		    <td>${lec.startTime} ~ ${lec.endTime}</td>
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
			            <input type="hidden" name="lectureId" value="${lec.lectureId}"/>
			            <input type="hidden" name="userId" value="${userId}">
			            <input type="hidden" name="studentId" value="${studentId}">
			            <button type="submit">수강신청하기</button>
			          </form>
			        </c:when>
			        <c:otherwise>
			          신청불가
			        </c:otherwise>
			      </c:choose>
		    </td>
		  </tr>
		</c:forEach>
	</table>
</body>
</html>