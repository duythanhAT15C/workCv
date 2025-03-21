package com.assignment02.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dto.UserDTO;
import com.assignment02.service.UserService;

@Controller
@RequestMapping("/auth")
public class LoginAndRegister {
	@Autowired
	private UserService userService;

//	@PostMapping("/")
//	public String login(@RequestParam("email") String email, @RequestParam("password") String password,
//			RedirectAttributes redirectAttributes, HttpSession session) {
//		UserDTO userDTO = userService.getUser(email, password);
//		if (userDTO == null || userDTO.getStatus() == 0) {
//			redirectAttributes.addAttribute("error", "true");
//			return "redirect:/login/";
//		}
//		session.setAttribute("user", userDTO);
//		return "redirect:/home/";
//	}

	@GetMapping("/register")
	public String showAddForm(Model model) {
		System.out.println("Xin chào");
		model.addAttribute("addUser", new UserDTO());
		return "/register";
	}

	@PostMapping("/register")
	public String addUser(@ModelAttribute("addUser") UserDTO userDTO, RedirectAttributes redirectAttributes, @AuthenticationPrincipal MyUserDetails currentUser) {
	    if (!userDTO.getPassword().equals(userDTO.getRePassword())) {
	    	redirectAttributes.addFlashAttribute("addUserFalse", "Mật khẩu không khớp");

	    }
	    else {
	    	// Nếu mật khẩu khớp, lưu người dùng
		    userDTO.setStatus(0);
		    userService.saveUser(userDTO, currentUser);
		    redirectAttributes.addFlashAttribute("addUserSuccess", "Đăng ký thành công");
		}
	    return "redirect:/showMyLoginPage";
	}

//	@GetMapping("/logout")
//	public String logout(HttpSession session) {
//		session.invalidate();
//		return "home";
//	}
}
