package com.assignment02.dao;


import com.assignment02.config.MyUserDetails;
import com.assignment02.entity.User;

public interface UserDAO {
	public void saveUser(User user, MyUserDetails myUserDetails);
	public User getUserByEmailAndPass(String email, String pass);
	public User getUserByEmail(String email);
	public User getUserIdByEmail(String email);
	public User getUserById(int userId);
	public User getUserByCvId(int idCv);
//	public Integer getRoleIdByEmail(String email);
	public String createVerificationToken(User user);
	
}
