package com.assignment02.service.impl;

import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assignment02.dao.RoleDAO;
import com.assignment02.entity.Role;
import com.assignment02.repository.RoleRepository;
import com.assignment02.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService{
	@Autowired
	private RoleDAO roleDAO;
	@Autowired
    private RoleRepository roleRepository;
	@Override
	@Transactional
	public Role getRole(int idRole) {
		return roleDAO.getRole(idRole);
	}
	
	public Role findById(int roleId) {
        return roleRepository.findById(roleId).orElse(null);
    }

	@Override
	public Role getRoleByName(String roleName) {
		// TODO Auto-generated method stub
		return roleDAO.getRoleByName(roleName);
	}

	@Override
	public Set<Role> getAllRole() {
		// TODO Auto-generated method stub
		return roleDAO.getAllRole();
	}

	@Override
	public Set<Role> getRoleIdByEmail(String email) {
		// TODO Auto-generated method stub
		return roleDAO.getRoleIdByEmail(email);
	}

	@Override
	public Set<Role> getRoleByUserId(int userId) {
		// TODO Auto-generated method stub
		return roleDAO.getRoleByUserId(userId);
	}
}
