<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyLecture</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#recruited, #amount, #startTime, #endTime, #startDate, #endDate').on('input change', function() {
			const id = $(this).attr('id');
			$('#' + id + 'Check').text('');
		});
		
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
				$('#recruitedCheck').css('color', 'red').text('정원은 5명 이상이어야 합니다.');
				e.preventDefault();
				return;
			}
			
			if(amount == '' || isNaN(amount) || amount < 0) {
				$('#amountCheck').css('color', 'red').text('금액은 0원 이상이어야 합니다.');
				e.preventDefault();
				return;
			}
			
			if(startTime == '') {
				$('#startTimeCheck').css('color', 'red').text('시작 시간을 입력하세요.');
				e.preventDefault();
				return;
			}
			
			if(endTime == '') {
				$('#endTimeCheck').css('color', 'red').text('종료 시간을 입력하세요.');
				e.preventDefault();
				return;
			}
			
			if(startTime > endTime) {
				$('#startTimeCheck').css('color', 'red').text('시작 시간은 종료 시간보다 빨라야 합니다.');
				e.preventDefault();
				return;
			}
			
			if(startDate == '') {
				$('#startDateCheck').css('color', 'red').text('개강일을 입력하세요.');
				e.preventDefault();
				return;
			}
			
			if(startDate < today) {
				$('#startDateCheck').css('color', 'red').text('개강일은 오늘 날짜 또는 이후여야 합니다.');
				e.preventDefault();
				return;
			}
			
			if(endDate == '') {
				$('#endDateCheck').css('color', 'red').text('종강일을 입력하세요.');
				e.preventDefault();
				return;
			}
			
			if(startDate > endDate) {
				$('#startDateCheck').css('color', 'red').text('개강일은 종강일과 같거나 빠른 날짜여야 합니다.');
				e.preventDefault();
				return;
			}
		});
	});
</script>
</head>
<body>
	<h1>수업 수정</h1>
	<form method="post" name="lectureForm" id="lectureForm" action="/admin/modifyLecture">
		<input type="hidden" name="lectureId" value="${lecture.lectureId}">
		<table border="1">
			<tr>
				<th>과목</th>
				<td>
					<select name="subjectId" id="subjectId">
						<c:forEach var="subject" items="${subjectList}">
							<c:choose>
								<c:when test="${subject.subjectId == lecture.subjectId}">
									<option value="${subject.subjectId}" selected>${subject.subjectName}</option>
								</c:when>
								<c:otherwise>
									<option value="${subject.subjectId}">${subject.subjectName}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>강사</th>
				<td>
					<select name="teacherId" id="teacherId">
						<c:forEach var="teacher" items="${teacherList}">
							<c:choose>
								<c:when test="${teacher.userId == teacherId.teacherId}">
									<option value="${teacher.userId}" selected>${teacher.userName}</option>
								</c:when>
								<c:otherwise>
									<option value="${teacher.userId}">${teacher.userName}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>강의실</th>
				<td>
					<select name="classroomId" id="classroomId">
						<c:forEach var="classroom" items="${classroomList}">
							<c:choose>
								<c:when test="${classroom.classroomId == lecture.classroomId}">
									<option value="${classroom.classroomId}" selected>${classroom.classroomName}</option>
								</c:when>
								<c:otherwise>
									<option value="${classroom.classroomId}">${classroom.classroomName}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>정원</th>
				<td>
					<input type="number" name="recruited" id="recruited" value="${lecture.recruited}">
					<span id="recruitedCheck" style="color:red; margin-left:10px;"></span>
				</td>
			</tr>
			<tr>
				<th>금액</th>
				<td>
					<input type="number" name="amount" id="amount" value="${lecture.amount}">
					<span id="amountCheck" style="color:red; margin-left:10px;"></span>
				</td>
			</tr>
			<tr>
				<th>시작 시간</th>
				<td>
					<input type="time" name="startTime" id="startTime" value="${lecture.startTime}">
					<span id="startTimeCheck" style="color:red; margin-left:10px;"></span>
				</td>
			</tr>
			<tr>
				<th>종료 시간</th>
				<td>
					<input type="time" name="endTime" id="endTime" value="${lecture.endTime}">
					<span id="endTimeCheck" style="color:red; margin-left:10px;"></span>
				</td>
			</tr>
			<tr>
				<th>요일</th>
				<td>
				    <select name="dayOfWeek" id="dayOfWeek">
				    	<c:choose>
				    		<c:when test="${lecture.dayOfWeek == '월'}">
						        <option value="월" selected>월요일</option>
				    		</c:when>
				    		<c:otherwise>
						        <option value="월">월요일</option>
				    		</c:otherwise>
				    	</c:choose>
				    	<c:choose>
				    		<c:when test="${lecture.dayOfWeek == '화'}">
						        <option value="화" selected>화요일</option>
				    		</c:when>
				    		<c:otherwise>
						        <option value="화">화요일</option>
				    		</c:otherwise>
				    	</c:choose>
				    	<c:choose>
				    		<c:when test="${lecture.dayOfWeek == '수'}">
						        <option value="수" selected>수요일</option>
				    		</c:when>
				    		<c:otherwise>
						        <option value="수">수요일</option>
				    		</c:otherwise>
				    	</c:choose>
				    	<c:choose>
				    		<c:when test="${lecture.dayOfWeek == '목'}">
						        <option value="목" selected>월요일</option>
				    		</c:when>
				    		<c:otherwise>
						        <option value="목">목요일</option>
				    		</c:otherwise>
				    	</c:choose>
				    	<c:choose>
				    		<c:when test="${lecture.dayOfWeek == '금'}">
						        <option value="금" selected>금요일</option>
				    		</c:when>
				    		<c:otherwise>
						        <option value="금">금요일</option>
				    		</c:otherwise>
				    	</c:choose>
				    </select>
				</td>
			</tr>
			<tr>
				<th>개강일</th>
				<td>
					<input type="date" name="startDate" id="startDate" value="${lecture.startDate}">
					<span id="startDateCheck" style="color:red; margin-left:10px;"></span>
				</td>
			</tr>
			<tr>
				<th>종강일</th>
				<td>
					<input type="date" name="endDate" id="endDate" value="${lecture.endDate}">
					<span id="endDateCheck" style="color:red; margin-left:10px;"></span>
				</td>
			</tr>
			<tr>
				<th>배차</th>
				<td>
					<select name="assignmentId" id="assignmentId">
						<option value="">없음</option>
						<c:forEach var="va" items="${vehicleAssignmentList}">
							<c:choose>
								<c:when test="${va.assignmentId == vehicleAssignment.assignmentId}">
									<option value="${va.assignmentId}" selected>
										${va.assignmentId}(${va.vehicleNo}/${va.driverName}/${va.location})
									</option>
								</c:when>
								<c:otherwise>
									<option value="${va.assignmentId}">
										${va.assignmentId}(${va.vehicleNo}/${va.driverName}/${va.location})
									</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>