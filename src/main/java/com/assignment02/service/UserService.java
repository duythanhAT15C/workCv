package com.assignment02.service;

import java.util.Set;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dto.RoleDTO;
import com.assignment02.dto.UserDTO;
import com.assignment02.entity.Role;
import com.assignment02.entity.User;

public interface UserService {
	public void saveUser(UserDTO userDTO, MyUserDetails myUserDetails);
	public UserDTO getUserByEmailAndPass(String email, String pass);
	public UserDTO getUserDTOByEmail(String email);
	public UserDTO getUserIdByEmail(String email);
	public User getUserByEmail(String email);
//	public Integer getRoleIdByEmail(String email);
	public Set<RoleDTO> getRoleDTOIdByEmail(String email);
	public Set<Role> getRoleIdByEmail(String email);
	public String createVerificationToken(User user);
	public boolean verifyCode(String email, String code, MyUserDetails currentDetails);
}
