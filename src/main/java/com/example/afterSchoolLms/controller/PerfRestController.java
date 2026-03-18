package com.example.afterSchoolLms.controller;

import com.example.afterSchoolLms.service.PerfMetricsService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequiredArgsConstructor
public class PerfRestController {

    // 성능 관련 메트릭을 조회하는 서비스
    private final PerfMetricsService perfMetricsService;

    @GetMapping("/perfMetrics/paymentList")
    public Map<String, Object> getPaymentListPerfMetrics() {

        // PerfMetricsService에서 수집한 메트릭 데이터를 그대로 반환
        return perfMetricsService.getPaymentListMetrics();
    }

    @PostMapping("/perfMetrics/paymentList/reset")
    public String resetPaymentListPerfMetrics() {
        perfMetricsService.resetMetrics();
        return "paymentList metrics reset completed";
    }
}