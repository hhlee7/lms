<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 배차 조회</title>

<!-- ✅ 폰트 적용 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Jua&display=swap" rel="stylesheet">

<!-- ✅ Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #f9f9fb;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 960px;
        margin: 60px auto;
        padding: 30px;
        background-color: #ffffff;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.05);
    }

    h1 {
        text-align: center;
        color: #000000;
        font-family: 'Jua', sans-serif;
        font-size: 2.4rem;
        font-weight: 700;
        margin-bottom: 40px;
    }

    .dispatch-card {
        border: 1px solid #dfe6e9;
        border-left: 5px solid #28a745;
        border-radius: 8px;
        padding: 20px 25px;
        margin-bottom: 25px;
        background-color: #fefefe;
        transition: box-shadow 0.2s ease;
    }

    .dispatch-card:hover {
        box-shadow: 0 4px 16px rgba(0,0,0,0.06);
    }

    h2 {
        font-family: 'Gowun Dodum', sans-serif;
        font-size: 20px;
        color: #28a745;
        margin-bottom: 10px;
    }

    .section-title {
        font-family: 'Gowun Dodum', sans-serif;
        font-size: 18px;
        color: #444;
        margin-bottom: 10px;
        font-weight: 600;
    }

    .dispatch-info p {
        margin: 6px 0;
        font-size: 15px;
        color: #444;
        font-family: 'Noto Sans KR', sans-serif;
    }

    .icon {
        margin-right: 6px;
        color: #28a745;
        font-weight: bold;
    }

    .info-block {
        margin-top: 15px;
        padding-top: 15px;
        border-top: 1px solid #eaecef;
    }
</style>
</head>
<body>

    <jsp:include page="header.jsp"></jsp:include>

    <div class="container">
        <h1>내 배차 조회</h1>

        <c:forEach var="dispatch" items="${dispatchList}">
            <div class="dispatch-card">
                <h2>${dispatch.subjectName}</h2>

                <div class="dispatch-info">
                    <div class="section-title">🧑‍🏫 수업 정보</div>
                    <p><span class="icon">👨‍🏫</span>강사명: ${dispatch.teacherName}</p>
                    <p><span class="icon">📅</span>요일: ${dispatch.dayOfWeek}</p>
                    <p><span class="icon">⏰</span>시간: ${dispatch.startTime} ~ ${dispatch.endTime}</p>
                    <p><span class="icon">📆</span>수업 기간: ${dispatch.startDate} ~ ${dispatch.endDate}</p>

                    <div class="info-block">
                        <div class="section-title">🚐 배차 정보</div>
                        <p><span class="icon">👨‍✈️</span>기사님: ${dispatch.driverName}</p>
                        <p><span class="icon">📞</span>기사 연락처: ${dispatch.driverPhone}</p>
                        <p><span class="icon">🚘</span>차량 번호: ${dispatch.vehicleNo}</p>
                        <p><span class="icon">📍</span>주차 장소: ${dispatch.location}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

</body>
</html>
