package com.assignment02.config;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.assignment02.entity.User;

public interface UserRepository extends CrudRepository<User, Long>{
	@Query("SELECT u FROM User u WHERE u.email = :email")
    public User getUserByEmail(@Param("email") String email);
}
