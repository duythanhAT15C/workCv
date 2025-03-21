package com.assignment02.dao.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.assignment02.dao.RoleDAO;
import com.assignment02.dao.UserDAO;
import com.assignment02.entity.Role;
import com.assignment02.entity.User;
import com.assignment02.repository.RoleRepository;

@Repository
public class RoleDAOImpl implements RoleDAO {
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private UserDAO userDAO;

	@Override
	public Role getRole(int idRole) {
		return roleRepository.findById(idRole).orElse(null);
	}

	@Override
	public Role getRoleByName(String roleName) {
		// TODO Auto-generated method stub
		return roleRepository.findByRoleName(roleName);
	}

	@Override
	public Set<Role> getAllRole() {
		// TODO Auto-generated method stub
		List<Role> roleList = roleRepository.findAll();
		return new HashSet<>(roleList);
	}

	@Override
	public Set<Role> getRoleIdByEmail(String email) {
		// TODO Auto-generated method stub
		User user = userDAO.getUserByEmail(email);
		Set<Role> roles = user.getRoles();
		return roles;
	}

	@Override
	public Set<Role> getRoleByUserId(int userId) {
		// TODO Auto-generated method stub
		Set<Role> roles = roleRepository.findRolesByUserId(userId);
		return roles;
	}

}
