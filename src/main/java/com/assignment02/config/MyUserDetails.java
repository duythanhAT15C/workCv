package com.assignment02.config;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.assignment02.entity.Role;
import com.assignment02.entity.User;

public class MyUserDetails implements UserDetails {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private User user;
    
    public MyUserDetails(User user) {
        this.user = user;
    }
    public String getFullName() {
    	return user.getFullName();
    }
    public int getId() {
    	return user.getId();
    }
    public User getUser() {
    	return user;
    }
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Set<Role> roles = user.getRoles();
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
        
        for (Role role : roles) {
        	System.out.println("Role: " + role.getRoleName());
            authorities.add(new SimpleGrantedAuthority(role.getRoleName()));
        }
        System.out.println(authorities);
        return authorities;
	}

	@Override
    public String getPassword() {
        return user.getPassword();
    }
 
    @Override
    public String getUsername() {
        return user.getEmail();
    }
 
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }
 
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }
 
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }
 
    @Override
    public boolean isEnabled() {
        return true;
    }

}
