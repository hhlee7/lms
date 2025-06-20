<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/common/common-style.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>관리자 회원 정보</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', sans-serif;
      background-color: #f9fafb;
    }
    .main-content {
      margin-left: 260px;
      padding: 100px 40px 40px;
    }
    table {
      width: 100%;
      margin-bottom: 30px;
      background-color: #fff;
      border-collapse: collapse;
      box-shadow: 0 0 10px rgba(0,0,0,0.05);
    }
    table th, table td {
      padding: 12px 15px;
      border: 1px solid #dee2e6;
    }
    table th {
      background-color: #f1f5f9;
    }
    a.btn {
      margin-right: 10px;
    }
  </style>
</head>
<body>

  <div class="main-content">
    <h2 class="mb-4 fw-bold">관리자 회원 정보</h2>
    <h4 class="mb-3">${selectedUser.userName}님의 정보</h4>

    <table class="table">
      <tr><th>아이디</th><td>${selectedUser.userId}</td></tr>
      <tr><th>이름</th><td>${selectedUser.userName}</td></tr>
      <tr><th>역할</th><td>${selectedUser.roleName}</td></tr>
      <tr><th>Email</th><td>${selectedUser.email}</td></tr>
      <tr><th>전화번호</th><td>${selectedUser.phone}</td></tr>
      <tr><th>주소</th><td>${selectedUser.address}</td></tr>
      <tr><th>생년월일</th><td>${selectedUser.birth}</td></tr>
    </table>

    <a href="userModify?userId=${selectedUser.userId}" class="btn btn-primary">수정</a>

    <c:if test="${lectureList != null}">
      <h4 class="mt-5">강사 경력</h4>
      <form action="modifyHistory" method="post">
        <input type="hidden" name="teacherId" value="${selectedUser.userId}">
        <table class="table">
          <c:set var="edu" value="${empty historyList.lastEducation ? '미입력' : historyList.lastEducation}" />
          <c:set var="his" value="${empty historyList.personalHistory ? '미입력' : historyList.personalHistory}" />
          <tr><th>최종 학력</th><td><input type="text" name="lastEducation" class="form-control" value="${edu}" /></td></tr>
          <tr><th>수상/경력</th><td><input type="text" name="personalHistory" class="form-control" value="${his}" /></td></tr>
        </table>
        <button type="submit" class="btn btn-success">수정</button>
      </form>

      <h4 class="mt-5">수업 정보</h4>
      <a href="/admin/createLecture" class="btn btn-outline-secondary mb-2">수업 등록</a>
      <c:forEach var="lec" items="${lectureList}">
        <table class="table">
          <tr>
            <th>과목</th><th>강사</th><th>요일</th><th>시간</th><th>강의실</th><th>개강일</th><th>종강일</th>
          </tr>
          <tr>
            <td>${lec.subjectName}</td>
            <td>${selectedUser.userName}</td>
            <td>${lec.dayOfWeek}</td>
            <td>${lec.startTime} - ${lec.endTime}</td>
            <td>${lec.classroomName}</td>
            <td>${lec.startDate}</td>
            <td>${lec.endDate}</td>
          </tr>
        </table>
      </c:forEach>
    </c:if>

    <c:if test="${parentUser != null}">
      <h4 class="mt-5">학부모 정보</h4>
      <c:forEach var="parent" items="${parentUser}">
        <table class="table">
          <tr><th>아이디</th><td>${parent.userId}</td></tr>
          <tr><th>이름</th><td><a href="/admin/userOne?userId=${parent.userId}">${parent.userName}</a></td></tr>
          <tr><th>전화번호</th><td>${parent.phone}</td></tr>
        </table>
      </c:forEach>
    </c:if>

    <c:if test="${studentUser != null}">
      <h4 class="mt-5">자녀 정보</h4>
      <c:forEach var="student" items="${studentUser}">
        <table class="table">
          <tr><th>아이디</th><td>${student.userId}</td></tr>
          <tr><th>이름</th><td><a href="/admin/userOne?userId=${student.userId}">${student.userName}</a></td></tr>
          <tr><th>전화번호</th><td>${student.phone}</td></tr>
        </table>
      </c:forEach>
    </c:if>

    <c:if test="${vehicleList != null}">
      <h4 class="mt-5">차량 배정 정보</h4>
      <a href="vehicleManagement" class="btn btn-outline-secondary mb-2">차량 관리</a>
      <c:forEach var="vec" items="${vehicleList}">
        <table class="table">
          <tr>
            <th>차량번호</th><th>운전자</th><th>요일</th><th>탑승 시간</th><th>인원</th>
          </tr>
          <tr>
            <td>${vec.vehicleNo}</td>
            <td>${selectedUser.userName}</td>
            <td>${vec.dayOfWeek}</td>
            <td>${vec.endTime}</td>
            <td>${vec.capacity}</td>
          </tr>
        </table>
      </c:forEach>
    </c:if>

    <a href="userManagement" class="btn btn-secondary">뒤로</a>
  </div>
</body>
</html>