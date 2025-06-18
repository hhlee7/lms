package com.example.afterSchoolLms.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.example.afterSchoolLms.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class AdminSidebarInterceptor implements HandlerInterceptor {

    private final AdminService adminService;

    public AdminSidebarInterceptor(AdminService adminService) {
        this.adminService = adminService;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response,
                           Object handler, ModelAndView modelAndView) throws Exception {

        if (modelAndView != null && request.getRequestURI().startsWith("/admin")) {
            int qnaCount = adminService.qnaCount();
            modelAndView.addObject("qnaCount", qnaCount);
        }
    }
}