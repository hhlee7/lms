<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file ="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배차 정보</title>
<style>
	.vehicle-info-page {
		max-width: 480px;
		margin: 120px auto 40px;
		padding: 0 20px;
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		background-color: #f4f7fb;
	}
	
	.vehicle-info-page h1 {
		text-align: center;
		font-size: 28px;
		font-weight: 700;
		color: #0b3c5d;
		margin-bottom: 30px;
	}
	
	.vehicle-info-page .info-card {
		background: #fff;
		padding: 20px 30px;
		border-radius: 12px;
		box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
		margin-bottom: 30px;
	}
	
	.vehicle-info-page .info-item {
		display: flex;
		justify-content: flex-start;
		padding: 10px 8px;
		border-bottom: 1px solid #eee;
		align-items: center;
		gap: 10px;
	}
	
	.vehicle-info-page .info-label {
		font-weight: 600;
		color: #1a73e8;
		width: 40%;
		text-align: left;
	}
	
	.vehicle-info-page .info-value {
		color: #555;
		width: 60%;
		text-align: center;
	}
	
	.vehicle-info-page .btn-cancel {
		display: block;
		margin: 0 auto;
		padding: 12px 28px;
		background-color: #1a73e8;
		color: white;
		font-weight: 700;
		border: none;
		border-radius: 8px;
		cursor: pointer;
		transition: background-color 0.3s ease;
		text-align: center;
		text-decoration: none;
	}
	
	.vehicle-info-page .btn-cancel:hover {
		background-color: #155bb5;
	}
	
	.vehicle-info-page p.cancel-message {
		color: #d32f2f;
		font-weight: 700;
		text-align: center;
		margin-bottom: 20px;
	}
	.btn-cancel {
	  display: inline-block;      
	  padding: 12px 28px;          
	  background-color: #1a73e8;   
	  color: #ffffff;              
	  font-weight: 600;           
	  font-size: 16px;            
	  border-radius: 6px;        
	  text-decoration: none;      
	  cursor: pointer;             
	  box-shadow: 0 4px 8px rgba(26, 115, 232, 0.3);
	  transition: background-color 0.3s ease; 
	}
	
	.btn-cancel:hover {
	  background-color: #155bb5; 
	}

</style>
</head>
<body>
	<div class="vehicle-info-page">
		<c:choose>
			<c:when test="${not empty vehicleInfo and vehicleInfo.isCancelledToday eq 1}">
				<h1>${vehicleInfo.studentName}의 배차 정보</h1>
				<p class="cancelled-message">금일 배차를 취소했습니다.</p>
			</c:when>

			<c:when test="${not empty vehicleInfo}">
				<h1>${vehicleInfo.studentName}의 탑승 차량 정보</h1>
				<div class="info-card">
					<div class="info-item">
						<span class="info-label">차량번호</span>
						<span class="info-value">${vehicleInfo.vehicleNo}</span>
					</div>
					<div class="info-item">
						<span class="info-label">기사님 이름</span>
						<span class="info-value">${vehicleInfo.driverName}</span>
					</div>
					<div class="info-item">
						<span class="info-label">기사님 연락처</span>
						<span class="info-value">${vehicleInfo.phone}</span>
					</div>
					<fmt:parseDate value="${vehicleInfo.endTime}" pattern="HH:mm:ss" var="parsedEndTime" />
					<div class="info-item">
						<span class="info-label">출발 시간</span>
						<span class="info-value">
							<fmt:formatDate value="${parsedEndTime}" pattern="HH:mm" />
						</span>
					</div>
				</div>
				<div style="text-align: center; margin-top: 20px;">
					<a href="/parent/cancelVehicle?studentName=${vehicleInfo.studentName}" class="btn-cancel">배차 취소신청</a>
				</div>

			</c:when>

			<c:otherwise>
				<p style="text-align:center; font-size:18px; color:#666;">배차 정보가 없습니다.</p>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>
