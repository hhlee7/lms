package com.example.afterSchoolLms.filter;

import java.io.IOException;

import com.example.afterSchoolLms.dto.User;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebFilter("/student/*")
public class StudentFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		if(request instanceof HttpServletRequest) {
			HttpServletRequest httpReq = (HttpServletRequest)request;
			HttpSession session = httpReq.getSession();
			User loginUser = (User)session.getAttribute("loginUser");			
			
			if(loginUser == null) {
				if(response instanceof HttpServletResponse) {
					log.info("OnSessionFilter에 걸려서 sendRedirect /login 됨");
					((HttpServletResponse) response).sendRedirect("/");
				}
				return;
			}
			
			// 로그인은 되어있지만 ROLE이 안될때 (인가)
			if(loginUser.getRoleId() != 2) {
				if(response instanceof HttpServletResponse) {
					log.info("OnSessionFilter에 걸려서 sendRedirect /member/info 됨");
					((HttpServletResponse) response).sendRedirect("/");
					return;
				}
			}
		}
		
		chain.doFilter(request, response);
		
	}

}
