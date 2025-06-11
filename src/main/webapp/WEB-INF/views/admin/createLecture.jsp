<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>createLecture</title>
</head>
<body>
	<h1>수업 등록</h1>
	<form method="post" name="lectureForm" id="lectureForm" action="/admin/createLecture">
		<table border="1">
			<tr>
				<th>과목</th>
				<td>
					<select name="subjectId" id="subjectId">
						<c:forEach var="subject" items="${subjectList}">
							<option value="${subject.subjectId}">${subject.subjectName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>강사</th>
				<td>
					<select name="teacherId" id="teacherId">
						<c:forEach var="teacher" items="${teacherList}">
							<option value="${teacher.userId}">${teacher.userName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>강의실</th>
				<td>
					<select name="classroomId" id="classroomId">
						<c:forEach var="classroom" items="${classroomList}">
							<option value="${classroom.classroomId}">${classroom.classroomName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>정원</th>
				<td>
					<input type="number" name="recruited" id="recruited">
				</td>
			</tr>
			<tr>
				<th>금액</th>
				<td>
					<input type="number" name="amount" id="amount">
				</td>
			</tr>
			<tr>
				<th>시작 시간</th>
				<td>
					<input type="time" name="startTime" id="startTime">
				</td>
			</tr>
			<tr>
				<th>종료 시간</th>
				<td>
					<input type="time" name="endTime" id="endTime">
				</td>
			</tr>
			<tr>
				<th>요일</th>
				<td>
				    <select name="dayOfWeek" id="dayOfWeek">
				        <option value="월">월요일</option>
				        <option value="화">화요일</option>
				        <option value="수">수요일</option>
				        <option value="목">목요일</option>
				        <option value="금">금요일</option>
				    </select>
				</td>
			</tr>
			<tr>
				<th>개강일</th>
				<td>
					<input type="date" name="startDate" id="startDate">
				</td>
			</tr>
			<tr>
				<th>종강일</th>
				<td>
					<input type="date" name="endDate" id="endDate">
				</td>
			</tr>
		</table>
		<button type="submit">등록</button>
	</form>
</body>
</html>