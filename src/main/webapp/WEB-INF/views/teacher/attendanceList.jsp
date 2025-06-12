<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>출결 조회</title></head>
<body>
<h2>수강생 출결 현황</h2>

<!-- 검색 폼 -->
<form method="get" action="/teacher/attendance/list">
  <input type="text" name="keyword" value="${keyword}" placeholder="학생명 또는 과목 검색" />
  <button type="submit">검색</button>
</form>

<table border="1">
  <tr>
    <th>학생명</th>
    <th>과목</th>
    <th>요일</th>
    <th>시간</th>
    <th>출결일</th>
    <th>상태</th>
  </tr>
  <c:forEach var="a" items="${attendanceList}">
    <tr>
      <td>${a.studentName}</td>
      <td>${a.subjectName}</td>
      <td>${a.dayOfWeek}</td>
      <td>${a.startTime} ~ ${a.endTime}</td>
      <td>${a.attendDate}</td>
      <td>${a.status}</td>
    </tr>
  </c:forEach>
</table>

<!-- 페이징 -->
<div style="margin-top:10px;">
  <c:forEach begin="1" end="${lastPage}" var="i">
    <c:choose>
      <c:when test="${i == page}">
        <strong>[${i}]</strong>
      </c:when>
      <c:otherwise>
        <a href="/teacher/attendance/list?page=${i}&keyword=${keyword}">[${i}]</a>
      </c:otherwise>
    </c:choose>
  </c:forEach>
</div>

<button type="button" onclick="history.back()">뒤로가기</button>
</body>
</html>
