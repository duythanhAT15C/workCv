package com.assignment02.controller;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.assignment02.config.MyUserDetails;
import com.assignment02.entity.User;

@ControllerAdvice
public class GlobalController {
//	@ModelAttribute("currentUserFullName")
//	public String currentUserFullName(Authentication authentication) {
//		if (authentication != null && authentication.isAuthenticated()) {
//			Object principal = authentication.getPrincipal();
//
//			if (principal instanceof MyUserDetails) {
//				MyUserDetails myUserDetails = (MyUserDetails) principal;
//				return myUserDetails.getFullName(); // Trả về tên đầy đủ của người dùng
//			}
//		}
//		return null; // Nếu chưa đăng nhập hoặc không thể lấy thông tin người dùng, trả về null
//	}
	
//	@ModelAttribute("currentUserUsername")
//	public String currentUserUsername(Authentication authentication) {
//	    if (authentication != null && authentication.isAuthenticated()) {
//	        Object principal = authentication.getPrincipal();
//
//	        if (principal instanceof MyUserDetails) {
//	            MyUserDetails myUserDetails = (MyUserDetails) principal;
//	            return myUserDetails.getUsername(); // Trả về tên người dùng
//	        }
//	    }
//	    return null; // Nếu chưa đăng nhập hoặc không thể lấy thông tin người dùng, trả về null
//	}
	
	// Phương thức này sẽ lấy thông tin người dùng hiện tại từ authentication và trả về đối tượng User
	@ModelAttribute("currentUser") // Đặt thuộc tính "currentUser" cho model để có thể sử dụng trong tất cả các controller
	public User currentUser(Authentication authentication) {
		// Kiểm tra nếu người dùng đã đăng nhập
	    if (authentication != null && authentication.isAuthenticated()) {
	        Object principal = authentication.getPrincipal();
	        // Kiểm tra nếu principal là đối tượng MyUserDetails
	        if (principal instanceof MyUserDetails) {
	            MyUserDetails myUserDetails = (MyUserDetails) principal;
	            return myUserDetails.getUser(); // Trả về tên người dùng
	        }
	    }
	    return null; // Nếu chưa đăng nhập hoặc không thể lấy thông tin người dùng, trả về null
	}

}
