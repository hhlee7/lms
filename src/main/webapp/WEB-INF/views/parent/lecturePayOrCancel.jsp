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
	<h1>결제</h1>

	
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
				<th>결제</th>
				<th>취소</th>
			</tr>
			
			<c:forEach var="lec" items="${lecturePayOrCancelList}">
				${lec.studentName}
				${lec.studentId}
				<tr>
					<td>${lec.studentName}</td>
					<td>${lec.subjectName}</td>
					<td>${lec.startDate}</td>
					<td>${lec.endDate}</td>
					<td>${lec.startTime} ${lec.endTime}</td>
					<td>${lec.dayOfWeek}</td>
					<td>${lec.enrollmentAt}</td>
					<td><fmt:formatNumber value="${lec.amount}" type="number" groupingUsed="true"/>원</td>
					
					<td>
						<c:choose>
							<c:when test="${lec.status == 'PENDING'}">
								<form method="get" action="/parent/payment">
									<input type="hidden" name="studentId" value="${lec.studentId}">
									<input type="hidden" name="lectureId" value="${lec.lectureId}">
									<input type="hidden" name="amount" value="${lec.amount}">
									<button type="submit">결제하기</button>
								</form>
							</c:when>
							
							<c:when test="${lec.status == 'PAID'}">
								<form method="post" action="/parent/refund">
									<input type="hidden" name="studentId" value="${lec.studentId}">
									<input type="hidden" name="lectureId" value="${lec.lectureId}">
									<button type="submit">환불하기</button>
								</form>
							</c:when>
							
							<c:otherwise>
								<div><a href="/parent/lectureLegistrationList">수강 신청내역</a></div>
							</c:otherwise>
						</c:choose>
					</td>
					
					<td>
						<c:choose>
							<c:when test="${lec.status == 'PENDING'}">
								<form method="post" action="/parent/cancelLecture">
									<input type="hidden" name="studentId" value="${lec.studentId}">
									<input type="hidden" name="lectureId" value="${lec.lectureId}">
									<input type="hidden" name="status" value="${lec.status}">
									<button type="submit">수강취소</button>
								</form>
							</c:when>
							
							<c:otherwise>
								취소된 강좌
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>

</html>