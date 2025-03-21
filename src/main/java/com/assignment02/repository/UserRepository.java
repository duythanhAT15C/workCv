package com.assignment02.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import com.assignment02.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	User findByEmail(String email);

	User findByEmailAndPassword(String email, String password);

	User findIdByEmail(String email);

	User findByCvId(int idCv);

	User findByVerificationToken(String token);
}
