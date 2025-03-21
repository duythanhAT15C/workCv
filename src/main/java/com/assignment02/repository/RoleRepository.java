package com.assignment02.repository;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.assignment02.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {
	Role findByRoleName(String roleName);

	@Query("SELECT r FROM Role r JOIN r.users u WHERE u.id = :userId")
	Set<Role> findRolesByUserId(@Param("userId") Integer userId);
}
