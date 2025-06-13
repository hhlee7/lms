<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수업 만족도 평가</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#submitBtn").click(function() {
            if ($("input[name='teacherRating']:checked").length == 0) {
                alert("강사 만족도를 선택해주세요.");
                return;
            }

            if ($("input[name='lectureRating']:checked").length == 0) {
                alert("수업 만족도를 선택해주세요.");
                return;
            }

            $("#evaluateForm").submit();
        });
	});
</script>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<hr>
	<h1>만족도 평가</h1>
	<h3>과목 : ${subjectName}</h3>
	<h3>강사 : ${teacherName}</h3>
	
	<form id="evaluateForm" method="post" action="/student/evaluation">
        <!-- 강사 만족도 -->
        <p>강사:</p>
        <c:forEach var="i" begin="1" end="5">
            <input type="radio" name="teacherRating" value="${i}" required>
            <label for="teacher${i}">${i}</label>
        </c:forEach>

        <br><br>

        <!-- 수업 만족도 -->
        <p>수업:</p>
        <c:forEach var="i" begin="1" end="5">
            <input type="radio" name="lectureRating" value="${i}" required>
            <label for="content${i}">${i}</label>
        </c:forEach>

        <input type="hidden" name="paymentId" value="${paymentId}">

        <br><br>
        <button type="button" id="submitBtn">제출</button>
    </form>
</body>
</html>