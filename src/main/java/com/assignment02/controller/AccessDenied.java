package com.assignment02.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AccessDenied {
	// Phương thức xử lý yêu cầu GET tới URL "/access-denied"
	@GetMapping("/access-denied")
	public String accessDenied(HttpSession session, Model model) {
		// Lấy giá trị thuộc tính "confirm_error" từ session nếu có
		model.addAttribute("confirm_error", session.getAttribute("confirm_error"));
		model.addAttribute("emptyEmail", session.getAttribute("emptyEmail"));
		// Xóa thuộc tính "confirm_error" khỏi session sau khi đã lấy
		session.removeAttribute("confirm_error");
		session.removeAttribute("emptyEmail");
		// Trả về tên của view "access-denied", tương ứng với trang HTML sẽ được hiển thị
		return "access-denied";
	}
}
