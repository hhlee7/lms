<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>

<!-- 구글 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Jua&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Noto Sans KR', 'Segoe UI', sans-serif;
        background-color: #f5f6fa;
        margin: 0;
        padding: 0;
        color: #333;
        font-size: 22px;  /* 기본 글자 크기 키움 */
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
        color: #000; /* 검정색 */
        font-size: 34px;  /* 크게 */
        margin-bottom: 20px;
        font-weight: 700;
        font-family: 'Jua', 'Gowun Dodum', 'Noto Sans KR', sans-serif;
    }

    .info-text {
        text-align: center;
        margin-bottom: 35px;
        color: #555; /* 기존 회색 유지 */
        font-family: 'Segoe UI', sans-serif;
        font-weight: normal;
        font-size: 20px; /* 키움 */
    }

    .info-text h3 {
        margin: 5px 0;
        font-size: 20px;
    }

    .form-group {
        margin-bottom: 30px;
    }

    label {
        display: block;
        font-weight: 700;
        margin-bottom: 8px;
        color: #000; /* 검정색 */
        font-family: 'Noto Sans KR', sans-serif;
        font-size: 20px;  /* 키움 */
    }

    textarea {
        width: 100%;
        height: 160px;
        padding: 14px;
        font-size: 20px;  /* 키움 */
        font-family: 'Noto Sans KR', sans-serif;
        border: 1px solid #ccc;
        border-radius: 8px;
        resize: vertical;
        box-sizing: border-box;
        background-color: #fdfdfd;
        transition: border 0.2s ease-in-out;
        color: #333;
    }

    textarea:focus {
        border-color: #007acc;
        outline: none;
    }

    #submitBtn {
        padding: 12px 30px;
        background-color: #007acc;
        color: #fff;
        font-size: 18px;  /* 키움 */
        font-weight: 700;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        display: block;
        margin: 0 auto;
        transition: background-color 0.2s ease;
        font-family: 'Noto Sans KR', sans-serif;
    }

    #submitBtn:hover {
        background-color: #005f99;
    }

    .note {
        text-align: center;
        font-size: 16px;  /* 키움 */
        color: #999;
        margin-top: 10px;
        font-family: 'Noto Sans KR', sans-serif;
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

            const confirmed = confirm("정말 제출하시겠습니까?");
            if (confirmed) {
                $("#reviewForm").submit();
            }
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
