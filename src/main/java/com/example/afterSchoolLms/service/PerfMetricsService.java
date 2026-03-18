package com.example.afterSchoolLms.service;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;

import org.springframework.stereotype.Service;

import com.example.afterSchoolLms.dto.MetricDto;

import io.micrometer.core.instrument.Gauge;
import io.micrometer.core.instrument.MeterRegistry;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PerfMetricsService {

    // Micrometer를 통해 Tomcat, HikariCP 등의 메트릭을 조회하기 위한 객체
    private final MeterRegistry meterRegistry;

    // 테스트 중 최대값 저장용
    private final AtomicReference<Double> maxTomcatBusyThreads = new AtomicReference<>(0.0);
    private final AtomicReference<Double> maxDbActiveConnections = new AtomicReference<>(0.0);
    private final AtomicReference<Double> maxTomcatCurrentThreads = new AtomicReference<>(0.0);

    // 1초마다 현재 메트릭 값을 읽어 최대값을 갱신 - 스케줄러에서 호출되는 메서드
    public void sampleAndUpdateMax() {
        // 현재 시점의 메트릭 값 조회
        double tomcatBusyThreads = gaugeValue("tomcat.threads.busy");
        double tomcatCurrentThreads = gaugeValue("tomcat.threads.current");
        double dbActiveConnections = gaugeValue("hikaricp.connections.active");

        // 현재값과 기존 max를 비교하여 더 큰 값으로 갱신
        updateMax(maxTomcatBusyThreads, tomcatBusyThreads);
        updateMax(maxTomcatCurrentThreads, tomcatCurrentThreads);
        updateMax(maxDbActiveConnections, dbActiveConnections);
    }

    // API 응답용 메서드 - 현재값 + 테스트 중 최대값 함께 반환
    public Map<String, Object> getPaymentListMetrics() {
        Map<String, Object> result = new LinkedHashMap<>();

        // 현재 시점의 메트릭 값 조회
        double tomcatBusyThreads = gaugeValue("tomcat.threads.busy");
        double tomcatCurrentThreads = gaugeValue("tomcat.threads.current");
        double dbActiveConnections = gaugeValue("hikaricp.connections.active");
        double dbMaxConnections = gaugeValue("hikaricp.connections.max");

        // Tomcat busy 스레드
        result.put("tomcatBusyThreads", new MetricDto(tomcatBusyThreads, maxTomcatBusyThreads.get(), "현재 사용중인 Tomcat 요청 스레드 수"));

        // Tomcat current 스레드
        result.put("tomcatCurrentThreads", new MetricDto(tomcatCurrentThreads, maxTomcatCurrentThreads.get(), "현재 생성된 Tomcat 요청 스레드 수"));

        // DB 활성 커넥션
        result.put("dbActiveConnections", new MetricDto(dbActiveConnections, maxDbActiveConnections.get(), "현재 사용중인 DB 커넥션 수"));

        // DB 최대 커넥션 (max는 설정값 - current = max)
        result.put("dbMaxConnections", new MetricDto(dbMaxConnections, dbMaxConnections, "DB 커넥션 풀 최대 크기"));

        return result;
    }

    // 테스트 시작 전 최대값 초기화
    public void resetMetrics() {
        maxTomcatBusyThreads.set(0.0);
        maxTomcatCurrentThreads.set(0.0);
        maxDbActiveConnections.set(0.0);
    }

    // 최대값 갱신 로직
    private void updateMax(AtomicReference<Double> target, double currentValue) {
        if (currentValue < 0) {
            return; // 메트릭이 없을 때 -1 반환 - max 반영 제외
        }
        
        // 기존 값과 현재 값을 비교하여 더 큰 값으로 갱신
        target.accumulateAndGet(currentValue, Math::max);
    }

    // MeterRegistry에서 Gauge값 조회
    private double gaugeValue(String metricName) {
        // 해당 이름의 Gauge 타입 메트릭 조회
        Gauge gauge = meterRegistry.find(metricName).gauge();
        
        // 메트릭이 존재하면 값 반환, 없으면 -1 반환
        return gauge != null ? gauge.value() : -1;
    }
}