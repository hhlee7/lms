<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수업 만족도 평가</title>

<!-- 구글 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Jua&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Noto Sans KR', 'Segoe UI', sans-serif;
        background: linear-gradient(to right, #e3f2fd, #f5f6fa);
        margin: 0;
        padding: 0;
        color: #333;
        font-size: 18px;
    }

    .container {
        max-width: 620px;
        margin: 80px auto;
        background-color: #ffffff;
        padding: 40px 30px;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
    }

    h1 {
        color: #000; /* 검정색 */
        text-align: center;
        margin-bottom: 10px;
        font-weight: 700;
        font-family: 'Jua', 'Gowun Dodum', 'Noto Sans KR', sans-serif;
    }

    .info-text {
        margin-bottom: 40px;
        text-align: center;
        font-size: 18px;
        color: #444; /* 기존 회색 유지 */
        font-family: 'Segoe UI', sans-serif; /* 기존 폰트 유지 */
        font-weight: normal;
    }

    .rating-section {
        margin-bottom: 40px;
    }

    .rating-label {
        font-weight: 700;
        font-size: 18px; /* 글자 크기 약간 키움 */
        margin-bottom: 12px;
        display: block;
        color: #000; /* 검정색 */
        font-family: 'Noto Sans KR', sans-serif;
    }

    .rating-group {
        display: flex;
        flex-direction: row-reverse;
        justify-content: flex-start;
        gap: 8px;
    }

    .rating-group input[type="radio"] {
        display: none;
    }

    .rating-group label {
        font-size: 30px;
        color: #ccc;
        cursor: pointer;
        transition: transform 0.2s ease, color 0.3s ease;
    }

    .rating-group input[type="radio"]:checked ~ label {
        color: #f5a623;
    }

    .rating-group label:hover,
    .rating-group label:hover ~ label {
        color: #f5a623;
        transform: scale(1.1);
    }

    #submitBtn {
        width: 100%;
        padding: 12px 0;
        background-color: #007acc;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        font-weight: 700;
        cursor: pointer;
        transition: background-color 0.3s ease;
        font-family: 'Noto Sans KR', sans-serif;
    }

    #submitBtn:hover {
        background-color: #005f99;
    }
</style>

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

            const confirmed = confirm("정말 제출하시겠습니까?");
            if (confirmed) {
                $("#evaluateForm").submit();
            }
        });
    });
</script>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container">
        <h1>만족도 평가</h1>
        <div class="info-text">
            <h3>📘 과목: ${subjectName}</h3>
            <h3>👨‍🏫 강사: ${teacherName}</h3>
        </div>

        <form id="evaluateForm" method="post" action="/student/evaluation">
            <c:set var="ratings" value="${fn:split('5,4,3,2,1', ',')}" />

            <!-- 강사 만족도 -->
            <div class="rating-section">
                <span class="rating-label">👨‍🏫 강사 만족도:</span>
                <div class="rating-group">
                    <c:forEach var="i" items="${ratings}">
                        <input type="radio" id="teacher${i}" name="teacherRating" value="${i}" />
                        <label for="teacher${i}">★</label>
                    </c:forEach>
                </div>
            </div>

            <!-- 수업 만족도 -->
            <div class="rating-section">
                <span class="rating-label">📚 수업 만족도:</span>
                <div class="rating-group">
                    <c:forEach var="i" items="${ratings}">
                        <input type="radio" id="lecture${i}" name="lectureRating" value="${i}" />
                        <label for="lecture${i}">★</label>
                    </c:forEach>
                </div>
            </div>

            <input type="hidden" name="paymentId" value="${paymentId}">
            <button type="button" id="submitBtn">제출하기 ✅</button>
        </form>
    </div>
</body>
</html>
