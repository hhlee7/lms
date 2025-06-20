<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file ="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
	tab-size: 4;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f9fafc;
	margin: 0;
	padding: 120px 20px 40px;
	color: #222;
	}
	
	h1 {
		text-align: center;
		color: #004080;
		font-weight: 700;
		margin-bottom: 30px;
		font-size: 2rem;
	}
	
	table {
		width: 95%;
		margin: 0 auto 40px auto;
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
	
	button {
		background-color: #007acc;
		color: white;
		border: none;
		border-radius: 6px;
		padding: 8px 14px;
		font-weight: 600;
		cursor: pointer;
		transition: background-color 0.25s ease;
	}
	
	button:hover {
		background-color: #005f99;
	}
	
	form {
		margin: 0;
	}
	
	.error-message {
		color: #cc0000;
		font-weight: 700;
		text-align: center;
		margin-bottom: 20px;
	}
	
	.center-text {
	text-align: center;
	}
	
	.error-message {
	color: red;
	font-weight: bold;
	text-align: center;
	margin-top: 10px;
	margin-bottom: 20px;
	}
	
	@media (max-width: 768px) {
		table, th, td {
			font-size: 0.85rem;
			padding: 10px 8px;
		}
		button {
			padding: 6px 12px;
			font-size: 0.85rem;
		}
	}
</style>
</head>
<body>
	<h1 class="center-text">결제</h1>
	<c:if test="${not empty errorMessage}">
	<div style="color: red; font-weight: bold; text-align: center; margin-top: 10px; margin-bottom: 20px;">
		${errorMessage}
	</div>
	</c:if>

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
								<form method="post" action="/parent/refundLeture">
									<input type="hidden" name="studentId" value="${lec.studentId}">
									<input type="hidden" name="lectureId" value="${lec.lectureId}">
									<input type="hidden" name="amount" value="${lec.amount}">
									<input type="hidden" name="startDate" value="${lec.startDate}">
									<input type="hidden" name="status" value="${lec.status}">
									<button type="submit">환불신청</button>
								</form>
							</c:when>
							
							<c:when test="${lec.status == 'REFUNDWAIT'}">
								환불진행중
							</c:when>
							
							<c:when test="${lec.status == 'REFUND'}">
								환불완료
							</c:when>
							
							<c:otherwise>
								-
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
							<c:when test="${lec.status == 'CANCEL'}">
								취소된 강좌
							</c:when>
							<c:otherwise>
								-
							</c:otherwise>
						</c:choose>
						
					</td>
				</tr>
			</c:forEach>
		</table>
</body>

</html>