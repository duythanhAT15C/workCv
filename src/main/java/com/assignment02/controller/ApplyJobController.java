package com.assignment02.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dto.ApplyJobDTO;
import com.assignment02.dto.CvDTO;
import com.assignment02.entity.Recruitment;
import com.assignment02.entity.User;
import com.assignment02.service.ApplyJobService;
import com.assignment02.service.CvService;
import com.assignment02.service.RecruitmentService;
import com.assignment02.service.UserService;

@RestController // Đánh dấu lớp là một REST controller
@RequestMapping("/user") // Định nghĩa đường dẫn chung cho tất cả các API trong controller này
public class ApplyJobController {
    
    // Inject các service cần thiết vào controller
    @Autowired
    private CvService cvService;
    @Autowired
    private UserService userService;
    @Autowired
    private RecruitmentService recruitmentService;
    @Autowired
    private ApplyJobService applyJobService;

    // API để xử lý việc ứng tuyển công việc với file đính kèm
    @PostMapping("/apply-job")
    public ResponseEntity<String> uploadFile(@RequestParam(name = "file", required = false) MultipartFile file,
            @RequestParam("idRe") int recruitmentId, @RequestParam("text") String text,
            @AuthenticationPrincipal MyUserDetails currentUser) {
        
        String email = currentUser.getUsername(); // Lấy email của người dùng hiện tại
        User user = userService.getUserByEmail(email); // Lấy thông tin người dùng từ email
        List<ApplyJobDTO> list = applyJobService.getApplyJobsDTOByUserIdAndRecruitmentId(user.getId(), recruitmentId); 
        
        // Kiểm tra xem người dùng đã ứng tuyển vào công việc này chưa
        if (!list.isEmpty() && list != null) {
            return ResponseEntity.ok("exitsUserApplyJob"); // Trả về thông báo nếu đã ứng tuyển
        }
        
        try {
            CvDTO cvDTO = new CvDTO();
            cvDTO.setCvFile(file); // Gán file CV vào DTO

            String fileUrl = "";
            String fileName = "";
            
            // Kiểm tra nếu có file CV được tải lên
            if (cvDTO.getCvFile() != null && !cvDTO.getCvFile().isEmpty()) {
                String uploadDir = "src/main/webapp/resources/assets/uploads/cv/" + email;
                LocalTime localTime = LocalTime.now();
                DateTimeFormatter dateTimeFormat = DateTimeFormatter.ofPattern("HH-mm-ss");
                String time = localTime.format(dateTimeFormat); // Lấy thời gian hiện tại để tạo tên file duy nhất
                fileName = email + "_" + time + "_" + file.getOriginalFilename();
                Path uploadPath = Paths.get(uploadDir);

                // Tạo thư mục nếu chưa tồn tại
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                // Lưu file vào hệ thống
                Path filePath = uploadPath.resolve(fileName);
                Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

                // Trả về đường dẫn file đã lưu
                fileUrl = "/resources/assets/uploads/cv/" + email + "/" + fileName;
                cvDTO.setFileName(fileUrl);
            }

            // Tạo ApplyJobDTO để lưu thông tin ứng tuyển
            ApplyJobDTO applyJobDTO = new ApplyJobDTO();
            LocalDate localDate = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String createdAt = localDate.format(formatter); // Lấy ngày hiện tại
            applyJobDTO.setCreatedAt(createdAt); // Gán ngày tạo
            applyJobDTO.setNameCv(cvDTO.getFileName()); // Gán tên file CV
            Recruitment recruitment = recruitmentService.getRecruitment(recruitmentId); // Lấy thông tin tuyển dụng
            applyJobDTO.setRecruitment(recruitment); // Gán thông tin tuyển dụng
            applyJobDTO.setStatus(0); // Trạng thái mặc định là 0 (chưa duyệt)
            applyJobDTO.setText(text); // Gán nội dung mô tả
            applyJobDTO.setUser(user); // Gán thông tin người ứng tuyển
            applyJobService.saveApplyJob(applyJobDTO); // Lưu thông tin ứng tuyển vào cơ sở dữ liệu
            
            return ResponseEntity.ok("true"); // Trả về thành công
        } catch (IOException e) {
            return ResponseEntity.ok("false"); // Trả về thất bại nếu có lỗi khi lưu file
        }
    }

    // API để xử lý ứng tuyển công việc không có file đính kèm
    @PostMapping("/apply-job1")
    public ResponseEntity<String> uploadFileApplyPost1(@RequestParam("idRe") int recruitmentId,
            @RequestParam("text") String text, @AuthenticationPrincipal MyUserDetails currentUser) {
        
        String email = currentUser.getUsername();
        User user = userService.getUserByEmail(email); // Lấy thông tin người dùng
        
        // Kiểm tra xem người dùng đã ứng tuyển vào công việc này chưa
        List<ApplyJobDTO> list = applyJobService.getApplyJobsDTOByUserIdAndRecruitmentId(user.getId(), recruitmentId);
        if (!list.isEmpty() && list != null) {
            return ResponseEntity.ok("exitsUserApplyJob"); // Trả về thông báo nếu đã ứng tuyển
        }
        
        // Lấy thông tin CV của người dùng
        CvDTO cvDTO = cvService.getCvDTOByUserId(user.getId());
        if (cvDTO == null) {
            return ResponseEntity.ok("notExitsCv"); // Nếu người dùng chưa có CV thì trả về thông báo
        }

        // Tạo ApplyJobDTO để lưu thông tin ứng tuyển
        ApplyJobDTO applyJobDTO = new ApplyJobDTO();
        LocalDate localDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String createdAt = localDate.format(formatter);
        applyJobDTO.setCreatedAt(createdAt); // Gán ngày tạo
        applyJobDTO.setNameCv(cvDTO.getFileName()); // Gán tên CV
        Recruitment recruitment = recruitmentService.getRecruitment(recruitmentId); // Lấy thông tin tuyển dụng
        applyJobDTO.setRecruitment(recruitment); // Gán thông tin tuyển dụng
        applyJobDTO.setStatus(0); // Trạng thái mặc định là 0 (chưa duyệt)
        applyJobDTO.setText(text); // Gán mô tả
        applyJobDTO.setUser(user); // Gán người ứng tuyển
        applyJobService.saveApplyJob(applyJobDTO); // Lưu thông tin ứng tuyển
        
        return ResponseEntity.ok("true"); // Trả về thành công
    }
}
