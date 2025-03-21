package com.assignment02.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dto.UserDTO;
import com.assignment02.entity.Role;
import com.assignment02.entity.User;
import com.assignment02.service.UserService;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/user")
public class FileUploadUserController {
	@Autowired
	private UserService userService;

	@PostMapping("/update-profile")
	public ResponseEntity<String> uploadFile(@RequestParam("file") MultipartFile file,
			@RequestParam("email") String email, @RequestParam("filePath") String filePath,
			@ModelAttribute("updateProfile") UserDTO userDTO, @RequestParam("cvId") int cvId,
			RedirectAttributes redirectAttributes, HttpServletRequest request) {
		// Lấy thông tin người dùng hiện tại từ Authentication
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		MyUserDetails myUserDetails = (MyUserDetails) authentication.getPrincipal();
		String username = authentication.getName();

		// Lấy các roles của người dùng
		Set<Role> roles = userService.getRoleIdByEmail(username);
		userDTO.setRoles(roles);
		if (filePath.isEmpty()) {
			try {
				userDTO.setImageFile(file);
				String fileUrl = null;
				if (userDTO.getImageFile() != null && !userDTO.getImageFile().isEmpty()) {
					// Kiểm tra file hợp lệ
					if (file.isEmpty()) {
						return ResponseEntity.badRequest().body("Error: File rỗng.");
					}

					// Đường dẫn lưu file
//					ServletContext servletContext = request.getServletContext();
					String uploadDir = "";
					for (Role role : userDTO.getRoles()) {
						if (role.getId() == 1) {
							uploadDir = "src/main/webapp/resources/assets/uploads/image/profile-images/candidate/"
									+ username;
						} else if (role.getId() == 2) {
							uploadDir = "src/main/webapp/resources/assets/uploads/image/profile-images/company/"
									+ username;
						}
					}
					if (userDTO.getRoles().size() > 1) {
						uploadDir = "src/main/webapp/resources/assets/uploads/image/profile-images/multi-role/"
								+ username;
					}
//					if (uploadDir == null) {
//						// Trường hợp chạy local, sử dụng thư mục tương đối từ thư mục dự án
//						uploadDir = System.getProperty("user.dir") + "/src/main/webapp/resources/uploads/profile-images";
//					}
					LocalTime localTime = LocalTime.now();
					DateTimeFormatter dateTimeFormat = DateTimeFormatter.ofPattern("HH-mm-ss");
					String time = localTime.format(dateTimeFormat);
					String fileName = email + "_" + time + "_" + file.getOriginalFilename();
					Path uploadPath = Paths.get(uploadDir);
					if (!Files.exists(uploadPath)) {
						Files.createDirectories(uploadPath);
					}

					// Lưu file vào hệ thống
					Path path = uploadPath.resolve(fileName);
					Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
					// Trả về đường dẫn file
					for (Role role : userDTO.getRoles()) {
						if (role.getId() == 1) {
							fileUrl = "/resources/assets/uploads/image/profile-images/candidate/" + username + "/"
									+ fileName;
						} else if (role.getId() == 2) {
							fileUrl = "/resources/assets/uploads/image/profile-images/company/" + username + "/"
									+ fileName;
						}
					}
					if (userDTO.getRoles().size() > 1) {
						fileUrl = "/resources/assets/uploads/image/profile-images/multi-role/" + username + "/"
								+ fileName;
					}

					userDTO.setImage(fileUrl);
					userDTO.setCvId(cvId);
				}
				userService.saveUser(userDTO, myUserDetails);

				// Cập nhật SecurityContext
				User updatedUser = userService.getUserByEmail(userDTO.getEmail());
				MyUserDetails updatedUserDetails = new MyUserDetails(updatedUser);
				Authentication newAuth = new UsernamePasswordAuthenticationToken(updatedUserDetails,
						authentication.getCredentials(), authentication.getAuthorities());
				SecurityContextHolder.getContext().setAuthentication(newAuth);

				// Thêm thông báo thành công
				redirectAttributes.addFlashAttribute("updateProfileSuccess", "Cập nhật thành công");
				return ResponseEntity.ok(fileUrl);
			} catch (IOException e) {
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error: " + e.getMessage());
			}
		} else {
			userDTO.setImage(filePath);
			userDTO.setCvId(cvId);
			userService.saveUser(userDTO, myUserDetails);

			// Cập nhật SecurityContext
			User updatedUser = userService.getUserByEmail(userDTO.getEmail());
			MyUserDetails updatedUserDetails = new MyUserDetails(updatedUser);
			Authentication newAuth = new UsernamePasswordAuthenticationToken(updatedUserDetails,
					authentication.getCredentials(), authentication.getAuthorities());
			SecurityContextHolder.getContext().setAuthentication(newAuth);

			// Thêm thông báo thành công
			redirectAttributes.addFlashAttribute("updateProfileSuccess", "Cập nhật thành công");
			return ResponseEntity.ok(filePath);
		}
	}

//	@PostMapping("/upload")
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
	
}
