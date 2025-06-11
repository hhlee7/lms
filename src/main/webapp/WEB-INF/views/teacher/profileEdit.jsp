<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>개인정보 수정</title>
  <script>
  <!-- 비밀번호 변경 실패 시스템팝업  -->
    window.onload = function () {
      const success = '${success}';
      const error = '${error}';

      if (success) {
        alert(success);
      }
      if (error) {
        alert(error);
      }
    };
  </script>
</head>
<body>

<h2>개인정보 수정</h2>

<form method="post" action="/teacher/profile/edit">
    <p>이름: ${teacher.name}</p>
    <p>생년월일: ${teacher.birth}</p>
    <p>최종학력: ${teacher.lastEducation}</p>
    <p>이력: ${teacher.personalHistory}</p>
    <p>전화번호: <input type="text" name="phone" value="${teacher.phone}" /></p>
    <p>주소: <input type="text" name="address" value="${teacher.address}" /></p>

    <hr>
    <p>현재 비밀번호: <input type="password" name="currentPassword" /></p>
    <p>새 비밀번호: <input type="password" name="newPassword" /></p>
    <p>새 비밀번호 확인: <input type="password" name="confirmPassword" /></p>

    <button type="submit">수정하기</button>
    <button type="button" onclick="history.back()">뒤로가기</button>
</form>

</body>
</html>
