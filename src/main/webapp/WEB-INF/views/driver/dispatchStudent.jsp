<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배차된 학생 조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f2f6fa;
        margin: 0;
        padding: 0;
    }
    h3 {
        text-align: center;
        color: #333;
        margin-top: 30px;
    }
    #timeSelect {
        display: block;
        margin: 20px auto;
        padding: 8px 12px;
        font-size: 16px;
        border-radius: 6px;
        border: 1px solid #ccc;
    }
    #studentListArea {
        max-width: 800px;
        margin: 0 auto;
        padding: 10px;
    }
    .student-row {
        background-color: #ffffff;
        border-left: 6px solid #2196F3;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        margin-bottom: 15px;
        padding: 15px 20px;
        font-size: 16px;
        color: #444;
        display: none;
        transition: all 0.3s ease;
    }
    .student-row:hover {
        background-color: #eaf4ff;
    }
    .student-icon {
        margin-right: 10px;
        font-size: 20px;
    }
</style>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<h3><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/> 배차</h3>
	
	<!-- 시간 선택 -->
	<select id="timeSelect">
	    <option value="">-- 시간 선택 --</option>
	    <c:forEach var="time" items="${timeList}">
	        <option value="${time}">${time}</option>
	    </c:forEach>
	</select>

	<hr>

	<!-- 학생 목록 -->
	<div id="studentListArea">
	    <c:forEach var="student" items="${dispatchStudentList}">
	        <div class="student-row" data-endtime="${student.endTime}">
	            <span class="student-icon">👦👧</span>
	            <strong>학생 이름:</strong> ${student.studentName} |
	            <strong>차량번호:</strong> ${student.vehicleNo} |
	            <strong>요일:</strong> ${student.dayOfWeek}
	        </div>
	    </c:forEach>
	</div>
	
	<!-- JS로 선택한 시간의 학생만 표시 -->
	<script>
	    $(document).ready(function () {
	        $('#timeSelect').change(function () {
	        	const selectedTime = $(this).val().trim();
	            $('.student-row').hide();

	            if (selectedTime) {
	            	$('.student-row').each(function () {
	                    if ($(this).data('endtime') === selectedTime) {
	                    	$(this).fadeIn(200);
	                    }
	                });
	            }
	        });
	    });
	</script>
</body>
</html>