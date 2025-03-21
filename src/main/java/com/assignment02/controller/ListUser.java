package com.assignment02.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment02.config.MyUserDetails;
import com.assignment02.entity.ApplyJob;
import com.assignment02.service.ApplyJobService;

@Controller
public class ListUser {
//	@Autowired
//	private UserService userService;
	@Autowired
	private ApplyJobService applyJobService;

	@GetMapping("/listUser")
	public String listUser(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "2") int size,
			Model model, @AuthenticationPrincipal MyUserDetails currentDetails) {
//		String email = currentDetails.getUsername();
//		User user = userService.getUserByEmail(email);
		Pageable pageable = PageRequest.of(page, size);
		Page<ApplyJob> applyJobPage = applyJobService.getAllApplyJobByStatus(1, pageable);
		System.out.println(applyJobPage.isEmpty());
		// Kiểm tra nếu số trang vượt quá giới hạn
		if (page >= applyJobPage.getTotalPages()) {
			System.out.println(applyJobPage.getTotalPages());
			page = applyJobPage.getTotalPages() > 0 ? applyJobPage.getTotalPages() - 1 : 0;
			pageable = PageRequest.of(page, size);
			applyJobPage = applyJobService.getAllApplyJobByStatus(1, pageable);
		}
		System.out.println(applyJobPage.isEmpty());
		model.addAttribute("list", applyJobPage);
		model.addAttribute("numberPage", page);
		return "list-user";
	}
}
