package com.assignment02.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import com.assignment02.dto.CompanyDTO;
import com.assignment02.service.CompanyService;
@RestController
@RequestMapping("/user")
public class FileUploadCompanyController {

	@Autowired
	private CompanyService companyService;

	@PostMapping("/update-company")
	public ResponseEntity<String> uploadFile(@RequestParam("file") MultipartFile file,
			@RequestParam("email") String email, @ModelAttribute("updateCompany") CompanyDTO companyDTO,
			@RequestParam("filePath") String filePath, RedirectAttributes redirectAttributes,
			HttpServletRequest request) {
		// Lấy thông tin người dùng hiện tại từ Authentication
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		MyUserDetails myUserDetails = (MyUserDetails) authentication.getPrincipal();

		if (filePath.isEmpty()) { // Nếu không có đường dẫn file cũ
			try {
				companyDTO.setImageFile(file);
				String fileUrl = null;
				if (companyDTO.getImageFile() != null && !companyDTO.getImageFile().isEmpty()) {
					// Kiểm tra file hợp lệ
					if (file.isEmpty()) {
						return ResponseEntity.badRequest().body("Error: File rỗng.");
					}

					// Đường dẫn lưu file
//					ServletContext servletContext = request.getServletContext();
//					String uploadDir = servletContext.getRealPath("/resources/uploads/profile-images");
					String uploadDir = "src/main/webapp/resources/assets/uploads/image/company-image/" + email;
					LocalTime localTime = LocalTime.now();
					DateTimeFormatter dateTimeFormat = DateTimeFormatter.ofPattern("HH-mm-ss");
					String time = localTime.format(dateTimeFormat);
					String fileName = email + "_" + time + "_" + file.getOriginalFilename();
					Path uploadPath = Paths.get(uploadDir);

					// Tạo thư mục nếu chưa tồn tại
					if (!Files.exists(uploadPath)) {
						Files.createDirectories(uploadPath);
					}

					// Lưu file vào hệ thống
					Path path = uploadPath.resolve(fileName);
					Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);

					// Trả về đường dẫn file
					fileUrl = "/resources/assets/uploads/image/company-image/" + email + "/" + fileName;
					companyDTO.setLogo(fileUrl);
				}
				companyService.saveCompany(companyDTO, myUserDetails);
				return ResponseEntity.ok(fileUrl);
			} catch (IOException e) {
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error: " + e.getMessage());
			}
		} else { // Nếu có đường dẫn file cũ
			companyDTO.setLogo(filePath); // Gán đường dẫn file cũ vào logo công ty
			companyService.saveCompany(companyDTO, myUserDetails); // Lưu thông tin công ty vào cơ sở dữ liệu
			return ResponseEntity.ok(filePath); // Trả về đường dẫn file cũ
		}
	}

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
}
