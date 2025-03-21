package com.assignment02.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.assignment02.dto.CompanyDTO;
import com.assignment02.dto.CvDTO;
import com.assignment02.dto.UserDTO;
import com.assignment02.service.CompanyService;
import com.assignment02.service.CvService;
import com.assignment02.service.UserService;

@Controller
public class Profile {

	@Autowired
	private UserService userService;
	@Autowired
	private CvService cvService;
	@Autowired
	private CompanyService companyService;

	@GetMapping("/profile")
	public String proFile(Model model) {
		// Lấy thông tin người dùng hiện tại từ SecurityContext
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName(); // Username của người dùng
		// Lấy danh sách các quyền (roles) từ Authentication
//		List<Integer> roleIds = new ArrayList<>();
//		for (GrantedAuthority authority : authentication.getAuthorities()) {
//			String roleName = authority.getAuthority(); // Lấy tên role (ví dụ: ROLE_USER, ROLE_ADMIN)
//			Role role = roleService.getRoleByName(roleName); // Tìm Role từ tên (roleName) trong cơ sở dữ liệu
//			if (role != null) {
//				roleIds.add(role.getId()); // Thêm ID của role vào danh sách roleIds
//			}
//		}
		// Lấy thông tin người dùng từ database
		UserDTO userDTO = userService.getUserDTOByEmail(username); // Giả sử bạn có method này trong UserRepository
		UserDTO userDTOGetId = userService.getUserIdByEmail(username); // Giả sử bạn có method này trong UserRepository
		CvDTO cvDTO = cvService.getCv(userDTO.getCvId());
		String urlCv = "";
		if (cvDTO != null) {
			urlCv = cvDTO.getFileName();
			String[] list = cvDTO.getFileName().split("/");
			cvDTO.setFileName(list[list.length - 1]);
		}

//		CompanyDTO companyDTO = companyService.getCompanyByUserId(userDTOGetId.getId());
//		System.out.println(companyDTO.getUser().getId());
//		userDTO.setRoleIds(roleIds);
		// Thêm thông tin người dùng vào model để hiển thị trên trang
		model.addAttribute("userInformation", userDTO);
		CompanyDTO companyDTO = companyService.getCompanyDTOByUserId(userDTOGetId.getId());
		if (companyDTO == null) {
			companyDTO = new CompanyDTO(); // Khởi tạo đối tượng rỗng
		}
		model.addAttribute("companyInformation", companyDTO);
		model.addAttribute("updateProfile", new UserDTO());
		model.addAttribute("Cv", cvDTO);
		model.addAttribute("urlCv", urlCv);
		System.out.println(userDTO.toString());
		return "profile";
	}

}
