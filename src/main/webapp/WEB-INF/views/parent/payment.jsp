<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>카드 결제</title>
	<style>
		body {
			margin: 0;
			background-color: #f9f9f9;
			font-family: sans-serif;
		}
		.wrap {
			display: flex;
			justify-content: center;
			align-items: center;
		}
		.payment-form {
			background: white;
			padding: 30px 40px;
			border-radius: 10px;
			box-shadow: 0 5px 15px rgba(0,0,0,0.1);
			width: 400px;
		}
		.payment-form h2 {
			text-align: center;
			margin-bottom: 20px;
		}
		.payment-form label {
			display: block;
			margin-top: 10px;
			font-weight: bold;
		}
		.payment-form input,
		.payment-form select {
			width: 100%;
			padding: 10px;
			margin-top: 5px;
			box-sizing: border-box;
			border-radius: 5px;
			border: 1px solid #ccc;
		}
		.payment-form button {
			width: 100%;
			padding: 12px;
			background-color: #0077cc;
			color: white;
			border: none;
			margin-top: 20px;
			border-radius: 6px;
			font-size: 16px;
		}
		.payment-form button:hover {
			background-color: #005fa3;
		}
	</style>

	<script>
		document.addEventListener("DOMContentLoaded", function() {
			const form = document.getElementById("paymentForm");

			form.addEventListener("submit", function(event) {
				// 값을 읽을 때 form 내부 요소에서 정확히 접근
				const cardCompany = form.cardCompany.value.trim();
				const cardNumber = form.cardNumber.value.trim();
				const expiry = form.expiry.value.trim();
				const cvc = form.cvc.value.trim();
				const cardHolder = form.cardHolder.value.trim();

				const msg =
					"다음 정보로 결제하시겠습니까?\n\n" +
					"카드사: " + cardCompany + "\n" +
					"카드번호: " + cardNumber + "\n" +
					"유효기간: " + expiry + "\n" +
					"CVC: " + cvc + "\n" +
					"카드 소유자: " + cardHolder;

				if (!confirm(msg)) {
					event.preventDefault(); // 전송 중단
				}
			});
		});
	</script>
</head>

<body>
	<div class="wrap">
		<form class="payment-form" id="paymentForm" method="post" action="/parent/payment">
			<h2>카드 결제</h2>

			<label for="cardCompany">카드사</label>
			<select id="cardCompany" name="cardCompany" required>
				<option value="">-- 카드사를 선택하세요 --</option>
				<option value="삼성">삼성카드</option>
				<option value="신한">신한카드</option>
				<option value="국민">국민카드</option>
				<option value="현대">현대카드</option>
				<option value="하나">하나카드</option>
			</select>

			<label for="cardNumber">카드번호</label>
			<input type="text" id="cardNumber" name="cardNumber" placeholder="1234-5678-9012-3456" required>

			<label for="expiry">유효기간</label>
			<input type="text" id="expiry" name="expiry" placeholder="MM/YY" required>

			<label for="cvc">CVC</label>
			<input type="text" id="cvc" name="cvc" placeholder="123" required>

			<label for="pw">비밀번호 앞 2자리</label>
			<input type="password" id="pw" name="pw" placeholder="**" required>

			<label for="cardHolder">카드 소유자</label>
			<input type="text" id="cardHolder" name="cardHolder" placeholder="홍길동" required>

			<!-- 숨김 필드 -->
			<input type="hidden" name="lectureId" value="${lectureId}">
			<input type="hidden" name="studentId" value="${studentId}">
			<input type="hidden" name="amount" value="${amount}">

			<button type="submit">결제하기</button>
		</form>
	</div>
</body>
</html>
