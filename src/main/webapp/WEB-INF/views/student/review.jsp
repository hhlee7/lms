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
        background-color: #f5f6fa;
        margin: 0;
        padding: 0;
        color: #333;
    }

    .container {
        max-width: 680px;
        margin: 80px auto;
        background-color: #ffffff;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.08);
    }

    h1 {
        text-align: center;
        color: #007acc;
        font-size: 28px;
        margin-bottom: 20px;
    }

    .info-text {
        text-align: center;
        margin-bottom: 35px;
        color: #555;
    }

    .info-text h3 {
        margin: 5px 0;
        font-size: 18px;
    }

    .form-group {
        margin-bottom: 30px;
    }

    label {
        display: block;
        font-weight: 600;
        margin-bottom: 8px;
        color: #333;
    }

    textarea {
        width: 100%;
        height: 160px;
        padding: 14px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 8px;
        resize: vertical;
        box-sizing: border-box;
        background-color: #fdfdfd;
        transition: border 0.2s ease-in-out;
    }

    textarea:focus {
        border-color: #007acc;
        outline: none;
    }

    #submitBtn {
        padding: 12px 30px;
        background-color: #007acc;
        color: #fff;
        font-size: 16px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        display: block;
        margin: 0 auto;
        transition: background-color 0.2s ease;
    }

    #submitBtn:hover {
        background-color: #005f99;
    }

    .note {
        text-align: center;
        font-size: 14px;
        color: #999;
        margin-top: 10px;
    }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    $(function(){
        $("#submitBtn").click(function() {
            if ($('#content').val().trim().length === 0) {
                alert('후기를 작성해주세요.');
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
        <h1>📝 리뷰 작성</h1>

        <div class="info-text">
            <h3>📘 과목: ${subjectName}</h3>
            <h3>👨‍🏫 강사: ${teacherName}</h3>
        </div>

        <form id="reviewForm" method="post" action="/student/review">
            <div class="form-group">
                <label for="content">후기 내용</label>
                <textarea id="content" name="content" placeholder="수업에 대한 후기를 솔직하게 작성해주세요. 다른 학생들에게 도움이 될 수 있어요."></textarea>
            </div>

            <input type="hidden" name="satisfactionId" value="${satisfactionId}">
            <button type="button" id="submitBtn">제출</button>
        </form>

        <div class="note">※ 욕설 및 부적절한 표현은 관리자에 의해 삭제될 수 있습니다.</div>
    </div>
</body>
</html>
