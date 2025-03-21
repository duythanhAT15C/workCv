package com.assignment02.service.impl;

import java.util.HashSet;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dao.CvDAO;
import com.assignment02.dao.RoleDAO;
import com.assignment02.dao.UserDAO;
import com.assignment02.dto.RoleDTO;
import com.assignment02.dto.UserDTO;
import com.assignment02.entity.Cv;
import com.assignment02.entity.Role;
import com.assignment02.entity.User;
import com.assignment02.service.UserService;
import com.assignment02.service.VerificationCodeService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;

	@Autowired
	private RoleDAO roleDAO;
	@Autowired
	private CvDAO cvDAO;
	@Autowired
	private VerificationCodeService verificationCodeService;

	@Override
	@Transactional
	public void saveUser(UserDTO userDTO, MyUserDetails myUserDetails) {
		User user = convertToEntity(userDTO);
		userDAO.saveUser(user, myUserDetails);
	}

	// Hàm chuyển từ DTO sang entity
	public User convertToEntity(UserDTO userDTO) {
		if (userDTO == null) {
			return null;
		}

//		    User user = userDAO.getUser(userDTO.getId());
		User user = new User();
		user.setId(userDTO.getId());
		user.setAddress(userDTO.getAddress());
		user.setDescription(userDTO.getDescription());
		user.setEmail(userDTO.getEmail());
		user.setFullName(userDTO.getFullName());
		user.setImage(userDTO.getImage());
		user.setPassword(userDTO.getPassword());
		user.setPhoneNumber(userDTO.getPhoneNumber());
		user.setStatus(userDTO.getStatus());
		user.setVerificationToken(userDTO.getVerificationToken());
		Set<Role> roles = new HashSet<>();
		if (userDTO.getRoles() == null) {
			Role role = roleDAO.getRole(userDTO.getRoleId());
			roles.add(role);
		} else {
			for (Role role : userDTO.getRoles()) {
				Role roleAdd = roleDAO.getRole(role.getId());
				roles.add(roleAdd);
			}
		}
		user.setRoles(roles);
		for (Role role : user.getRoles()) {
			if (role.getId() == 1) {
				User user2 = userDAO.getUserByEmail(user.getEmail());
				if (user2 != null && userDTO.getCvId() != 0) {
					Cv cv = cvDAO.getCv(user2.getCv().getId());
					if (cv != null) {
						user.setCv(cv);
					}

				}
			}
		}
		return user;
	}

	// Hàm chuyển từ DTO sang entity
	private UserDTO convertToDTO(User user) {
		if (user == null) {
			return null;
		}

//			    User user = userDAO.getUser(userDTO.getId());
		UserDTO userDTO = new UserDTO();
		userDTO.setId(user.getId());
		userDTO.setAddress(user.getAddress());
		userDTO.setDescription(user.getDescription());
		userDTO.setEmail(user.getEmail());
		userDTO.setFullName(user.getFullName());
		userDTO.setImage(user.getImage());
		userDTO.setPassword(user.getPassword());
		userDTO.setPhoneNumber(user.getPhoneNumber());
		userDTO.setStatus(user.getStatus());
		User user2 = userDAO.getUserByEmail(user.getEmail());
		if (user2.getCv() != null) {
			userDTO.setCvId(user2.getCv().getId());
		}

//			userDTO.setRoleId(user.getRole().getId());
		userDTO.setRoles(user.getRoles());
		return userDTO;
	}

	// Hàm chuyển từ DTO sang entity
	private Set<RoleDTO> convertToRoleDTO(Set<Role> roles) {
		if (roles == null) {
			return null;
		}
		Set<RoleDTO> roleDTOs = new HashSet<>();
		for (Role role : roles) {
			RoleDTO roleDTO = new RoleDTO();
			roleDTO.setId(role.getId());
			roleDTO.setRoleName(role.getRoleName());
			roleDTOs.add(roleDTO);
		}
		return roleDTOs;
	}

	@Override
	@Transactional
	public UserDTO getUserByEmailAndPass(String email, String pass) {
		User user = userDAO.getUserByEmailAndPass(email, pass);
		UserDTO userDTO = convertToDTO(user);
		return userDTO;
	}

	@Override
	public User getUserByEmail(String email) {
		// TODO Auto-generated method stub
		return userDAO.getUserByEmail(email);
	}

	@Override
	public UserDTO getUserIdByEmail(String email) {
		// TODO Auto-generated method stub
		User user = userDAO.getUserByEmail(email);
		UserDTO userDTO = convertToDTO(user);
		return userDTO;
	}

	@Override
	public UserDTO getUserDTOByEmail(String email) {
		// TODO Auto-generated method stub
		User user = userDAO.getUserByEmail(email);
		user.setImage(user.getImage());
		UserDTO userDTO = convertToDTO(user);
		return userDTO;
	}

	@Override
	public Set<RoleDTO> getRoleDTOIdByEmail(String email) {
		// TODO Auto-generated method stub
		Set<Role> roles = roleDAO.getRoleIdByEmail(email);
		return convertToRoleDTO(roles);
	}

	@Override
	public Set<Role> getRoleIdByEmail(String email) {
		// TODO Auto-generated method stub
		return roleDAO.getRoleIdByEmail(email);
	}



	@Override
	public boolean verifyCode(String email, String code, MyUserDetails currentDetails) {
		// TODO Auto-generated method stub
		return verificationCodeService.verifyCode(email, code, currentDetails);
	}

	@Override
	public String createVerificationToken(User user) {
		// TODO Auto-generated method stub
		return userDAO.createVerificationToken(user);
	}

}
