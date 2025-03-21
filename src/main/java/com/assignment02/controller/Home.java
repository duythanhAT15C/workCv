package com.assignment02.controller;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dto.ApplyJobDTO;
import com.assignment02.dto.CategoryDTO;
import com.assignment02.dto.CompanyStatsDTO;
import com.assignment02.dto.RecruitmentDTO;
import com.assignment02.dto.UserDTO;
import com.assignment02.entity.Role;
import com.assignment02.service.ApplyJobService;
import com.assignment02.service.CategoryService;
import com.assignment02.service.CompanyService;
import com.assignment02.service.RecruitmentService;
import com.assignment02.service.RoleService;
import com.assignment02.service.UserService;

@Controller
public class Home {

	// Inject các dịch vụ cần thiết
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private RecruitmentService recruitmentService;
	@Autowired
	private ApplyJobService applyJobService;
	@Autowired
	private CompanyService companyService;

	// Phương thức xử lý yêu cầu GET cho trang chủ
	@GetMapping("/")
	public String showHome(HttpSession session, Model model) {

		// Kiểm tra nếu người dùng đã đăng nhập
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		// Nếu người dùng đã đăng nhập và không phải là "anonymousUser"
		if (authentication != null && authentication.isAuthenticated()
				&& !"anonymousUser".equals(authentication.getPrincipal())) {
			MyUserDetails userDetails = (MyUserDetails) authentication.getPrincipal(); // Lấy thông tin người dùng từ
																						// SecurityContext
			String email = userDetails.getUsername(); // Lấy email người dùng từ MyUserDetails
			UserDTO userDTO = userService.getUserDTOByEmail(email); // Lấy thông tin người dùng từ UserService theo
																	// email
			Set<Role> roles = roleService.getRoleByUserId(userDTO.getId()); // Lấy các vai trò của người dùng
			userDTO.setRoles(roles); // Thiết lập các vai trò vào đối tượng UserDTO
			// Đặt thông báo popup vào session nếu người dùng đã đăng nhập và chưa có thông
			// báo
			if (session.getAttribute("showLoginPopup") == null) {
				session.setAttribute("showLoginPopup", true); // Hiển thị popup lần đầu sau khi người dùng đăng nhập
			}
			model.addAttribute("user", userDTO); // Thêm thông tin người dùng vào model để sử dụng trong view
		} else {
			session.setAttribute("showLoginPopup", false); // Nếu người dùng chưa đăng nhập, ẩn popup
		}

		// Lấy danh sách các danh mục, công ty, việc làm và số lượng ứng viên
		List<CategoryDTO> listCategoryDTOs = categoryService.getTopCategories(); // Lấy danh sách các danh mục công việc
		List<RecruitmentDTO> listRecruitmentDTOs = recruitmentService.getMostAppliedJobs(); // Lấy các công việc được
																							// ứng tuyển nhiều nhất
		List<ApplyJobDTO> listApplyJobDTOs = applyJobService.getApplyJobs(); // Lấy danh sách các ứng viên
		List<CompanyStatsDTO> listCompanyStatsDTOs = companyService.getTopCompaniesByApplyJob(); // Lấy thống kê các
																									// công ty tuyển
																									// dụng nhiều ứng
																									// viên

		// Thêm các danh sách vào model để truyền xuống view
		model.addAttribute("companies", listCompanyStatsDTOs);
		model.addAttribute("categories", listCategoryDTOs);
		model.addAttribute("recruitments", listRecruitmentDTOs);
		model.addAttribute("numberCandidate", listApplyJobDTOs.size()); // Truyền số lượng ứng viên

		return "home"; // Trả về tên view (JSP)
	}

	// Phương thức xử lý yêu cầu GET cho trang đăng nhập
	@GetMapping("/showMyLoginPage")
	public String registerForm() {
		return "login"; // Trả về trang đăng nhập (login.jsp)
	}

}
