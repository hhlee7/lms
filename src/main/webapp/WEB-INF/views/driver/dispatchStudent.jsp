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

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<hr>
	
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
	        <div class="student-row" data-endtime="${student.endTime}" style="display: none;">
	            학생 이름: ${student.studentName} | 
	            차량번호: ${student.vehicleNo} |
	            요일: ${student.dayOfWeek} |
	        </div>
	    </c:forEach>
	</div>
	
	<!-- JS로 선택한 시간의 학생만 표시 -->
	<script>
		function escapeSelector(sel) {
			return sel.replace(/:/g, "\\:");
	    }
	
	    $(document).ready(function () {
	        $('#timeSelect').change(function () {
	        	const selectedTime = $(this).val().trim();
	            $('.student-row').hide();

	            if (selectedTime) {
	            	$('.student-row').each(function () {
	                    if ($(this).data('endtime') === selectedTime) {
	                        $(this).show();
	                    }
	                });
	            }
	        });
	    });
	</script>
</body>
</html>