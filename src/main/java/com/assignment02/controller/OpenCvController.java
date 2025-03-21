package com.assignment02.controller;

import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.nio.file.Path;
import java.nio.file.Paths;

@RestController
@RequestMapping("/resources")
public class OpenCvController {

	// Định nghĩa đường dẫn thư mục chứa các file CV
	private final String UPLOAD_DIR = "resources/uploads/cv";

	// Phương thức để lấy file CV từ đường dẫn
	@GetMapping("/uploads/cv/{fileName}")
	public ResponseEntity<Resource> getFile(@PathVariable String fileName) {
		try {
			// Xác định đường dẫn tới file từ tên file (fileName)
			Path filePath = Paths.get(UPLOAD_DIR).resolve(fileName).normalize();

			// Tạo Resource từ đường dẫn file
			Resource resource = new UrlResource(filePath.toUri());

			// Kiểm tra xem file có tồn tại không
			if (resource.exists()) {
				// Nếu file tồn tại, trả về response với loại nội dung là PDF và đính kèm tên
				// file
				return ResponseEntity.ok().contentType(MediaType.APPLICATION_PDF) // Đảm bảo file là dạng PDF
						.header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + fileName + "\"") // Hiển thị
																											// file
																											// inline
																											// trong
																											// trình
																											// duyệt
						.body(resource); // Trả về resource chứa file
			} else {
				// Nếu không tìm thấy file, trả về lỗi 404
				return ResponseEntity.notFound().build();
			}
		} catch (Exception e) {
			// Nếu có lỗi trong quá trình xử lý, trả về lỗi 500
			return ResponseEntity.internalServerError().build();
		}
	}
}
