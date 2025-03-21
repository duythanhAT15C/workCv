package com.assignment02.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dto.RecruitmentDTO;
import com.assignment02.dto.UserDTO;
import com.assignment02.service.RecruitmentService;
import com.assignment02.service.UserService;

@Controller
public class ListJob {

	// Inject các dịch vụ cần thiết
	@Autowired
	private RecruitmentService recruitmentService;
	@Autowired
	private UserService userService;

	// Phương thức xử lý yêu cầu GET cho trang danh sách việc làm
	@GetMapping("/listjob")
	public String listJob(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "2") int size,
			Model model, @AuthenticationPrincipal MyUserDetails currentUser) {

		// Tạo đối tượng Pageable để phân trang
		Pageable pageable = PageRequest.of(page, size);
		String title = null, type = null, address = null;

		// Lấy danh sách việc làm từ dịch vụ với các thông tin tìm kiếm
		Page<RecruitmentDTO> recruitmentPage = recruitmentService.searchRecruitments(title, type, address, pageable);

		// Nếu trang yêu cầu vượt quá tổng số trang, điều chỉnh lại trang
		if (page >= recruitmentPage.getTotalPages()) {
			System.out.println(recruitmentPage.getTotalPages());
			page = recruitmentPage.getTotalPages() > 0 ? recruitmentPage.getTotalPages() - 1 : 0;
			pageable = PageRequest.of(page, size);
			recruitmentPage = recruitmentService.searchRecruitments(title, type, address, pageable);
		}

		// Thêm danh sách việc làm vào model
		model.addAttribute("list", recruitmentPage);
		model.addAttribute("numberPage", page);

		// Nếu người dùng đã đăng nhập, thêm thông tin người dùng vào model
		if (currentUser != null) {
			String email = currentUser.getUsername();
			UserDTO userDTO = userService.getUserDTOByEmail(email);
			model.addAttribute("user", userDTO);
		}

		// Thêm thông tin tìm kiếm vào model
		model.addAttribute("title", title);
		model.addAttribute("type", type);
		model.addAttribute("address", address);

		// Trả về tên của view JSP
		return "listJob";
	}

	// Phương thức xử lý tìm kiếm việc làm
	@RequestMapping("/listjob/recruitment")
	public String searchRecruitment(@RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "2") int size, Model model,
			@RequestParam(value = "title", defaultValue = "") String title,
			@RequestParam(value = "type", defaultValue = "") String type,
			@RequestParam(value = "address", defaultValue = "") String address,
			@AuthenticationPrincipal MyUserDetails currentUser) {

		// Tạo đối tượng Pageable để phân trang
		Pageable pageable = PageRequest.of(page, size);

		// Lấy danh sách việc làm từ dịch vụ với các tiêu chí tìm kiếm
		Page<RecruitmentDTO> recruitmentPage = recruitmentService.searchRecruitments(title, type, address, pageable);

		// Nếu trang yêu cầu vượt quá tổng số trang, điều chỉnh lại trang
		if (page >= recruitmentPage.getTotalPages()) {
			System.out.println(recruitmentPage.getTotalPages());
			page = recruitmentPage.getTotalPages() > 0 ? recruitmentPage.getTotalPages() - 1 : 0;
			pageable = PageRequest.of(page, size);
			recruitmentPage = recruitmentService.searchRecruitments(title, type, address, pageable);
		}

		// Thêm danh sách việc làm vào model
		model.addAttribute("list", recruitmentPage);
		model.addAttribute("numberPage", page);

		// Nếu người dùng đã đăng nhập, thêm thông tin người dùng vào model
		if (currentUser != null) {
			String email = currentUser.getUsername();
			UserDTO userDTO = userService.getUserDTOByEmail(email);
			model.addAttribute("user", userDTO);
		}

		// Thêm các thông tin tìm kiếm vào model để hiển thị lại trên form tìm kiếm
		model.addAttribute("title", title);
		model.addAttribute("type", type);
		model.addAttribute("address", address);

		// Trả về tên của view JSP
		return "listJob";
	}
}
