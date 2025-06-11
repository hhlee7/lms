<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>출결 상태</h1>
	
	<c:if test="${not empty attendance}">
        <table border="1">
            <tr>
                <th>날짜</th>
                <th>출결 상태</th>
            </tr>
            <c:forEach var="att" items="${attendance}">
                <tr>
                    <td>${fn:substring(att.attendDate, 0, 10)}</td>
                    <td>${att.status}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${empty attendance}">
        <p>출결 정보가 없습니다.</p>
    </c:if>
</body>
</html>