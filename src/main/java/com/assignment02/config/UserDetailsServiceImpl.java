package com.assignment02.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.assignment02.entity.User;
import com.assignment02.repository.UserRepository;

public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
    private UserRepository userRepository;
     
    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        User user = userRepository.findByEmail(username);
        System.out.println(username);
        if (user == null) {
            throw new UsernameNotFoundException("Could not find user");
        }
        System.out.println(user.getRoles());
        return new MyUserDetails(user);
    }

}
