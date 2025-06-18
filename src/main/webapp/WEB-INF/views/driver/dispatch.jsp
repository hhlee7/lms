<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 배차 조회</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 90%;
        max-width: 800px;
        margin: 30px auto;
    }
    .dispatch-card {
        background-color: #ffffff;
        border: 1px solid #ddd;
        border-left: 8px solid #4CAF50;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        margin-bottom: 20px;
        padding: 20px;
        transition: transform 0.2s ease-in-out;
    }
    .dispatch-card:hover {
        transform: translateY(-5px);
    }
    .dispatch-card p {
        margin: 8px 0;
        color: #333;
    }
    .vehicle-icon {
        font-size: 28px;
        margin-right: 10px;
        vertical-align: middle;
    }
    .title {
        font-size: 24px;
        font-weight: bold;
        color: #333;
        text-align: center;
        margin-top: 20px;
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="container">
        <div class="title">🚗 내 배차 조회</div>
        <c:forEach var="dispatch" items="${dispatchList}">
            <div class="dispatch-card">
                <p><span class="vehicle-icon">🚙</span>차량번호: ${dispatch.vehicleNo}</p>
                <p>📅 요일: ${dispatch.dayOfWeek}</p>
                <p>🕓 차량 운행 시작시간: ${dispatch.endTime}</p>
                <p>📆 차량 운행기간: ${dispatch.startDate} ~ ${dispatch.endDate}</p>
            </div>
        </c:forEach>
    </div>
</body>
</html>