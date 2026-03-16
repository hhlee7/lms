package com.example.afterSchoolLms.event;

import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import com.example.afterSchoolLms.service.SlackNotifier;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@RequiredArgsConstructor
public class RefundFailureEventListener {

	// Slack Webhook 전송을 담당하는 컴포넌트
	// 실제 Slack 메시지 전송 로직은 SlackNotifier에 있음
	private final SlackNotifier slackNotifier;

	@Async // 이 메서드를 별도의 스레드에서 비동기로 실행(Tomcat 요청 스레드를 점유하지 않도록 하기 위함)
	@EventListener // Spring Event 시스템에서 RefundFailureEvent가 발행되면 이 메서드가 자동으로 실행됨
	public void handleRefundFailureEvent(RefundFailureEvent event) {

		// 이벤트 수신 로그 - 어떤 enrollmentId에서 문제가 발생했는지 기록
		log.info("환불 실패 이벤트 수신 - enrollmentId={}", event.getEnrollmentId());

		// SlackNotifier를 호출하여 실제 Slack Webhook 메시지 전송
		slackNotifier.notifyRefundFailure(event.getEnrollmentId(), event.getErrorMessage()
		);
	}
}