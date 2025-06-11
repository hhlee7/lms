<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>📦 교보재 요청</title></head>
<body>

<h2>교보재 요청</h2>

<form method="post" action="/teacher/material/request">
    <p>수업 선택:
        <select name="lectureId" required>
            <option disabled selected>수업을 선택하세요</option>
            <c:forEach var="lec" items="${lectureList}">
                <option value="${lec.lectureId}">
                    ${lec.subjectName} - ${lec.dayOfWeek} ${lec.startTime}
                </option>
            </c:forEach>
        </select>
    </p>
    <p>요청 내용:<br>
        <textarea name="content" rows="4" cols="50" required></textarea>
    </p>
    <button type="submit">요청하기</button>
    <button type="button" onclick="history.back()">뒤로가기</button>
</form>

</body>
</html>
