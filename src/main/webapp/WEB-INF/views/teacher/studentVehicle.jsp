<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>학생 배차 조회</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f1f4f8;
      padding: 20px;
      text-align: center;
    }

    h2 {
      margin-bottom: 25px;
    }

    table {
      width: 95%;
      margin: 0 auto;
      border-collapse: collapse;
      background-color: #fff;
      box-shadow: 0 4px 8px rgba(0,0,0,0.05);
    }

    th, td {
      padding: 12px;
      border: 1px solid #ddd;
      text-align: center;
    }

    th {
      background-color: #e9eef5;
      color: #333;
    }

    tr:nth-child(even) {
      background-color: #f9fbfd;
    }

    .main-btn {
      margin-top: 20px;
      padding: 10px 20px;
      background-color: #6c757d;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .main-btn:hover {
      background-color: #495057;
    }
  </style>
</head>
<body>

<h2>학생 배차 조회</h2>

<table>
  <tr>
    <th>학생명</th>
    <th>수업 시작</th>
    <th>수업 종료</th>
    <th>요일</th>
    <th>과목</th>
    <th>차량번호</th>
    <th>차량위치</th>
    <th>주소</th>
  </tr>
  <c:forEach var="v" items="${vehicleList}">
    <tr>
      <td>${v.studentName}</td>
      <td>${v.startTime}</td>
      <td>${v.endTime}</td>
      <td>${v.dayOfWeek}</td>
      <td>${v.subjectName}</td>
      <td>${v.vehicleNo}</td>
      <td>${v.vehicleLocation}</td>
      <td>${v.address}</td>
    </tr>
  </c:forEach>
</table>

<a href="/teacher/main"><button class="main-btn">메인으로</button></a>

</body>
</html>
