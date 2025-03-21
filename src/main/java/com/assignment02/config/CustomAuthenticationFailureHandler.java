package com.assignment02.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;
@Component
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// Lấy thông báo lỗi từ exception (ví dụ: Bad credentials)
        String errorMessage = "Đăng nhập thất bại! Vui lòng kiểm tra lại tên đăng nhập và mật khẩu.";
        
        // Chuyển thông báo lỗi vào RedirectAttributes hoặc Model
        request.setAttribute("loginFalse", errorMessage);

        // Chuyển hướng về trang login và truyền thông báo lỗi
        response.sendRedirect("/showMyLoginPage?error=true");

	}

}
