<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>createLecture</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#lectureForm').submit(function(e) {
			const recruited = $('#recruited').val();
			const amount = $('#amount').val();
			const startTime = $('#startTime').val();
			const endTime = $('#endTime').val();
			const startDate = $('#startDate').val();
			const endDate = $('#endDate').val();
			
			// 오늘 날짜 가져오기 (yyyy-mm-dd 형식)
			const today = new Date().toISOString().split('T')[0];
			
			if(recruited == '' || isNaN(recruited) || recruited <= 4) {
				alert("정원은 5명 이상이어야 합니다.");
				e.preventDefault();
				return;
			}
			
			if(amount == '' || isNaN(amount) || amount < 0) {
				alert("금액은 0원 이상이어야 합니다.");
				e.preventDefault();
				return;
			}
			
			if(startTime == '') {
				alert("시작 시간을 입력하세요.");
				e.preventDefault();
				return;
			}
			
			if(endTime == '') {
				alert("종료 시간을 입력하세요.");
				e.preventDefault();
				return;
			}
			
			if(startTime > endTime) {
				alert("시작 시간은 종료 시간보다 빨라야 합니다.");
				e.preventDefault();
				return;
			}
			
			if(startDate == '') {
				alert("개강일 입력하세요.");
				e.preventDefault();
				return;
			}
			
			if(startDate < today) {
				alert("개강일은 오늘 날짜 또는 이후여야 합니다.");
				e.preventDefault();
				return;
			}
			
			if(endDate == '') {
				alert("종강일 입력하세요.");
				e.preventDefault();
				return;
			}
			
			if(startDate > endDate) {
				alert("개강일은 종강일보다 같거나 빠른 날짜여야 합니다.");
				e.preventDefault();
				return;
			}
		});
	});
</script>
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
			<tr>
				<th>배차</th>
				<td>
					<select name="assignmentId" id="assignmentId">
						<option value="">없음</option>
						<c:forEach var="va" items="${vehicleAssignmentList}">
							<option value="${va.assignmentId}">
								${va.assignmentId}(${va.vehicleNo}/${va.driverName}/${va.location})
							</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
		<button type="submit">등록</button>
	</form>
</body>
</html>