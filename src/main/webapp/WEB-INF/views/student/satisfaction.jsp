<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수업 만족도 평가 페이지</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<hr>
	<c:forEach var="lecture" items="${lectureDoneList}">
		<div>
			<p>과목명: ${lecture.subjectName}</p>
            <p>강사명: ${lecture.teacherName}</p>
            <p>요일: ${lecture.dayOfWeek}</p>
            <p>시간: ${lecture.startTime} ~ ${lecture.endTime}</p>
            <p>강의실: ${lecture.classroomName}</p>
            <p>위치: ${lecture.classroomLocation}</p>
            <p>수업 기간: ${lecture.startDate} ~ ${lecture.endDate}</p>

 			<c:choose>
            	<c:when test="${lecture.isEvaluated == 1}">
                	<span>만족도 평가 완료</span>
            	</c:when>
            	<c:otherwise>
                	<a href="/student/evaluation?paymentId=${lecture.paymentId}&subjectName=${lecture.subjectName}">만족도 평가</a>
            	</c:otherwise>
       		</c:choose>
        
        	&nbsp;&nbsp;

        	<c:choose>
			    <c:when test="${lecture.isEvaluated == 1}">
			        <c:choose>
			            <c:when test="${not empty lecture.review_id}">
			                <span>리뷰 작성 완료</span>
			            </c:when>
			            <c:otherwise>
			                <a href="">리뷰 작성</a>
			            </c:otherwise>
			        </c:choose>
			    </c:when>
			    <c:otherwise>
			        <!-- 만족도 평가 전이면 리뷰는 비활성 또는 안내 -->
			        <span style="color:gray;">리뷰 작성 불가</span>
			    </c:otherwise>
			</c:choose>
	        
	        &nbsp;&nbsp;&nbsp;&nbsp;
	        
	        <c:if test="${lecture.isEvaluated == 1}">
			    <a href="">내 작성내역 보기</a>
			</c:if>

	        <hr>
			</div>
		</c:forEach>
</body>
</html>