package com.assignment02.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dto.RecruitmentDTO;
import com.assignment02.dto.UserDTO;
import com.assignment02.service.RecruitmentService;
import com.assignment02.service.UserService;

@Controller
public class Search {
	@Autowired
	private RecruitmentService recruitmentService;
	@Autowired
	private UserService userService;

	@RequestMapping("/recruitment/search")
	public String recruitmentSearch(@RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "2") int size, Model model,
			@RequestParam(value = "keySearch", required = false) String title,
			@AuthenticationPrincipal MyUserDetails currentUser, HttpSession session) {
		if (title == null) {
			title = (String) session.getAttribute("lastSearchKey");
		} else {
			session.setAttribute("lastSearchKey", title);
		}
		Pageable pageable = PageRequest.of(page, size);
		Page<RecruitmentDTO> recruitmentPage = recruitmentService.getRecruitmentsDTOByTitle(title, pageable);
		if (page >= recruitmentPage.getTotalPages()) {
			System.out.println(recruitmentPage.getTotalPages());
			page = recruitmentPage.getTotalPages() > 0 ? recruitmentPage.getTotalPages() - 1 : 0;
			pageable = PageRequest.of(page, size);
			recruitmentPage = recruitmentService.getRecruitmentsDTOByTitle(title, pageable);
		}
//		System.out.println(recruitmentPage.getContent());
		if (currentUser != null) {
			String email = currentUser.getUsername();
			UserDTO userDTO = userService.getUserDTOByEmail(email);
			model.addAttribute("user", userDTO);
		}
		model.addAttribute("list", recruitmentPage);
		model.addAttribute("keySearch", title);
		model.addAttribute("numberPage", page);

		return "result-search";
	}

	@RequestMapping("/company/search")
	public String companySearch(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "2") int size,
			Model model, @RequestParam(value = "keySearch", required = false) String nameCompany,
			@AuthenticationPrincipal MyUserDetails currentUser, HttpSession session) {
		if (nameCompany == null) {
			nameCompany = (String) session.getAttribute("lastSearchKey");
		} else {
			session.setAttribute("lastSearchKey", nameCompany);
		}
		Pageable pageable = PageRequest.of(page, size);
		Page<RecruitmentDTO> recruitmentPage = recruitmentService.getRecruitmentsDTOByNameCompany(nameCompany,
				pageable);
		if (page >= recruitmentPage.getTotalPages()) {
			System.out.println(recruitmentPage.getTotalPages());
			page = recruitmentPage.getTotalPages() > 0 ? recruitmentPage.getTotalPages() - 1 : 0;
			pageable = PageRequest.of(page, size);
			recruitmentPage = recruitmentService.getRecruitmentsDTOByNameCompany(nameCompany, pageable);
		}
//		System.out.println(recruitmentPage.getContent());
		if (currentUser != null) {
			String email = currentUser.getUsername();
			UserDTO userDTO = userService.getUserDTOByEmail(email);
			model.addAttribute("user", userDTO);
		}

		model.addAttribute("list", recruitmentPage);
		model.addAttribute("keySearch", nameCompany);
		model.addAttribute("numberPage", page);
		return "result-search-company";
	}

	@RequestMapping("/recruitment/searchaddress")
	public String searchAddress(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "2") int size,
			Model model, @RequestParam(value = "keySearch", required = false) String address,
			@AuthenticationPrincipal MyUserDetails currentUser, HttpSession session) {
		if (address == null) {
			address = (String) session.getAttribute("lastSearchKey");
		} else {
			session.setAttribute("lastSearchKey", address);
		}
		Pageable pageable = PageRequest.of(page, size);
		Page<RecruitmentDTO> recruitmentPage = recruitmentService.getRecruitmentsDTOByAddress(address, pageable);
		if (page >= recruitmentPage.getTotalPages()) {
			System.out.println(recruitmentPage.getTotalPages());
			page = recruitmentPage.getTotalPages() > 0 ? recruitmentPage.getTotalPages() - 1 : 0;
			pageable = PageRequest.of(page, size);
			recruitmentPage = recruitmentService.getRecruitmentsDTOByAddress(address, pageable);
		}
//		System.out.println(recruitmentPage.getContent());
		if (currentUser != null) {
			String email = currentUser.getUsername();
			UserDTO userDTO = userService.getUserDTOByEmail(email);
			model.addAttribute("user", userDTO);
		}
		model.addAttribute("list", recruitmentPage);
		model.addAttribute("keySearch", address);
		model.addAttribute("numberPage", page);
		return "result-search-address";
	}

}
