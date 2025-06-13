<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>출석 체크</title></head>
<body>
<h2>출석 체크</h2>
<c:if test="${not empty success}">
    <p style="color: green;">${success}</p>
</c:if>
<table border="1">
  <tr>
    <th>학생 이름</th>
    <th>과목</th>
    <th>출결 날짜</th>
    <th>출결 상태</th>
    <th>변경</th>
  </tr>
  <c:forEach var="a" items="${checkList}">
    <tr>
      <td>${a.studentName}</td>
      <td>${a.subjectName}</td>
      <td>${a.attendDate}</td>
      <td>${a.status}</td>
      <td>
        <c:if test="${a.status == '결석'}">
          <form method="post" action="/teacher/attendance/check">
            <c:if test="${not empty a.attendanceId}">
              <input type="hidden" name="attendanceId" value="${a.attendanceId}" />
            </c:if>
            <input type="hidden" name="paymentId" value="${a.payment_id}" />
            <select name="status">
              <option value="출석">출석</option>
              <option value="지각">지각</option>
              <option value="결석" selected>결석</option>
            </select>
            <button type="submit">변경</button>
          </form>
        </c:if>
        <c:if test="${a.status != '결석'}">
          ✔ 완료
        </c:if>
      </td>
    </tr>
  </c:forEach>
  <a href="/teacher/main"><button type="button">메인으로</button></a>
</table>
</body>
</html>
