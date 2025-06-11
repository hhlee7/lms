<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2>📘 내가 담당한 수업 목록</h2>

<table border="1">
  <tr>
    <th>과목명</th>
    <th>요일</th>
    <th>시작시간</th>
    <th>종료시간</th>
    <th>수업 기간</th>
    <th>강의실</th>
    <th>수강생 수</th>
  </tr>

  <c:forEach var="lec" items="${lectureList}">
    <tr>
      <td>${lec.subjectName}</td>
      <td>${lec.dayOfWeek}</td>
      <td>${lec.startTime}</td>
      <td>${lec.endTime}</td>
      <td>${lec.startDate} ~ ${lec.endDate}</td>
      <td>${lec.classroomName}</td>
      <td>${lec.studentCount}</td>
    </tr>
  </c:forEach>
  <a href="/teacher/main"><button type="button">메인으로</button></a>
</table>
