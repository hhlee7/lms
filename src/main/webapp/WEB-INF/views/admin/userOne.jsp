<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원 정보</title>
<!-- jQuery CDN (페이지에 없으면 추가) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function () {		
		// 수정 버튼 눌렀음
		$('#modifyBtn').click(function(){
			const postcode = $('#postcode').val();
			const roadAddress = $('#roadAddress').val();
			const jibunAddress = $('#jibunAddress').val();
			const detailAddress = $('#detailAddress').val();
			const extraAddress = $('#extraAddress').val();

			const address = postcode + " " + roadAddress + " " + jibunAddress + " " + detailAddress + " " + extraAddress;

			// hidden input에 넣기
			$('#fullAddress').val(address);

			// 폼 제출
			$('#user').submit();
		});
	});
</script>
</head>
<body>
	<h1>관리자 회원 정보 페이지</h1>
	<h3>${selectedUser.userName}님의 정보</h3>
	<form action="userOne" method="post" name="user" id="user">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" id="userId" name="userId" value="${selectedUser.userId}" readonly></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="userName" name="userName" value="${selectedUser.userName}"></td>
			</tr>
			<tr>
				<td>역할</td>
				<td>
				<select name="roleId" id="roleId">
					<c:forEach var="role" items="${roleList}">
						<option value="${role.roleId}"
							<c:if test="${role.roleId == selectedUser.roleId}">selected</c:if>>
							${role.roleName}
						</option>
					</c:forEach>
				</select>
			</td>
			</tr>
			<tr>
				<td>email</td>
				<td><input type="text" id="email" name="email" value="${selectedUser.email}"></td>
			</tr>
			
			<tr>
				<td>전화번호</td>
				<td><input type="text" id="phone" name="phone" value="${selectedUser.phone}"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					${selectedUser.address}
					<br>
					<input type="text" 		name="postcode" id="postcode" placeholder="우편번호">
					<input type="button" onclick="execDaumPostcode()" value="주소 수정"><br>
					<input type="text"		name="roadAddress" id="roadAddress" placeholder="도로명주소">
					<input type="text"		name="jibunAddress" id="jibunAddress" placeholder="지번주소">
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text"		name="detailAddress" id="detailAddress" placeholder="상세주소">
					<input type="text"		name="extraAddress" id="extraAddress" placeholder="참고항목">
					<input type="hidden" name="address" id="fullAddress" />
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" id="birth" name="birth" value="${selectedUser.birth}"></td>
			</tr>
		</table>
		<button type="button" id="modifyBtn" name="modifyBtn">수정</button>
	</form>
	
	<!-- 강사 정보이면서, 수업 데이터를 출력 -->
	<c:if test="${lectureList != null}">
		<h3>강사 경력</h3>
		<a href="historyInsert?userId=${selectedUser.userId}">경력 등록</a>
		<c:forEach var="his" items="${historyList}">
			<table border="1">
				<tr>
					<th>최종 학력</th>
					<th>수상/경력</th>			
				</tr>
				<tr>
					<td>${his.lastEducation}</td>
					<td>${his.personalHistory}</td>
				</tr>
			</table>
		</c:forEach>
		
		<h3>수업 정보</h3>
		<a href="lectureInsert?userId=${selectedUser.userId}">수업 등록</a>
		<c:forEach var="lec" items="${lectureList}">
			<table border="1">
				<tr>
					<th>과목</th>
					<th>강사</th>
					<th>요일</th>
					<th>시간</th>
					<th>강의실</th>
					<th>개강일</th>
					<th>종강일</th>	
					<th>정정</th>					
				</tr>
				<tr>
					<td>${lec.subjectName}</td>
					<td>${selectedUser.userName}</td>
					<td>${lec.dayOfWeek}</td>
					<td>${lec.startTime} - ${lec.endTime}</td>
					<td>${lec.classroomName}</td>
					<td>${lec.startDate}</td>
					<td>${lec.endDate}</td>
					<td><a href="">수정</a></td>
				</tr>
			</table>
		</c:forEach>
	</c:if>
	
	<!-- 자녀 정보이면서, 학부모 데이터를 출력 -->
	<c:if test="${parentUser != null}">
	<h3>학부모 정보</h3>
		<!-- 학부모 데이터를 forEach문으로 출력 -->
		<c:forEach var="parent" items="${parentUser}">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>${parent.userId}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${parent.userName}</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>${parent.phone}</td>
				</tr>
			</table>
			<br>
		</c:forEach>	
	</c:if>
	
	<!-- 학부모 정보이면서, 자녀 학생 데이터를 출력 -->
	<c:if test="${studentUser != null}">
	<h3>자녀 정보</h3>
		<!-- 자녀가 여러명일수 있으니 forEach문으로 출력 -->
		<c:forEach var="student" items="${studentUser}">
		
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>${student.userId}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${student.userName}</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>${student.phone}</td>
				</tr>
			</table>
		
		</c:forEach>	
	</c:if>
	
	<!-- 기사 정보이면서, 차량 데이터를 출력 -->
	<c:if test="${vehicleList != null}">
	<h3>수업 정보</h3>
	<a href="vehicleInsert?userId=${selectedUser.userId}">차량 등록</a>
		<c:forEach var="vec" items="${vehicleList}">
			<table border="1">
				<tr>
					<th>차량번호</th>
					<th>운전자</th>
					<th>요일</th>
					<th>탑승 시간</th>
					<th>인원</th>
					<th>정정</th>					
				</tr>
				<tr>
					<td>${vec.vehicleNo}</td>
					<td>${selectedUser.userName}</td>
					<td>${vec.dayOfWeek}</td>
					<td>${vec.endTime}</td>
					<td>${vec.capacity}</td>
					<td><a href="">수정</a></td>
				</tr>
			</table>
			<br>
		</c:forEach>
	</c:if>
	
	<a href="userManagement">뒤로</a>
	
	
	<!-- 카카오 주소API 호출을 위한 CDN주소 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("roadAddress").value = roadAddr;
	                document.getElementById("jibunAddress").value = data.jibunAddress;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                    document.getElementById("extraAddress").value = extraRoadAddr;
	                } else {
	                    document.getElementById("extraAddress").value = '';
	                }
	
	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';
	
	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	    }
	</script>
</body>
</html>