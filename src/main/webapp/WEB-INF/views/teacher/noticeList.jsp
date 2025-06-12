<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>공지사항</title></head>
<body>

<h2>공지사항</h2>
<a href="/teacher/main"><button type="button">메인으로</button></a>
<form method="get" action="/teacher/notice/list">
  <input type="text" name="keyword" value="${keyword}" placeholder="제목 또는 내용 검색" />
  <button type="submit">검색</button>
</form>

<table border="1" cellpadding="8" cellspacing="0">
  <tr>
    <th>번호</th>
    <th>제목</th>
    <th>작성자</th>
    <th>작성일</th>
  </tr>
  <c:forEach var="n" items="${noticeList}">
    <tr>
      <td>${n.notice_id}</td>
      <td>${n.title}</td>
      <td>${n.admin_id}</td>
      <td>${n.created_at}</td>
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
        <a href="/teacher/notice/list?page=${i}&keyword=${keyword}">[${i}]</a>
      </c:otherwise>
    </c:choose>
  </c:forEach>
</div>
</body>
</html>
