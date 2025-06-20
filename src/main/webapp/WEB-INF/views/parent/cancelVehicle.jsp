<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배차 취소 신청</title>
<style>
	body {
	margin: 0;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f9f9f9;
	}
	
	.container {
	  background: white;
	  padding: 30px 40px;
	  border-radius: 12px;
	  box-shadow: 0 6px 18px rgba(0,0,0,0.1);
	  width: 360px;
	  text-align: center; 
	}
	
	h1 {
	  margin-bottom: 25px;
	  color: #2c3e50;
	}
	
	label {
	  display: block;
	  margin-bottom: 6px;
	  font-weight: 600;
	  color: #333;
	  text-align: left; 
	}
	
	input[type="text"] {
	  padding: 8px 12px;
	  border-radius: 6px;
	  border: 1px solid #ccc;
	  font-size: 16px;
	  width: 100%;
	  box-sizing: border-box;
	  margin-bottom: 20px;
	}
	
	button {
	  padding: 10px;
	  border-radius: 6px;
	  background-color: #0077cc;
	  color: white;
	  border: none;
	  font-weight: bold;
	  cursor: pointer;
	  width: 100%;
	  transition: background-color 0.3s ease;
	}
	
	button:hover {
	  background-color: #005fa3;
	}
</style>
</head>
<body>
  <div class="container">
    <h1>${studentName}의 배차 취소 신청</h1>
    <form method="post" action="/parent/cancelVehicle">
      <div>
        <label for="reason">취소 사유 :</label>
        <input type="text" id="reason" name="reason" required>
      </div>
      <button type="submit">신청하기</button>
    </form>
  </div>
</body>

</html>
