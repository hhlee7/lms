<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<style>
    body {
      font-family: 'Segoe UI', sans-serif;
      margin: 0;
      background-color: #f5f6fa;
      color: #333;
    }
    
    .container {
        max-width: 600px;
        margin: 100px auto 0 auto; /* header와의 간격 */
        background-color: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    }

    h1, h3 {
        color: #007acc;
        text-align: center;
        margin-bottom: 10px;
    }

    .info-text {
        text-align: center;
        margin-bottom: 30px;
    }

    textarea {
        width: 100%;
        height: 150px;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 6px;
        resize: vertical;
        box-sizing: border-box;
    }

    .form-group {
        margin-bottom: 25px;
    }

    #submitBtn {
        padding: 10px 20px;
        background-color: #007acc;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        display: block;
        margin: 0 auto;
    }

    #submitBtn:hover {
        background-color: #005f99;
    }
</style>
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
	<div class="container">
        <h1>리뷰 작성</h1>
        <div class="info-text">
            <h3>과목 : ${subjectName}</h3>
            <h3>강사 : ${teacherName}</h3>
        </div>

        <form id="reviewForm" method="post" action="/student/review">
            <div class="form-group">
                <label for="content"><strong>후기 내용</strong></label><br>
                <textarea id="content" name="content" placeholder="수업에 대한 후기를 작성해주세요."></textarea>
            </div>

            <input type="hidden" name="satisfactionId" value="${satisfactionId}">
            <button type="button" id="submitBtn">제출</button>
        </form>
    </div>
</body>
</html>