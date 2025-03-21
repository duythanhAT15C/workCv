package com.assignment02.service;

import java.util.Set;

import com.assignment02.entity.Role;

public interface RoleService {
	public Role getRole(int idRole);

	public Role getRoleByName(String roleName);

	public Set<Role> getAllRole();

	public Set<Role> getRoleIdByEmail(String email);

	public Set<Role> getRoleByUserId(int userId);
}
