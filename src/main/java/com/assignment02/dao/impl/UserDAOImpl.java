package com.assignment02.dao.impl;

import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.assignment02.config.MyUserDetails;
import com.assignment02.dao.UserDAO;
import com.assignment02.entity.User;
import com.assignment02.repository.UserRepository;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public void saveUser(User user, MyUserDetails currentUser) {
		if (currentUser != null) {
			String email = currentUser.getUsername(); // Lấy email từ MyUserDetails (hoặc các thông tin khác)

			User existingUser = userRepository.findByEmail(email);

			if (existingUser != null) {
				// Cập nhật thông tin người dùng
				existingUser.setFullName(user.getFullName());
				existingUser.setEmail(user.getEmail());
				existingUser.setAddress(user.getAddress());
				existingUser.setPhoneNumber(user.getPhoneNumber());
				existingUser.setDescription(user.getDescription());
				existingUser.setImage(user.getImage());
				existingUser.setCv(user.getCv());
				existingUser.setStatus(user.getStatus());
				existingUser.setVerificationToken(user.getVerificationToken());
				userRepository.save(existingUser);
			} else {
				// Tạo mới người dùng nếu chưa tồn tại
				user.setPassword(passwordEncoder.encode(user.getPassword()));
				userRepository.save(user);
			}
		} else {
			// Tạo mới người dùng nếu chưa tồn tại
			user.setPassword(passwordEncoder.encode(user.getPassword()));
			userRepository.save(user);
		}
	}

	@Override
	public User getUserByEmailAndPass(String email, String pass) {
//		Session session = sessionFactory.getCurrentSession();
//		Query<User> query = session.createQuery("from User where email=:email and password=:password", User.class);
//		query.setParameter("email", email);
//		query.setParameter("password", pass);
//		User user = query.uniqueResult();
		return userRepository.findByEmailAndPassword(email, pass);
	}

	@Override
	public User getUserByEmail(String email) {
		// TODO Auto-generated method stub
		return userRepository.findByEmail(email);
	}

	@Override
	public User getUserIdByEmail(String email) {
		// TODO Auto-generated method stub
		return userRepository.findIdByEmail(email);
	}

	@Override
	public User getUserById(int userId) {
		// TODO Auto-generated method stub
		return userRepository.findById(userId)
				.orElseThrow(() -> new RuntimeException("User not found with id: " + userId));
	}

	@Override
	public User getUserByCvId(int idCv) {
		// TODO Auto-generated method stub
		return userRepository.findByCvId(idCv);
	}

	// Hàm tạo, lưu và trả về token xác thực email
	@Override
	public String createVerificationToken(User user) {
		// TODO Auto-generated method stub
		String token = UUID.randomUUID().toString();
		user.setVerificationToken(token);
		userRepository.save(user);
		return token;
	}

}
