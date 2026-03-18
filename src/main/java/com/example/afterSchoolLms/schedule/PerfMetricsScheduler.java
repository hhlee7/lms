package com.example.afterSchoolLms.schedule;

import com.example.afterSchoolLms.service.PerfMetricsService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
@Slf4j
public class PerfMetricsScheduler {
    private final PerfMetricsService perfMetricsService;

    // 0.5초마다 현재 메트릭을 읽어서 최대값 갱신
    @Scheduled(fixedRate = 500)
    public void collectMetrics() {
        perfMetricsService.sampleAndUpdateMax();
    }
}
