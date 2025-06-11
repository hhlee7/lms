<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 조회</title>
<script>
<!-- 비밀번호 변경 성공 시스템팝업  -->
  window.onload = function() {
    const success = '<c:out value="${success}" />';
    const error = '<c:out value="${error}" />';

    if (success) {
      alert(success);
    }
    if (error) {
      alert(error);
    }
  }
</script>
</head>
<body>
	<h2> 개인정보 조회</h2>
	<p>이름: ${loginUser.userName}</p>
	<p>생년월일: ${loginUser.birth}</p>
	<p>전화번호: ${loginUser.phone}</p>
	<p>주소: ${loginUser.address}</p>
	<p>학력: </p>
	<p>이력: </p>
	
	<a href="/teacher/profile/edit">
	<button type="button">✏️ 수정하기</button></a>
	<button type="button" onclick="history.back()">뒤로가기</button>

</body>
</html>