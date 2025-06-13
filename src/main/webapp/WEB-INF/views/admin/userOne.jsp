<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원 정보</title>
<!-- jQuery CDN (페이지에 없으면 추가) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>관리자 회원 정보 페이지</h1>
	<h3>${selectedUser.userName}님의 정보</h3>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>${selectedUser.userId}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${selectedUser.userName}</td>
		</tr>
		<tr>
			<td>역할</td>
			<td>${selectedUser.roleName}</td>
		</tr>
		<tr>
			<td>email</td>
			<td>${selectedUser.email}</td>
		</tr>
		
		<tr>
			<td>전화번호</td>
			<td>${selectedUser.phone}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${selectedUser.address}</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>${selectedUser.birth}</td>
		</tr>
	</table>
	<a href="userModify?userId=${selectedUser.userId}">수정</a>
	
	<!-- 강사 정보이면서, 수업, 경력을 출력 -->
	<c:if test="${lectureList != null}">
		<h3>강사 경력</h3>
		<form action="modifyHistory" method="post">
			<input type="hidden" name="teacherId" id="teacherId" value="${selectedUser.userId}">
			<table border="1">
				<%-- 최종 학력 값 설정 --%>
				<c:choose>
				  <c:when test="${empty historyList.lastEducation}">
				    <c:set var="edu" value="미입력" />
				  </c:when>
				  <c:otherwise>
				    <c:set var="edu" value="${historyList.lastEducation}" />
				  </c:otherwise>
				</c:choose>
				
				<%-- 수상/경력 값 설정 --%>
				<c:choose>
				  <c:when test="${empty historyList.personalHistory}">
				    <c:set var="his" value="미입력" />
				  </c:when>
				  <c:otherwise>
				    <c:set var="his" value="${historyList.personalHistory}" />
				  </c:otherwise>
				</c:choose>
				
				<tr>
				  <th>최종 학력</th>
				  <td>
				    <input type="text" name="lastEducation" id="lastEducation" value="${edu}" />
				  </td>
				</tr>
				<tr>
				  <th>수상/경력</th>
				  <td>
				    <input type="text" name="personalHistory" id="personalHistory" value="${his}" />
				  </td>
				</tr>
			</table>
			<button type="submit">수정</button>
		</form>
		
		<h3>수업 정보</h3>
		<a href="lectureInsert?userId=${selectedUser.userId}">수업 등록</a>
		<c:forEach var="lec" items="${lectureList}">
			<table border="1">
				<tr>
					<th>과목</th>
					<th>강사</th>
					<th>요일</th>
					<th>시간</th>
					<th>강의실</th>
					<th>개강일</th>
					<th>종강일</th>	
					<th>정정</th>					
				</tr>
				<tr>
					<td>${lec.subjectName}</td>
					<td>${selectedUser.userName}</td>
					<td>${lec.dayOfWeek}</td>
					<td>${lec.startTime} - ${lec.endTime}</td>
					<td>${lec.classroomName}</td>
					<td>${lec.startDate}</td>
					<td>${lec.endDate}</td>
					<td><a href="">수정</a></td>
				</tr>
			</table>
		</c:forEach>
	</c:if>
	
	<!-- 자녀 정보이면서, 학부모 데이터를 출력 -->
	<c:if test="${parentUser != null}">
	<h3>학부모 정보</h3>
		<!-- 학부모 데이터를 forEach문으로 출력 -->
		<c:forEach var="parent" items="${parentUser}">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>${parent.userId}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${parent.userName}</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>${parent.phone}</td>
				</tr>
			</table>
			<br>
		</c:forEach>	
	</c:if>
	
	<!-- 학부모 정보이면서, 자녀 학생 데이터를 출력 -->
	<c:if test="${studentUser != null}">
	<h3>자녀 정보</h3>
		<!-- 자녀가 여러명일수 있으니 forEach문으로 출력 -->
		<c:forEach var="student" items="${studentUser}">
		
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>${student.userId}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${student.userName}</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>${student.phone}</td>
				</tr>
			</table>
		
		</c:forEach>	
	</c:if>
	
	<!-- 기사 정보이면서, 차량 데이터를 출력 -->
	<c:if test="${vehicleList != null}">
	<h3>수업 정보</h3>
	<a href="vehicleManagement">차량 관리</a>
		<c:forEach var="vec" items="${vehicleList}">
			<table border="1">
				<tr>
					<th>차량번호</th>
					<th>운전자</th>
					<th>요일</th>
					<th>탑승 시간</th>
					<th>인원</th>			
				</tr>
				<tr>
					<td>${vec.vehicleNo}</td>
					<td>${selectedUser.userName}</td>
					<td>${vec.dayOfWeek}</td>
					<td>${vec.endTime}</td>
					<td>${vec.capacity}</td>
				</tr>
			</table>
			<br>
		</c:forEach>
	</c:if>
	
	<a href="userManagement">뒤로</a>
</body>
</html>