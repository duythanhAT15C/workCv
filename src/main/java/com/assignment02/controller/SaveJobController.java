package com.assignment02.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.assignment02.dto.SaveJobDTO;
import com.assignment02.entity.Recruitment;
import com.assignment02.entity.User;
import com.assignment02.service.RecruitmentService;
import com.assignment02.service.SaveJobService;
import com.assignment02.service.UserService;

@RestController
@RequestMapping("/user")
public class SaveJobController {
	@Autowired
	private SaveJobService saveJobService;
	@Autowired
	private UserService userService;
	@Autowired
	private RecruitmentService recruitmentService;

	@PostMapping("/saveJob")
	public ResponseEntity<String> saveJob(@RequestParam("jobId") int jobId,
			@RequestParam("isChecked") boolean isChecked) {
		try {
			// Lấy thông tin người dùng hiện tại từ Authentication
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//			MyUserDetails myUserDetails = (MyUserDetails) authentication.getPrincipal();
			String username = authentication.getName(); // Đoạn này lấy tên người dùng (email)

			// Lấy thông tin người dùng từ dịch vụ
			User user = userService.getUserByEmail(username);
			if (user == null) {
				return ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found");
			}

			// Lấy thông tin recruitment từ jobId
			Recruitment recruitment = recruitmentService.getRecruitment(jobId);
			if (recruitment == null) {
				return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Recruitment job not found");
			}

			// Tạo đối tượng SaveJobDTO
			SaveJobDTO saveJobDTO = new SaveJobDTO();
			saveJobDTO.setUser(user);
			saveJobDTO.setRecruitment(recruitment);

			// Lưu công việc vào cơ sở dữ liệu
			saveJobService.saveJob(saveJobDTO);

			// Trả về phản hồi thành công
			isChecked = true;
			return ResponseEntity.status(HttpStatus.OK).body("{\"success\": true, \"isChecked\": " + isChecked + "}");

		} catch (Exception e) {
			// Xử lý lỗi và trả về thông báo lỗi nếu có
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred: " + e.getMessage());
		}
	}

	@PostMapping("/deleteJob")
	public ResponseEntity<String> deleteJob(@RequestParam("jobId") int jobId,
			@RequestParam("isChecked") boolean isChecked) {
		try {
			// Lấy thông tin người dùng hiện tại từ Authentication
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//			MyUserDetails myUserDetails = (MyUserDetails) authentication.getPrincipal();
			String username = authentication.getName(); // Đoạn này lấy tên người dùng (email)

			// Lấy thông tin người dùng từ dịch vụ
			User user = userService.getUserByEmail(username);
			if (user == null) {
				return ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found");
			}

			// Lấy thông tin recruitment từ jobId
			Recruitment recruitment = recruitmentService.getRecruitment(jobId);
			if (recruitment == null) {
				return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Recruitment job not found");
			}

			// Lưu công việc vào cơ sở dữ liệu
			saveJobService.deleteSaveJob(user.getId(), recruitment.getId());

			// Trả về phản hồi thành công
			isChecked = true;
			return ResponseEntity.status(HttpStatus.OK).body("{\"success\": true, \"isChecked\": " + isChecked + "}");

		} catch (Exception e) {
			// Xử lý lỗi và trả về thông báo lỗi nếu có
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred: " + e.getMessage());
		}
	}

	@PostMapping("/save")
	public ResponseEntity<String> save(@RequestParam("idRe") int recruitmentId) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName(); // Đoạn này lấy tên người dùng (email)
		User user = userService.getUserByEmail(username);
		if (user == null) {
		    return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("false");
		}


		// Lấy thông tin recruitment từ jobId
		Recruitment recruitment = recruitmentService.getRecruitment(recruitmentId);
		if (recruitment == null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Recruitment job not found");
		}
		boolean checkExistSaveJob = saveJobService.checkExistSaveJob(user.getId(), recruitmentId);
		if (checkExistSaveJob) {
			return ResponseEntity.ok("existSaveJob");
		} else {
			// Tạo đối tượng SaveJobDTO
			SaveJobDTO saveJobDTO = new SaveJobDTO();
			saveJobDTO.setUser(user);
			saveJobDTO.setRecruitment(recruitment);

			// Lưu công việc vào cơ sở dữ liệu
			saveJobService.saveJob(saveJobDTO);
			return ResponseEntity.ok("true");
		}
	}
}
