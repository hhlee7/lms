package com.example.afterSchoolLms.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClient;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class SlackNotifier {

	// Slack Webhook 호출을 위한 HTTP 클라이언트
	private final RestClient restClient;

	// application.properties에 정의된 Slack Webhook URL
	private final String webhookUrl;

	// 생성자 주입
	// RestClient.Builder는 Spring이 제공하는 HTTP 클라이언트 생성기
	// @Value를 통해 application.properties에 있는 webhook URL을 주입받음
	public SlackNotifier(RestClient.Builder restClientBuilder, @Value("${slack.webhook.url}") String webhookUrl) {
		// RestClient 객체 생성
		this.restClient = restClientBuilder.build();
		// Slack Webhook URL 저장
		this.webhookUrl = webhookUrl;
	}

	// 환불 실패 시 Slack으로 알림을 보내는 메서드
	public void notifyRefundFailure(int enrollmentId, String exceptionMessage) {

		// 현재 시간을 Slack 메시지에 넣기 위해 생성
		String now = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

		// Slack으로 전송할 메시지 문자열 구성
		// Java text block을 사용해 여러 줄 메시지 생성
		String text = """
				[EDUCATION LMS 환불 처리 실패]
				enrollmentId: %d
				예외: %s
				시간: %s
				""".formatted(enrollmentId, exceptionMessage, now);

		// Slack Webhook API는 JSON 형식으로 text 필드를 받음
		// ex) {"text": "메시지"}
		Map<String, String> payload = Map.of("text", text);

		try {
			// Slack Webhook으로 HTTP POST 요청 전송
			restClient.post() // POST 요청
					.uri(webhookUrl) // Slack Webhook URL
					.contentType(MediaType.APPLICATION_JSON) // JSON 요청
					.body(payload) // 요청 body
					.retrieve() // 요청 실행
					.toBodilessEntity(); // 응답 body는 필요 없으므로 무시

			// Slack 전송 성공 로그
			log.info("Slack 환불 실패 알림 전송 완료 - enrollmentId={}", enrollmentId);

		} catch (Exception e) {
			// Slack 전송 실패가 원래 환불 예외를 덮지 않도록 여기서만 로그 처리
			// 운영 알림 실패가 비즈니스 로직에 영향을 주지 않도록 분리
			log.error("Slack 알림 전송 실패 - enrollmentId={}", enrollmentId, e);
		}
	}
}