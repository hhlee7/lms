<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 배차 조회</title>
</head>
<body>

<h2>학생 배차 조회</h2>

<form method="get" action="/teacher/student/vehicle">
  <input type="text" name="keyword" value="${keyword}" placeholder="학생명, 차량번호 검색" />
  <button type="submit">검색</button>
</form>

<table border="1">
    <tr>
        <th>학생명</th>
        <th>수업 시작</th>
        <th>수업 종료</th>
        <th>요일</th>
        <th>과목</th>
        <th>차량번호</th>
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
            <td>${v.address}</td>
        </tr>
    </c:forEach>
</table>

<!-- 페이징 -->
<div style="margin-top: 10px;">
  <c:forEach begin="1" end="${lastPage}" var="i">
    <c:choose>
      <c:when test="${i == page}">
        <strong>[${i}]</strong>
      </c:when>
      <c:otherwise>
        <a href="/teacher/student/vehicle?page=${i}&keyword=${keyword}">[${i}]</a>
      </c:otherwise>
    </c:choose>
  </c:forEach>
</div>

<a href="/teacher/main"><button type="button">메인으로</button></a>

</body>
</html>
