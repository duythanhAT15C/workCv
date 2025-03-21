package com.assignment02.service;


import com.assignment02.config.MyUserDetails;

public interface VerificationCodeService {
	public boolean verifyCode(String email, String code, MyUserDetails currentDetails);
}
