package com.assignment02.dao;

import java.util.Set;

import com.assignment02.entity.Role;

public interface RoleDAO {
	public Role getRole(int idRole);
	public Role getRoleByName(String roleName);
	public Set<Role> getAllRole();
	public Set<Role> getRoleIdByEmail(String email);
	public Set<Role> getRoleByUserId(int userId);
}
