<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>학생 목록</title></head>
<body>
<h2>수업별 내 학생들</h2>

<!-- 검색 폼 -->
<form method="get" action="/teacher/student/list">
  <input type="text" name="keyword" value="${keyword}" placeholder="학생 이름 또는 과목 검색" />
  <button type="submit">검색</button>
</form>

<table border="1">
    <tr>
        <th>학생 이름</th>
        <th>과목</th>
        <th>요일</th>
        <th>시작</th>
        <th>종료</th>
    </tr>
    <c:forEach var="s" items="${studentList}">
        <tr>
            <td>${s.studentName}</td>
            <td>${s.subjectName}</td>
            <td>${s.dayOfWeek}</td>
            <td>${s.startTime}</td>
            <td>${s.endTime}</td>
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
        <a href="/teacher/student/list?page=${i}&keyword=${keyword}">[${i}]</a>
      </c:otherwise>
    </c:choose>
  </c:forEach>
</div>

<a href="/teacher/main"><button type="button">메인으로</button></a>

</body>
</html>
