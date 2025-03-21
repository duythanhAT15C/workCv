package com.assignment02.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dto.CvDTO;
import com.assignment02.dto.UserDTO;
import com.assignment02.service.CvService;
import com.assignment02.service.UserService;

@RestController
@RequestMapping("/user")
public class FileUploadCvController {
	@Autowired
	private CvService cvService; // Inject service để xử lý các thao tác với cv
	@Autowired
	private UserService userService; // Inject service để xử lý các thao tác với user

	@PostMapping("/uploadCv")
	public ResponseEntity<String> uploadFile(@RequestParam("file") MultipartFile file,
			@AuthenticationPrincipal MyUserDetails currentUser) {
		String email = currentUser.getUsername();
		try {
			CvDTO cvDTO = new CvDTO();
			cvDTO.setCvFile(file);
			String fileUrl = "";
			String fileName = "";
			if (cvDTO.getCvFile() != null && !cvDTO.getCvFile().isEmpty()) {
				UserDTO userDTO = userService.getUserDTOByEmail(email);
				CvDTO existCvDTO = cvService.getCvDTOByUserId(userDTO.getId());
				if (existCvDTO != null) {
					cvService.deleteCv(existCvDTO.getId(), currentUser);
				}
				// Định nghĩa đường dẫn lưu file
				String uploadDir = "src/main/webapp/resources/assets/uploads/cv/" + email;
				LocalTime localTime = LocalTime.now();
				DateTimeFormatter dateTimeFormat = DateTimeFormatter.ofPattern("HH-mm-ss");
				String time = localTime.format(dateTimeFormat);
				fileName = email + "_" + time + "_" + file.getOriginalFilename();
				Path uploadPath = Paths.get(uploadDir);

				// Tạo thư mục nếu chưa tồn tại
				if (!Files.exists(uploadPath)) {
					Files.createDirectories(uploadPath);
				}

				// Lưu file vào hệ thống
				Path filePath = uploadPath.resolve(fileName);
				Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

				// Trả về đường dẫn file
				fileUrl = "/resources/assets/uploads/cv/" + email + "/" + fileName;
				cvDTO.setFileName(fileUrl);

			}
			cvService.saveCv(cvDTO, currentUser);
			return ResponseEntity.ok(fileName);
		} catch (IOException e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error: " + e.getMessage());
		}
	}
}
