package com.assignment02.controller;

import java.security.Principal;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dto.ApplyJobDTO;
import com.assignment02.dto.FollowCompanyDTO;
import com.assignment02.dto.RecruitmentDTO;
import com.assignment02.dto.RoleDTO;
import com.assignment02.dto.UserDTO;
import com.assignment02.entity.Company;
import com.assignment02.entity.User;
import com.assignment02.service.ApplyJobService;
import com.assignment02.service.CompanyService;
import com.assignment02.service.CvService;
import com.assignment02.service.EmailService;
import com.assignment02.service.FollowCompanyService;
import com.assignment02.service.RecruitmentService;
import com.assignment02.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private FollowCompanyService followCompanyService;
	@Autowired
	private RecruitmentService recruitmentService;
	@Autowired
	private CvService cvService;
	@Autowired
	private ApplyJobService applyJobService;
	@Autowired
	private EmailService emailService;

	@GetMapping("/update-profile")
	public String showUserProfile(Model model) {
		return "/update-profile"; // Tên view của trang profile (Thường là .html)
	}

//	@PostMapping("/update-profile")
//	public String updateProfile(@ModelAttribute("updateProfile") UserDTO userDTO,
//			RedirectAttributes redirectAttributes) {
//		// Lấy thông tin người dùng hiện tại từ Authentication
//		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//		MyUserDetails myUserDetails = (MyUserDetails) authentication.getPrincipal();
//		String username = authentication.getName();
//
//		// Lấy các roles của người dùng
//		Set<Role> roles = userService.getRoleIdByEmail(username);
//		userDTO.setRoles(roles);
//
//		// Kiểm tra và xử lý ảnh nếu người dùng upload
//		if (userDTO.getImageFile() != null && !userDTO.getImageFile().isEmpty()) {
//			try {
//				// Đường dẫn lưu file
//				String uploadDir = "uploads/profile-images";
//				LocalTime localTime = LocalTime.now();
//				DateTimeFormatter dateTimeFormat = DateTimeFormatter.ofPattern("HH-mm-ss");
//				String time = localTime.format(dateTimeFormat);
//				String fileName = username + "_" + time + userDTO.getImageFile().getOriginalFilename();
//				Path uploadPath = Paths.get(uploadDir);
//
//				// Tạo thư mục nếu chưa tồn tại
//				if (!Files.exists(uploadPath)) {
//					Files.createDirectories(uploadPath);
//				}
//
//				// Lưu file vào hệ thống
//				Path filePath = uploadPath.resolve(fileName);
//				Files.copy(userDTO.getImageFile().getInputStream(), filePath);
//
//				// Cập nhật đường dẫn file vào UserDTO
//				userDTO.setImage("/uploads/profile-images/" + fileName);
//			} catch (IOException e) {
//				redirectAttributes.addFlashAttribute("updateProfileError", "Lỗi khi lưu ảnh: " + e.getMessage());
//				return "redirect:/profile";
//			}
//		}
//
//		// Cập nhật thông tin người dùng
//		userService.saveUser(userDTO, myUserDetails);
//
//		// Cập nhật SecurityContext
//		User updatedUser = userService.getUserByEmail(myUserDetails.getUsername());
//		MyUserDetails updatedUserDetails = new MyUserDetails(updatedUser);
//		Authentication newAuth = new UsernamePasswordAuthenticationToken(updatedUserDetails,
//				authentication.getCredentials(), authentication.getAuthorities());
//		SecurityContextHolder.getContext().setAuthentication(newAuth);
//
//		// Thêm thông báo thành công
//		redirectAttributes.addFlashAttribute("updateProfileSuccess", "Cập nhật thành công");
//
//		return "redirect:/profile";
//	}

//	@PostMapping("/update-company")
//	public String updateCompany(@ModelAttribute("updateCompany") CompanyDTO companyDTO,
//			RedirectAttributes redirectAttributes) {
//		// Lấy thông tin người dùng hiện tại từ Authentication
//		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//		MyUserDetails myUserDetails = (MyUserDetails) authentication.getPrincipal();
//
//		// Cập nhật thông tin người dùng từ UserDTO và lưu vào cơ sở dữ liệu
//		companyService.saveCompany(companyDTO, myUserDetails);
//		redirectAttributes.addFlashAttribute("updateProfileSuccess", "Cập nhật thành công");
//
//		return "redirect:/profile"; // Quay lại trang profile sau khi cập nhật
//	}

	@GetMapping("/get-list-apply")
	public String listApplyJob(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "2") int size,
			Principal principal, @AuthenticationPrincipal MyUserDetails currentUser, Model model,
			HttpSession httpSession) {
		// Lấy username của user đang đăng nhập
		String username = principal.getName();

		// Tìm user dựa vào username
		UserDTO userDTO = userService.getUserDTOByEmail(username);
		Set<RoleDTO> roles = userService.getRoleDTOIdByEmail(username);

		// Lấy company từ user

//				Company company = companyService.getCompanyByUserId(userDTO.getId());
		Page<ApplyJobDTO> applyJobPage = Page.empty(); // Khởi tạo trang rỗng
		if (userDTO != null) {
			// Nếu company đã được cập nhật, lấy danh sách bài đăng
			Pageable pageable = PageRequest.of(page, size);
			applyJobPage = applyJobService.getAllApplyJobByUserId(userDTO.getId(), pageable);
			System.out.println(applyJobPage.getTotalPages());
			// Kiểm tra nếu số trang vượt quá giới hạn
			if (page >= applyJobPage.getTotalPages()) {
				System.out.println(applyJobPage.getTotalPages());
				page = applyJobPage.getTotalPages() > 0 ? applyJobPage.getTotalPages() - 1 : 0;
				pageable = PageRequest.of(page, size);
				applyJobPage = applyJobService.getAllApplyJobByUserId(userDTO.getId(), pageable);
			}
		}
		System.out.println(applyJobPage.getSize()); // Kiểm tra kiểu của saveJobPage
		httpSession.setAttribute("paginationType", "category");
		model.addAttribute("applyJobList", applyJobPage);
		model.addAttribute("numberPage", page);
		model.addAttribute("roles", roles);
		model.addAttribute("user", userDTO);
		return "list-apply-job";
	}

	@GetMapping("/get-list-company")
	public String listFollowCompany(@RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "2") int size, Model model, Principal principal,
			@AuthenticationPrincipal MyUserDetails currentUser) {
		// Lấy username của user đang đăng nhập
		String username = principal.getName();

		// Tìm user dựa vào username
		UserDTO userDTO = userService.getUserDTOByEmail(username);
		Set<RoleDTO> roles = userService.getRoleDTOIdByEmail(username);

		Page<FollowCompanyDTO> followCompanyPage = Page.empty(); // Khởi tạo trang rỗng
		if (userDTO != null) {
			// Nếu company đã được cập nhật, lấy danh sách bài đăng
			Pageable pageable = PageRequest.of(page, size);
			followCompanyPage = followCompanyService.getAllFollowCompanyByUser(userDTO.getId(), pageable);
			System.out.println(followCompanyPage.getTotalPages());
			// Kiểm tra nếu số trang vượt quá giới hạn
			if (page >= followCompanyPage.getTotalPages()) {
				System.out.println(followCompanyPage.getTotalPages());
				page = followCompanyPage.getTotalPages() > 0 ? followCompanyPage.getTotalPages() - 1 : 0;
				pageable = PageRequest.of(page, size);
				followCompanyPage = followCompanyService.getAllFollowCompanyByUser(userDTO.getId(), pageable);
			}
		}
		model.addAttribute("listFollowCompany", followCompanyPage);
		for (FollowCompanyDTO followCompanyDTO : followCompanyPage) {
			System.out.println(followCompanyDTO.getId());
		}
		model.addAttribute("numberPage", page);
		model.addAttribute("roles", roles);
		model.addAttribute("user", userDTO);
		return "list-follow-company";
	}

	@GetMapping("/list-post")
	public String listPost(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "2") int size,
			Model model, Principal principal, @AuthenticationPrincipal MyUserDetails currentUser,
			HttpSession httpSession) {
		// Lấy username của user đang đăng nhập
		String username = principal.getName();

		// Tìm user dựa vào username
		UserDTO userDTO = userService.getUserDTOByEmail(username);
		Set<RoleDTO> roles = userService.getRoleDTOIdByEmail(username);

		// Lấy company từ user
		Company company = companyService.getCompanyByUserId(userDTO.getId());
		Page<RecruitmentDTO> recruitmentPage = Page.empty(); // Khởi tạo trang rỗng
		if (company != null) {
			// Nếu company đã được cập nhật, lấy danh sách bài đăng
			Pageable pageable = PageRequest.of(page, size);
			recruitmentPage = recruitmentService.getAllRecruitmentsByCompany(company.getId(), pageable);
			System.out.println(recruitmentPage.getTotalPages());
			// Kiểm tra nếu số trang vượt quá giới hạn
			if (page >= recruitmentPage.getTotalPages()) {
				System.out.println(recruitmentPage.getTotalPages());
				page = recruitmentPage.getTotalPages() > 0 ? recruitmentPage.getTotalPages() - 1 : 0;
				pageable = PageRequest.of(page, size);
				recruitmentPage = recruitmentService.getAllRecruitmentsByCompany(company.getId(), pageable);
			}
		}
		httpSession.setAttribute("paginationType", "listPost");
		model.addAttribute("paginationType", "listPost");
		model.addAttribute("listRecruitment", recruitmentPage);
		model.addAttribute("numberPage", page);
		model.addAttribute("roles", roles);
		model.addAttribute("user", userDTO);
		return "post-list";
	}

	@PostMapping("/deleteCv")
	public String deleteCv(@RequestParam("idCv") int idCv, @AuthenticationPrincipal MyUserDetails currentDetails,
			RedirectAttributes redirectAttributes) {
		cvService.deleteCv(idCv, currentDetails);
		redirectAttributes.addFlashAttribute("deleteSuccess", "Xoá Cv thành công");
		return "redirect:/profile";
	}

	@GetMapping("/company-post/{companyId}")
	public String companyPost(@PathVariable("companyId") int companyId, @RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "2") int size, Model model, Principal principal,
			@AuthenticationPrincipal MyUserDetails currentUser) {
		// Nếu company đã được cập nhật, lấy danh sách bài đăng
		String username = principal.getName();
		// Tìm user dựa vào username
		UserDTO userDTO = userService.getUserDTOByEmail(username);
		Pageable pageable = PageRequest.of(page, size);
		Page<RecruitmentDTO> recruitmentPage = Page.empty(); // Khởi tạo trang rỗng
		recruitmentPage = recruitmentService.getAllRecruitmentsByCompany(companyId, pageable);
		System.out.println(recruitmentPage.getTotalPages());
		// Kiểm tra nếu số trang vượt quá giới hạn
		if (page >= recruitmentPage.getTotalPages()) {
			System.out.println(recruitmentPage.getTotalPages());
			page = recruitmentPage.getTotalPages() > 0 ? recruitmentPage.getTotalPages() - 1 : 0;
			pageable = PageRequest.of(page, size);
			recruitmentPage = recruitmentService.getAllRecruitmentsByCompany(companyId, pageable);
		}
		model.addAttribute("paginationType", "companyListPost");
		model.addAttribute("companyId", companyId);
		model.addAttribute("listRecruitment", recruitmentPage);
		model.addAttribute("numberPage", page);
		model.addAttribute("user", userDTO);
		return "post-list";
	}

	@PostMapping("/delete-follow")
	public String deleteFollow(@RequestParam("id") int companyId, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		String pageParam = request.getParameter("page");
		int page = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 0;
		// Lấy thông tin người dùng hiện tại từ Authentication
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//		MyUserDetails myUserDetails = (MyUserDetails) authentication.getPrincipal();
		String username = authentication.getName(); // Đoạn này lấy tên người dùng (email)

		// Lấy thông tin người dùng từ dịch vụ
		User user = userService.getUserByEmail(username);
		if (user == null) {
//						return ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found");
		}

		// Lấy thông tin recruitment từ jobId
		Company company = companyService.getCompanyById(companyId);
		if (company == null) {
//						return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Recruitment job not found");
		}

		// Lưu công việc vào cơ sở dữ liệu
		followCompanyService.deleteFollowCompany(user.getId(), companyId);

		// Trả về phản hồi thành công
//		return ResponseEntity.status(HttpStatus.OK).body("{\"success\": true, \"isChecked\": " + isChecked + "}");
		redirectAttributes.addFlashAttribute("success", "Xoá thành công");
		return "redirect:/user/get-list-company?page=" + page;
	}

	// Hàm duyệt Cv
	@PostMapping("/review")
	public String reviewCv(@RequestParam("idApplyPost") int idApplyPost, RedirectAttributes redirectAttributes) {
		ApplyJobDTO applyJobDTO = applyJobService.getApplyJobDTOById(idApplyPost);
		applyJobDTO.setStatus(1);
		applyJobService.saveApplyJob(applyJobDTO);
		redirectAttributes.addFlashAttribute("reviewSuccess", "Duyệt thành công");
		return String.format("redirect:/recruitment/detail/%d", applyJobDTO.getRecruitment().getId());
	}

	@PostMapping("/delete-apply")
	public String deleteSaveJob(@RequestParam("id") int applyJobId, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		// Lấy thông tin người dùng hiện tại từ Authentication
		String pageParam = request.getParameter("page");
		int page = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 0;
		// Lưu công việc vào cơ sở dữ liệu
		applyJobService.deleteApplyJob(applyJobId);
		redirectAttributes.addFlashAttribute("successDelete", "Xoá thành công");
		// Trả về phản hồi thành công
		return "redirect:/user/get-list-apply?page=" + page;
	}

	@PostMapping("/search")
	public String search() {
		return "result-search-user";
	}

	@GetMapping("/verify-email")
	public String showVerificationPage(Model model, @AuthenticationPrincipal UserDetails userDetails,
			HttpSession session) {
		User user = userService.getUserByEmail(userDetails.getUsername());
		model.addAttribute("userInformation", user);
		// Kiểm tra session có comfirm_await không
		Boolean confirmAwait = (Boolean) session.getAttribute("comfirm_await");
		model.addAttribute("comfirm_await", confirmAwait != null ? confirmAwait : false);
		return "profile";
	}

	@PostMapping("/confirm-account")
	public String sendVerificationEmail(@RequestParam("email") String email, HttpSession session) {
		User user = userService.getUserByEmail(email);
		if (user == null || user.getStatus() != 0) {
			return "redirect:/user/verify-email";
		}

		if (user.getVerificationToken() == null) {
			// Gửi email xác thực
			String token = userService.createVerificationToken(user);
			boolean checkEmail = emailService.sendVerificationEmail(user.getEmail(), token);
			if(!checkEmail) {
				session.setAttribute("emptyEmail", "Email không tồn tại");
				return "redirect:/access-denied";
			}
		}
		session.setAttribute("comfirm_await", true);
		return "redirect:/user/verify-email";
	}

	@GetMapping("/confirm")
	public String confirmAccount(@RequestParam("email") String email, @RequestParam("token") String token, Model model,
			@AuthenticationPrincipal MyUserDetails currentUser, HttpSession session) {
		if (!userService.verifyCode(email, token, currentUser)) {
			session.setAttribute("confirm_error", true);
			return "redirect:/access-denied";
		} else {
			session.removeAttribute("comfirm_await");
		}
		return "redirect:/profile";
	}
}
