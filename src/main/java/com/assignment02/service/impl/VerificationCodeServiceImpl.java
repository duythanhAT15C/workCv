package com.assignment02.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dto.UserDTO;
import com.assignment02.entity.User;
import com.assignment02.service.UserService;
import com.assignment02.service.VerificationCodeService;

@Service
public class VerificationCodeServiceImpl implements VerificationCodeService {
	@Autowired
	private UserService userService;

	@Override
	public boolean verifyCode(String email, String token, MyUserDetails currentDetails) {
		// TODO Auto-generated method stub
		User user = userService.getUserByEmail(email);

		if (user == null) {
			return false; // Người dùng không tồn tại
		}

		// Kiểm tra token có khớp không
		if (token.equals(user.getVerificationToken())) {
			// Xác thực thành công → Xóa token để tránh bị dùng lại
			user.setVerificationToken(null);
			UserDTO userDTO = new UserDTO();
			userDTO.setId(user.getId());
			userDTO.setAddress(user.getAddress());
			userDTO.setDescription(user.getDescription());
			userDTO.setEmail(user.getEmail());
			userDTO.setFullName(user.getFullName());
			userDTO.setImage(user.getImage());
			userDTO.setPassword(user.getPassword());
			userDTO.setPhoneNumber(user.getPhoneNumber());
			userDTO.setStatus(1);
			userDTO.setRoles(user.getRoles());
			if(user.getCv() == null) {
				userDTO.setCvId(0);
			}
			else {
				userDTO.setCvId(user.getCv().getId());
			}
			userDTO.setVerificationToken(null);
			userService.saveUser(userDTO, currentDetails);
			return true;
		}

		return false; // Token sai
	}

}
