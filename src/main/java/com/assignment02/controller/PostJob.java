package com.assignment02.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dto.ApplyJobDTO;
import com.assignment02.dto.CategoryDTO;
import com.assignment02.dto.RecruitmentDTO;
import com.assignment02.dto.RoleDTO;
import com.assignment02.dto.UserDTO;
import com.assignment02.entity.Category;
import com.assignment02.entity.Company;
import com.assignment02.entity.Recruitment;
import com.assignment02.entity.User;
import com.assignment02.repository.CompanyRepository;
import com.assignment02.repository.UserRepository;
import com.assignment02.service.ApplyJobService;
import com.assignment02.service.CategoryService;
import com.assignment02.service.RecruitmentService;
import com.assignment02.service.SaveJobService;
import com.assignment02.service.UserService;

@Controller
@RequestMapping("/recruitment")
public class PostJob {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private RecruitmentService recruitmentService;
	@Autowired
	private UserService userService;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private CompanyRepository companyRepository;
	@Autowired
	private ApplyJobService applyJobService;
	@Autowired
	private SaveJobService saveJobService;

	@GetMapping("/postJob")
	public String showFormPostJob(Model model, @AuthenticationPrincipal MyUserDetails currentUser) {
		String email = currentUser.getUsername();
		User existingUser = userRepository.findByEmail(email);
		List<CategoryDTO> listCategories = categoryService.listCategories();
		model.addAttribute("addNewJob", new Recruitment());
		model.addAttribute("categories", listCategories);
		model.addAttribute("user", existingUser);
		return "post-job";
	}

	@PostMapping("/add")
	public String postJob(@ModelAttribute("addNewJob") RecruitmentDTO recruitmentDTO,
			@AuthenticationPrincipal MyUserDetails currentUser, RedirectAttributes redirectAttributes) {
		String email = currentUser.getUsername(); // Lấy email từ MyUserDetails (hoặc các thông tin khác)

		User existingUser = userRepository.findByEmail(email);
		Company company = companyRepository.findByUserId(existingUser.getId());
		if (company != null) {
			recruitmentService.saveRecruitment(recruitmentDTO, currentUser, 0);
			redirectAttributes.addFlashAttribute("postJobSuccess", "Đăng bài thành công");
			return "redirect:/recruitment/postJob";
		} else {
			redirectAttributes.addFlashAttribute("postJobFalse", "Bạn chưa cập nhật thông tin công ty");
		}
		return "redirect:/recruitment/postJob";
	}

	@GetMapping("/editpost/{postId}")
	public String showFormEditJob(@PathVariable("postId") int theId, Model model,
			@AuthenticationPrincipal MyUserDetails currentUser) {
		String email = currentUser.getUsername();
		RecruitmentDTO recruitment = recruitmentService.getRecruitmentDTO(theId);
		UserDTO userDTO = userService.getUserDTOByEmail(email);
		List<CategoryDTO> listCategories = categoryService.listCategories();
		model.addAttribute("categories", listCategories);
		model.addAttribute("recruitment", recruitment);
		model.addAttribute("user", userDTO);
		return "edit-job";
	}

	@PostMapping("/editpost/{postId}")
	public String editJob(@PathVariable("postId") int theId, @ModelAttribute("updateJob") RecruitmentDTO recruitmentDTO,
			@AuthenticationPrincipal MyUserDetails currentUser, Model model, RedirectAttributes redirectAttributes) {
		recruitmentService.saveRecruitment(recruitmentDTO, currentUser, theId);
		redirectAttributes.addFlashAttribute("updateJobSuccess", "Cập nhật bài tuyển dụng thành công");
		// Nạp lại dữ liệu cho form
		String email = currentUser.getUsername();
		RecruitmentDTO updatedRecruitment = recruitmentService.getRecruitmentDTO(theId);
		UserDTO userDTO = userService.getUserDTOByEmail(email);
		List<CategoryDTO> listCategories = categoryService.listCategories();

		// Thêm vào model
		model.addAttribute("categories", listCategories);
		model.addAttribute("recruitment", updatedRecruitment);
		model.addAttribute("user", userDTO);
		return "redirect:/recruitment/editpost/" + theId;
	}

//	@PostMapping("/editpost/{postId}")
//	@ResponseBody // Trả về JSON
//	public ResponseEntity<String> editJob(@PathVariable("postId") int theId, 
//	                                       @ModelAttribute RecruitmentDTO recruitmentDTO, 
//	                                       @AuthenticationPrincipal MyUserDetails currentUser) {
//	    try {
//	        // Lưu thay đổi
//	        recruitmentService.saveRecruitment(recruitmentDTO, currentUser, theId);
//	        return ResponseEntity.ok("Cập nhật thành công!");
//	    } catch (Exception e) {
//	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Có lỗi xảy ra!");
//	    }
//	}

	@GetMapping("/detail/{recruitmentId}")
	public String detailCompany(@PathVariable("recruitmentId") int recruitmentId,
			@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "2") int size, Model model,
			@AuthenticationPrincipal MyUserDetails currentUser) {
//		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//        if (authentication.getPrincipal() instanceof MyUserDetails) {
//            MyUserDetails userDetails = (MyUserDetails) authentication.getPrincipal();
//            model.addAttribute("fullName", userDetails.getFullName());
//        } else {
//            model.addAttribute("fullName", "Anonymous");
//        }
		List<RecruitmentDTO> filteredPosts = null;
		RecruitmentDTO recruitment = null;
		Page<RecruitmentDTO> filteredPage = null;
		Page<RecruitmentDTO> relatedPosts = null;
		Category category = null;
		UserDTO userDTO = null;
		boolean checkExistSaveJob = false;
		List<RecruitmentDTO> listrecRecruitmentDTOs = null;
		Page<ApplyJobDTO> applyJobPage = null;
		List<String> fileNames = new ArrayList<>();
		if (currentUser != null) {
			String email = currentUser.getUsername();
			userDTO = userService.getUserDTOByEmail(email);
			recruitment = recruitmentService.getRecruitmentDTO(recruitmentId);
			listrecRecruitmentDTOs = recruitmentService
					.getAllRecruitmentByCategoryId(recruitment.getCategory().getId());
			checkExistSaveJob = saveJobService.checkExistSaveJob(userDTO.getId(), recruitment.getId());
			category = categoryService.getCategory(recruitment.getCategory().getId());
			filteredPage = Page.empty();
			relatedPosts = Page.empty();
			if (category != null) {
				// Lấy danh sách bài đăng thuộc category
				Pageable pageable = PageRequest.of(page, size);
				relatedPosts = recruitmentService.getAllRecruitmentsByCategory(category.getId(), pageable);
				applyJobPage = applyJobService.getAllApplyJobByRecruitmentId(recruitmentId, pageable);

				for (ApplyJobDTO applyJobDTO : applyJobPage) {
					fileNames.add(applyJobDTO.getNameCv().substring(applyJobDTO.getNameCv().lastIndexOf("/") + 1));
				}
				// Lọc bài đăng không có id trùng với postId
				filteredPosts = new ArrayList<>();
				for (RecruitmentDTO recruitmentDTO : listrecRecruitmentDTOs) {
					if (recruitmentDTO.getId() != recruitmentId) {
						filteredPosts.add(recruitmentDTO);
					}
				}
				int start = (int) pageable.getOffset();
				int end = Math.min((start + pageable.getPageSize()), filteredPosts.size());
				List<RecruitmentDTO> pagedList = filteredPosts.subList(start, end);
				filteredPage = new PageImpl<>(pagedList, pageable, filteredPosts.size());

				// Kiểm tra và điều chỉnh số trang nếu cần
				if (page >= filteredPage.getTotalPages()) {
					page = filteredPage.getTotalPages() > 0 ? filteredPage.getTotalPages() - 1 : 0;
					pageable = PageRequest.of(page, size);
					filteredPage = recruitmentService.getAllRecruitmentsByCategory(category.getId(), pageable);
				}
			}

			// Đưa dữ liệu vào Model

		} else {
			recruitment = recruitmentService.getRecruitmentDTO(recruitmentId);
			listrecRecruitmentDTOs = recruitmentService
					.getAllRecruitmentByCategoryId(recruitment.getCategory().getId());
			category = categoryService.getCategory(recruitment.getCategory().getId());
			filteredPage = Page.empty();
			relatedPosts = Page.empty();
			if (category != null) {
				// Lấy danh sách bài đăng thuộc category
				Pageable pageable = PageRequest.of(page, size);
				relatedPosts = recruitmentService.getAllRecruitmentsByCategory(category.getId(), pageable);
				// Lọc bài đăng không có id trùng với postId
				filteredPosts = new ArrayList<>();
				for (RecruitmentDTO recruitmentDTO : listrecRecruitmentDTOs) {
					if (recruitmentDTO.getId() != recruitmentId) {
						filteredPosts.add(recruitmentDTO);
					}
				}
				int start = (int) pageable.getOffset();
				int end = Math.min((start + pageable.getPageSize()), filteredPosts.size());
				List<RecruitmentDTO> pagedList = filteredPosts.subList(start, end);
				filteredPage = new PageImpl<>(pagedList, pageable, filteredPosts.size());

				// Kiểm tra và điều chỉnh số trang nếu cần
				if (page >= filteredPage.getTotalPages()) {
					page = filteredPage.getTotalPages() > 0 ? filteredPage.getTotalPages() - 1 : 0;
					pageable = PageRequest.of(page, size);
					filteredPage = recruitmentService.getAllRecruitmentsByCategory(category.getId(), pageable);
				}
			}
		}
		model.addAttribute("list", filteredPage);
		model.addAttribute("recruitment", recruitment);
		model.addAttribute("category", category);
		model.addAttribute("recruitmentList", relatedPosts.getContent());
		model.addAttribute("numberPage", page);
		model.addAttribute("totalPages", relatedPosts.getTotalPages());
		model.addAttribute("user", userDTO);
		model.addAttribute("checkExistSaveJob", checkExistSaveJob);
		model.addAttribute("applyPosts", applyJobPage);
		model.addAttribute("fileNames", fileNames);
		return "detail-post";
	}

	@PostMapping("/delete")
	public String deleteJob(@RequestParam("id") int theId, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		String pageParam = request.getParameter("page");
	    int page = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 0;
		List<ApplyJobDTO> applyJobDTOs = applyJobService.getAllApplyJobsByRecruitmentId(theId);
		if (applyJobDTOs != null && !applyJobDTOs.isEmpty()) {
			redirectAttributes.addFlashAttribute("deleteJobFalse", "Không thể xoá bài đăng khi có ứng viên nộp CV");
			return "redirect:/user/list-post?page=" + page;
		}
		recruitmentService.deleteRecruitment(theId);
		redirectAttributes.addFlashAttribute("deleteJobSuccess", "Xoá bài đăng thành công");
		System.out.println("Redirect attributes: " + redirectAttributes);
		return "redirect:/user/list-post?page=" + page;
	}

	@GetMapping("/category/{categoryId}")
	public String listCategory(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "2") int size,
			Model model, Principal principal, @AuthenticationPrincipal MyUserDetails currentUser,
			@PathVariable("categoryId") int theId, HttpSession httpSession) {
		String username = null;
		UserDTO userDTO = null;
		Set<RoleDTO> roles = null;

		// Kiểm tra xem người dùng có đăng nhập hay không
		if (principal != null) {
			username = principal.getName();
			userDTO = userService.getUserDTOByEmail(username);
			roles = userService.getRoleDTOIdByEmail(username);
		}

		// Xử lý logic chung, bất kể người dùng đã đăng nhập hay chưa
		Category category = categoryService.getCategory(theId);
		Page<RecruitmentDTO> recruitmentPage = Page.empty(); // Khởi tạo trang rỗng
		if (category != null) {
			// Lấy danh sách bài đăng thuộc category
			Pageable pageable = PageRequest.of(page, size);
			recruitmentPage = recruitmentService.getAllRecruitmentsByCategory(theId, pageable);

			// Kiểm tra và điều chỉnh số trang nếu cần
			if (page >= recruitmentPage.getTotalPages()) {
				page = recruitmentPage.getTotalPages() > 0 ? recruitmentPage.getTotalPages() - 1 : 0;
				pageable = PageRequest.of(page, size);
				recruitmentPage = recruitmentService.getAllRecruitmentsByCategory(theId, pageable);
			}
		}

		// Add các thuộc tính vào model
		httpSession.setAttribute("paginationType", "category");
		model.addAttribute("paginationType", "category");
		model.addAttribute("listRecruitment", recruitmentPage);
		model.addAttribute("categoryId", category != null ? category.getId() : null);
		model.addAttribute("recruitmentList", recruitmentPage.getContent());
		model.addAttribute("numberPage", page);

		// Nếu người dùng đã đăng nhập, add thêm thông tin user
		if (principal != null) {
			model.addAttribute("roles", roles);
			model.addAttribute("user", userDTO);
		}
		else {
			model.addAttribute("user", null);
		}

		return "post-list";
	}

}
