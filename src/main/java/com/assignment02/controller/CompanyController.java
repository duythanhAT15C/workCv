package com.assignment02.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dto.CompanyDTO;
import com.assignment02.dto.UserDTO;
import com.assignment02.service.CompanyService;
import com.assignment02.service.FollowCompanyService;
import com.assignment02.service.UserService;

@Controller // Đánh dấu lớp này là một Spring Controller
@RequestMapping("/company") // Định nghĩa URL chung cho các API liên quan đến công ty
public class CompanyController {

    // Inject các service cần thiết vào controller
    @Autowired
    private CompanyService companyService;
    @Autowired
    private UserService userService;
    @Autowired
    private FollowCompanyService followCompanyService;

    // API này sẽ xử lý việc hiển thị chi tiết công ty
    @GetMapping("/detail-company/{companyId}") 
    public String detailCompany(@PathVariable("companyId") int theId, Model model, @AuthenticationPrincipal MyUserDetails currentUser) {
        
        // Kiểm tra nếu người dùng đã đăng nhập
        if (currentUser != null) {
            String email = currentUser.getUsername(); // Lấy email người dùng hiện tại
            CompanyDTO companyDTO = companyService.getCompanyDTOById(theId); // Lấy thông tin công ty theo ID
            UserDTO userDTO = userService.getUserDTOByEmail(email); // Lấy thông tin người dùng từ email
            // Kiểm tra xem người dùng đã theo dõi công ty này chưa
            boolean checkExistFollowCompany = followCompanyService.checkExistFollowCompany(userDTO.getId(), companyDTO.getId());
            
            // Thêm các dữ liệu vào model để truyền vào view (giao diện)
            model.addAttribute("company", companyDTO);
            model.addAttribute("user", userDTO);
            model.addAttribute("checkExistFollowCompany", checkExistFollowCompany); // Truyền thông tin theo dõi công ty
        } else {
            // Nếu người dùng chưa đăng nhập, chỉ hiển thị thông tin công ty
            CompanyDTO companyDTO = companyService.getCompanyDTOById(theId);
            model.addAttribute("company", companyDTO);
        }
        
        // Trả về tên của view, trong trường hợp này là trang detail-company
        return "detail-company";
    }
}
