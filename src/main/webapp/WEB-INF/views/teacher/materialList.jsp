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
    <th>교보제명</th>
    <th>과목</th>
    <th>요일</th>
    <th>시작시간</th>
    <th>총 수량</th>
  </tr>
  <c:forEach var="m" items="${materialList}">
    <tr>
      <td>${m.materialTitle}</td>
      <td>${m.subjectName}</td>
      <td>${m.dayOfWeek}</td>
      <td>${m.startTime}</td>
      <td>${m.totalCount}</td>
    </tr>
  </c:forEach>
  <button type="button" onclick="history.back()">뒤로가기</button>
</table>
</body>
</html>