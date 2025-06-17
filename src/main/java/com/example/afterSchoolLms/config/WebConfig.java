package com.example.afterSchoolLms.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.example.afterSchoolLms.interceptor.AdminSidebarInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Autowired private AdminSidebarInterceptor adminSidebarInterceptor;
	
	// 서버 정적 리소스 매핑
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // /upload/**로 요청이 오면 C:/project/albumUpload/에서 파일을 찾는다
        registry.addResourceHandler("/upload/**")
                .addResourceLocations("file:///C:/project/albumUpload/");
    }
    
    // 사이드바 미응답 Q&A 갯수 알람 띄우려고 추가함
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(adminSidebarInterceptor)
                .addPathPatterns("/admin/**");
    }
}