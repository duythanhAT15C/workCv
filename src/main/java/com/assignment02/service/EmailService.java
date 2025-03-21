package com.assignment02.service;

public interface EmailService {
	public boolean sendVerificationEmail(String toEmail, String confirmationUrl);
}
