<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기사 개인정보 수정 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f3f6fb;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 700px;
        margin: 40px auto;
        padding: 30px;
        background-color: #fff;
        border-radius: 12px;
        box-shadow: 0 6px 12px rgba(0,0,0,0.1);
    }

    h2 {
        text-align: center;
        margin-bottom: 30px;
        color: #333;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        font-weight: bold;
        margin-bottom: 6px;
        color: #333;
    }

    .form-group input[type="text"],
    .form-group input[type="password"],
    .form-group input[type="button"],
    .form-group input[type="hidden"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 6px;
        box-sizing: border-box;
    }

    .form-group input[readonly] {
        background-color: #f9f9f9;
        color: #666;
    }

    .form-group span#guide {
        font-size: 12px;
        margin-top: 5px;
        display: block;
    }

    .form-actions {
        text-align: center;
        margin-top: 30px;
    }

    #updateBtn {
        padding: 12px 24px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    #updateBtn:hover {
        background-color: #45a049;
    }

    .readonly-info {
        background-color: #f0f0f0;
        padding: 8px 12px;
        border-radius: 6px;
        color: #333;
    }

</style>
<script>
$(function() {
	$("#updateBtn").click(function() {
		const postcode = $('#postcode').val();
		const roadAddress = $('#roadAddress').val();
		const jibunAddress = $('#jibunAddress').val();
		const detailAddress = $('#detailAddress').val();
		const extraAddress = $('#extraAddress').val();

		let address = '';
		
	    // 주소 입력이 된 경우
	    if (postcode || roadAddress || jibunAddress || detailAddress || extraAddress) {
	        address = postcode + " " + roadAddress + " " + jibunAddress + " " + detailAddress + " " + extraAddress;
	    } else {
	        // 주소 입력 안 했으면 기존 주소 그대로 사용
	        address = "${user.address}";
	    }
	    $('#fullAddress').val(address);
		
		// 이메일 유효성 검사
		const email = $('#email').val();
		const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		if (!emailPattern.test(email)) {
			alert('잘못된 이메일 형식입니다. @와 .을 포함해 주세요.');
			return;
		}

		// 전화번호 유효성 검사 (000-0000-0000 or 000-1111-1111 등)
		const phone = $('#phone').val();
		const phonePattern = /^\d{3}-\d{3,4}-\d{4}$/;
		if (!phonePattern.test(phone)) {
			alert('잘못된 전화번호 형식입니다. 예: 010-1234-5678');
			return;
		}
		
		if ($('#password').val() == '') {
			alert('비밀번호를 입력해주세요');
			return;
		}
		
		$.ajax({
			url:"/checkPw/" + $('#userId').val() + "/" + $('#password').val()
			, type: 'get'
			, success: function(data) {
				if (data == true) {
					$('#updateForm').submit();
				} else {
					alert('현재 비밀번호가 틀렸습니다.');
					$('#password').val('');
				}
			}
		});
	});
});
</script>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
	    <h2>✏️ 개인정보 수정</h2>
	    <form id="updateForm" method="post" action="/driver/updateInformation">
	        <input type="hidden" value="${user.userId}" id="userId" name="userId"> 

	        <div class="form-group">
	            <label>이름</label>
	            <div class="readonly-info">${user.userName}</div>
	        </div>

	        <div class="form-group">
	            <label>생년월일</label>
	            <div class="readonly-info">${user.birth}</div>
	        </div>

	        <div class="form-group">
	            <label for="email">이메일</label>
	            <input type="text" id="email" name="email" value="${user.email}">
	        </div>

	        <div class="form-group">
	            <label>주소</label>
	            <div class="readonly-info">${user.address}</div>
	            <input type="text" name="postcode" id="postcode" placeholder="우편번호">
	            <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br><br>
	            <input type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소">
	            <input type="text" name="jibunAddress" id="jibunAddress" placeholder="지번주소">
	            <input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
	            <input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목">
	            <input type="hidden" name="address" id="fullAddress">
	            <span id="guide"></span>
	        </div>

	        <div class="form-group">
	            <label for="phone">전화번호</label>
	            <input type="text" id="phone" name="phone" value="${user.phone}">
	        </div>

	        <div class="form-group">
	            <label for="password">현재 비밀번호</label>
	            <input type="password" id="password" name="password">
	        </div>

	        <div class="form-actions">
	            <button type="button" id="updateBtn">개인정보 수정</button>
	        </div>
	    </form>
	</div>
	
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