package com.assignment02.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.assignment02.dto.FollowCompanyDTO;
import com.assignment02.entity.Company;
import com.assignment02.entity.User;
import com.assignment02.service.CompanyService;
import com.assignment02.service.FollowCompanyService;
import com.assignment02.service.UserService;

@RestController
@RequestMapping("/user")
public class FollowCompanyController {
	@Autowired
	private FollowCompanyService followCompanyService;
	@Autowired
	private UserService userService;
	@Autowired
	private CompanyService companyService;

	@PostMapping("/follow-company")
	public ResponseEntity<Map<String, Object>> saveJob(@RequestParam("companyId") int companyId,
			@RequestParam("isChecked") boolean isChecked) {
		Map<String, Object> response = new HashMap<>();
		try {
			// Lấy thông tin người dùng hiện tại từ Authentication
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

			if (authentication != null && authentication.isAuthenticated()) {
				String username = authentication.getName(); // Đoạn này lấy tên người dùng (email)

				// Lấy thông tin người dùng từ dịch vụ
				User user = userService.getUserByEmail(username);
				if (user == null) {
					response.put("notUser", "User not found");
					return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
				}

				// Lấy thông tin recruitment từ jobId
				Company company = companyService.getCompanyById(companyId);
				if (company == null) {
					response.put("notRecruitment", "Recruitment job not found");
					return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
				}

				// Tạo đối tượng SaveJobDTO
				FollowCompanyDTO followCompanyDTO = new FollowCompanyDTO();
				followCompanyDTO.setUser(user);
				followCompanyDTO.setCompany(company);

				// Lưu công việc vào cơ sở dữ liệu
				followCompanyService.saveFollowCompany(followCompanyDTO);

				// Trả về phản hồi thành công
				isChecked = true;
				response.put("success", true);
				response.put("isChecked", isChecked);
				response.put("message", "isLogin");
			} else {
				response.put("success", false);
				response.put("isChecked", isChecked);
				response.put("message", "isNotLogin");
			}
			return ResponseEntity.status(HttpStatus.OK).body(response);

		} catch (Exception e) {
			// Xử lý lỗi và trả về thông báo lỗi nếu có
			response.put("message", "An error occurred: " + e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
	}

	@PostMapping("/deleteFollowCompany")
	public ResponseEntity<String> deleteJob(@RequestParam("companyId") int companyId,
			@RequestParam("isChecked") boolean isChecked) {
		try {
			// Lấy thông tin người dùng hiện tại từ Authentication
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String username = authentication.getName(); // Đoạn này lấy tên người dùng (email)

			// Lấy thông tin người dùng từ dịch vụ
			User user = userService.getUserByEmail(username);
			if (user == null) {
				return ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found");
			}

			// Lấy thông tin recruitment từ jobId
			Company company = companyService.getCompanyById(companyId);
			if (company == null) {
				return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Recruitment job not found");
			}

			// Lưu công việc vào cơ sở dữ liệu
			followCompanyService.deleteFollowCompany(user.getId(), company.getId());

			// Trả về phản hồi thành công
			isChecked = true;
			return ResponseEntity.status(HttpStatus.OK).body("{\"success\": true, \"isChecked\": " + isChecked + "}");

		} catch (Exception e) {
			// Xử lý lỗi và trả về thông báo lỗi nếu có
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred: " + e.getMessage());
		}
	}

	

}
