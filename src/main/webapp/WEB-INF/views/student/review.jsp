<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#submitBtn").click(function() {
			if ($('#content').val().length == 0) {
				alert('후기를 작성해주세요');
				return;
			}
            
            $("#reviewForm").submit();
        });
	});
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<hr>
	<h1>리뷰 작성</h1>
	<h3>과목 : ${subjectName}</h3>
	<h3>강사 : ${teacherName}</h3>

		
	<form id="reviewForm" method="post" action="/student/review">
		<div>
			후기 :
			<br>
			<textarea rows="5" cols="50" id="content" name="content"></textarea>
		</div>
		
		<input type="hidden" name="satisfactionId" value="${satisfactionId}">
		<button type="button" id="submitBtn">제출</button>
	</form>
</body>
</html>