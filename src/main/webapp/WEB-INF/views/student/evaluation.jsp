<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수업 만족도 평가</title>
<style>
    body {
      font-family: 'Segoe UI', sans-serif;
      margin: 0;
      background-color: #f5f6fa;
      color: #333;
    }
    
    .container {
        max-width: 600px;
        margin: 100px auto 0 auto;;
        background-color: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    }

    h1, h3 {
        color: #007acc;
        text-align: center;
    }

    .info-text {
        margin-bottom: 30px;
        text-align: center;
    }

    .rating-section {
        margin-bottom: 30px;
    }

    .rating-label {
        font-weight: bold;
        margin-bottom: 10px;
        display: block;
    }

    .rating-group {
        display: flex;
        flex-direction: row-reverse;
        justify-content: flex-start;
        gap: 5px;
    }

    .rating-group input[type="radio"] {
        display: none;
    }

    .rating-group label {
        font-size: 28px;
        color: #ccc;
        cursor: pointer;
        transition: color 0.2s;
    }

    .rating-group input[type="radio"]:checked ~ label {
        color: #f5a623;
    }

    .rating-group label:hover,
    .rating-group label:hover ~ label {
        color: #f5a623;
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
	<div class="container">
        <h1>만족도 평가</h1>
        <div class="info-text">
            <h3>과목 : ${subjectName}</h3>
            <h3>강사 : ${teacherName}</h3>
        </div>

        <form id="evaluateForm" method="post" action="/student/evaluation">
            <c:set var="ratings" value="${fn:split('5,4,3,2,1', ',')}" />

            <!-- 강사 만족도 -->
            <div class="rating-section">
                <span class="rating-label">강사 만족도:</span>
                <div class="rating-group">
                    <c:forEach var="i" items="${ratings}">
                        <input type="radio" id="teacher${i}" name="teacherRating" value="${i}" />
                        <label for="teacher${i}">★</label>
                    </c:forEach>
                </div>
            </div>

            <!-- 수업 만족도 -->
            <div class="rating-section">
                <span class="rating-label">수업 만족도:</span>
                <div class="rating-group">
                    <c:forEach var="i" items="${ratings}">
                        <input type="radio" id="lecture${i}" name="lectureRating" value="${i}" />
                        <label for="lecture${i}">★</label>
                    </c:forEach>
                </div>
            </div>

            <input type="hidden" name="paymentId" value="${paymentId}">

            <button type="button" id="submitBtn">제출</button>
        </form>
    </div>
</body>
</html>