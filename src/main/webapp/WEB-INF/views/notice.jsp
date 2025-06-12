<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.afterSchoolLms.dto.User" %>
<%
    User loginUser = (User) session.getAttribute("loginUser");
    if (loginUser == null) {
%>
    <script>
        alert("로그인 후 이용해주세요 😊");
        location.href = "/login.jsp";
    </script>
<%
        return;
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <style>
        body {
            font-family: 'Pretendard', sans-serif;
            padding: 40px;
            background: #f9f9f9;
        }
        .notice-wrapper {
            max-width: 800px;
            margin: auto;
            background: white;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }
        h2 {
            font-size: 24px;
            margin-bottom: 20px;
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
        }
        .notice-item {
            margin-bottom: 25px;
        }
        .notice-title {
            font-weight: bold;
            color: #222;
        }
        .notice-date {
            font-size: 0.9rem;
            color: #777;
        }
    </style>
</head>
<body>
<div class="notice-wrapper">
    <h2>공지사항</h2>

    <div class="notice-item">
        <div class="notice-title">6월 학부모 상담주간 안내</div>
        <div class="notice-date">2025-06-10</div>
        <p>6월 둘째 주부터 학부모 상담주간이 시작됩니다. 학부모님의 많은 참여 부탁드립니다.</p>
    </div>

    <div class="notice-item">
        <div class="notice-title">방과후 수업 일정 변경 안내</div>
        <div class="notice-date">2025-06-08</div>
        <p>운영 일정 변경으로 일부 방과후 수업 시간이 조정됩니다. 공지사항 확인 바랍니다.</p>
    </div>

</div>
</body>
</html>
