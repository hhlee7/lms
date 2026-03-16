package com.example.afterSchoolLms.exception;

import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.afterSchoolLms.event.RefundFailureEvent;
import com.example.afterSchoolLms.service.SlackNotifier;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@ControllerAdvice(annotations = Controller.class)
// 모든 @Controller에서 발생하는 예외를 전역적으로 처리하는 클래스
// annotations = Controller.class : @Controller가 붙은 클래스에서 발생한 예외만 처리
@RequiredArgsConstructor // final 필드를 사용하는 생성자를 자동 생성 (의존성 주입용)
public class GlobalExceptionHandler {

	// 이벤트 발행 객체
	private final ApplicationEventPublisher eventPublisher;

	// RefundProcessException 예외가 발생했을 때 실행되는 예외 처리 메서드
	@ExceptionHandler(RefundProcessException.class)
	public String handleRefundProcessException(
			RefundProcessException e, // 발생한 예외 객체
			RedirectAttributes redirectAttributes // redirect 시 메시지를 전달하기 위한 객체
	) {
		// 환불 실패 로그 기록
		// e를 같이 넘기면 stack trace까지 함께 기록
		log.error("환불 처리 실패 - enrollmentId={}", e.getEnrollmentId(), e);

		// Slack 직접 호출 대신 이벤트 발행
		eventPublisher.publishEvent(new RefundFailureEvent(e.getEnrollmentId(), e.getMessage()));
		
		redirectAttributes.addFlashAttribute("msg", "환불 처리 중 오류가 발생했습니다.");

		// 관리자 환불 목록 페이지로 redirect
		return "redirect:/admin/refundList";
	}
}