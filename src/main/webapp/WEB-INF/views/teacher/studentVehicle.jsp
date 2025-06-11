<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
    <a href="/teacher/main"><button type="button">메인으로</button></a>
</table>

</body>
</html>