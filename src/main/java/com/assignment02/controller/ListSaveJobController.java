package com.assignment02.controller;

import java.security.Principal;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dto.RoleDTO;
import com.assignment02.dto.SaveJobDTO;
import com.assignment02.dto.UserDTO;
import com.assignment02.entity.Recruitment;
import com.assignment02.entity.User;
import com.assignment02.service.RecruitmentService;
import com.assignment02.service.SaveJobService;
import com.assignment02.service.UserService;

@Controller
@RequestMapping("/save-job")
public class ListSaveJobController {
//	@GetMapping("/get-list")
//	public String getListSaveJob() {
//		return "list-save-job";
//	}

	@Autowired
	private UserService userService;
	@Autowired
	private RecruitmentService recruitmentService;
//	@Autowired
//	private RoleService roleService;
	@Autowired
	private SaveJobService saveJobService;
//	@Autowired
//	private CvService cvService;

	@GetMapping("/get-list")
	public String listPost(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "2") int size,
			Model model, Principal principal, @AuthenticationPrincipal MyUserDetails currentUser) {
		// Lấy username của user đang đăng nhập
		String username = principal.getName();

		// Tìm user dựa vào username
		UserDTO userDTO = userService.getUserDTOByEmail(username);
		Set<RoleDTO> roles = userService.getRoleDTOIdByEmail(username);

		// Lấy company từ user

//		Company company = companyService.getCompanyByUserId(userDTO.getId());
		Page<SaveJobDTO> saveJobPage = Page.empty(); // Khởi tạo trang rỗng
		if (userDTO != null) {
			// Nếu company đã được cập nhật, lấy danh sách bài đăng
			Pageable pageable = PageRequest.of(page, size);
			saveJobPage = saveJobService.getAllSaveJobDTOByUserId(userDTO.getId(), pageable, currentUser);
			System.out.println(saveJobPage.getTotalPages());
			// Kiểm tra nếu số trang vượt quá giới hạn
			if (page >= saveJobPage.getTotalPages()) {
				System.out.println(saveJobPage.getTotalPages());
				page = saveJobPage.getTotalPages() > 0 ? saveJobPage.getTotalPages() - 1 : 0;
				pageable = PageRequest.of(page, size);
				saveJobPage = saveJobService.getAllSaveJobDTOByUserId(userDTO.getId(), pageable, currentUser);
			}
		}
		System.out.println(saveJobPage.getTotalPages()); // Kiểm tra kiểu của saveJobPage

		model.addAttribute("paginationType", "listSaveJob");
		model.addAttribute("saveJobList", saveJobPage);
		model.addAttribute("numberPage", page);
		model.addAttribute("roles", roles);
		model.addAttribute("user", userDTO);
		return "list-save-job";
	}

	@PostMapping("/delete")
	public String deleteSaveJob(@RequestParam("id") int recruitmentId, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		// Lấy thông tin người dùng hiện tại từ Authentication
		String pageParam = request.getParameter("page");
	    int page = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 0;
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//		MyUserDetails myUserDetails = (MyUserDetails) authentication.getPrincipal();
		String username = authentication.getName(); // Đoạn này lấy tên người dùng (email)

		// Lấy thông tin người dùng từ dịch vụ
		User user = userService.getUserByEmail(username);
		if (user == null) {
//			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found");
		}

		// Lấy thông tin recruitment từ jobId
		Recruitment recruitment = recruitmentService.getRecruitment(recruitmentId);
		if (recruitment == null) {
//			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Recruitment job not found");
		}

		// Lưu công việc vào cơ sở dữ liệu
		saveJobService.deleteSaveJob(user.getId(), recruitmentId);
		redirectAttributes.addFlashAttribute("successDelete", "Xoá thành công");
		// Trả về phản hồi thành công
		return "redirect:/save-job/get-list?page=" + page;
	}
}
