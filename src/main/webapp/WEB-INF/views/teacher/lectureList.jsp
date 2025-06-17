<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>수업 목록</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f7f9fc;
      margin: 0;
      padding: 20px;
      text-align: center;
    }

    h2 {
      margin-bottom: 20px;
    }

    table {
      width: 90%;
      margin: 0 auto 20px auto;
      border-collapse: collapse;
      background-color: white;
      box-shadow: 0 4px 8px rgba(0,0,0,0.05);
    }

    th, td {
      padding: 12px 15px;
      border: 1px solid #e0e0e0;
      text-align: center;
    }

    th {
      background-color: #e9eef5;
      color: #333;
    }

    tr:nth-child(even) {
      background-color: #f5f7fa;
    }

    .main-btn {
      padding: 10px 20px;
      background-color: #00b4d8;
      color: white;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      font-weight: bold;
    }

    .main-btn:hover {
      background-color: #0077b6;
    }
  </style>
</head>
<body>

<h2>수업 목록</h2>

<table>
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
</table>

<a href="/teacher/main"><button class="main-btn">메인으로</button></a>

</body>
</html>
