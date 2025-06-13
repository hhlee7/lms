package com.example.afterSchoolLms.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	// 서버 정적 리소스 매핑
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // /upload/**로 요청이 오면 C:/project/albumUpload/에서 파일을 찾는다
        registry.addResourceHandler("/upload/**")
                .addResourceLocations("file:///C:/project/albumUpload/");
    }
}