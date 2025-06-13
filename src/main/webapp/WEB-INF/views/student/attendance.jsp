<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출결 조회</title>
<style>
    table {
        width: 90%;
        margin: 30px auto;
        border-collapse: collapse;
        text-align: center;
        table-layout: fixed; /* 셀 너비 균일하게 고정 */
    }

    th, td {
        padding: 10px;
        border: 1px solid #ccc;
        height: 80px;                /* 고정 높이로 셀 크기 일정하게 */
        width: calc(100% / 7);       /* 7열 기준 균등 너비 */
        vertical-align: top;         /* 내용이 위쪽 정렬되도록 */
        box-sizing: border-box;      /* 패딩 포함한 고정 크기 유지 */
    }

    th {
        background-color: #f0f0f0;
    }

    th:first-child { color: red; }     /* 일요일 */
    th:last-child { color: blue; }     /* 토요일 */

    .nav {
        display: flex;
	    justify-content: center;
	    align-items: center;
	    gap: 30px;
        margin: 5px 0 20px 0;
    }

    .nav a {
	    font-size: 24px;
	    text-decoration: none;
	    background: none;
	    color: inherit;
	    border: none;
	}

    .attendance-status {
        font-size: 0.75em;
        margin-top: 4px;
        line-height: 1.2; /* 줄 간격 축소로 높이 영향 최소화 */
        word-break: keep-all;
    }

    .status-present { color: green; }
    .status-absent { color: red; }
    .status-late { color: orange; }
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<hr>
	
	<h1 style="text-align:center;">
	    ${year}년 ${month + 1}월
	</h1>
	
	<div class="nav">
	    <c:choose>
	        <c:when test="${month == 0}">
	            <a href="?targetYear=${year - 1}&targetMonth=11">&#9664;</a>
	        </c:when>
	        <c:otherwise>
	            <a href="?targetYear=${year}&targetMonth=${month - 1}">&#9664;</a>
	        </c:otherwise>
	    </c:choose>
	
	    <c:choose>
	        <c:when test="${month == 11}">
	            <a href="?targetYear=${year + 1}&targetMonth=0">&#9654;</a>
	        </c:when>
	        <c:otherwise>
	            <a href="?targetYear=${year}&targetMonth=${month + 1}">&#9654;</a>
	        </c:otherwise>
	    </c:choose>
	</div>
	
	<table>
	    <tr>
	        <th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
	    </tr>
	    <tr>
	    <c:forEach begin="1" end="${totalCell}" var="i">
		    <c:set var="day" value="${i - startBlank}" />
		    <c:if test="${day > 0 && day <= lastDate}">
		        <c:set var="dateStr" value="${year}-${month + 1 < 10 ? '0' : ''}${month + 1}-${day < 10 ? '0' : ''}${day}" />
		    </c:if>
		
		    <c:choose>
		        <c:when test="${i % 7 == 1}"> <%-- 일요일 --%>
		            <td style="color:red;">
		        </c:when>
		        <c:when test="${i % 7 == 0}"> <%-- 토요일 --%>
		            <td style="color:blue;">
		        </c:when>
		        <c:otherwise>
		            <td>
		        </c:otherwise>
		    </c:choose>
		
		    <c:if test="${day > 0 && day <= lastDate}">
		        <div>${day}</div>
		        <c:if test="${attendanceMap[dateStr] != null}">
			        <c:set var="status" value="${attendanceMap[dateStr]['status']}" />
				    <c:set var="subject" value="${attendanceMap[dateStr]['subjectName']}" />
				    <c:set var="teacher" value="${attendanceMap[dateStr]['teacherName']}" />
		            <div class="attendance-status">
		            	<div>${subject} (${teacher})</div>
					    <c:choose>
					        <c:when test="${status == '출석'}">
					            <span class="status-present">✅ 출석</span>
					        </c:when>
					        <c:when test="${status == '결석'}">
					            <span class="status-absent">❌ 결석</span>
					        </c:when>
					        <c:when test="${status == '지각'}">
					            <span class="status-late">⚠️ 지각</span>
					        </c:when>
					        <c:otherwise>
					            ${status}
					        </c:otherwise>
					    </c:choose>
					</div>
		        </c:if>
		    </c:if>
		    </td>
		
		    <c:if test="${i % 7 == 0}"></tr><tr></c:if>
		</c:forEach>
	    </tr>
	</table>
</body>
</html>