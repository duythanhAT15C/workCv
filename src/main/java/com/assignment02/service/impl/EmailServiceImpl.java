package com.assignment02.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.assignment02.service.EmailService;

@Service
public class EmailServiceImpl implements EmailService {
	@Autowired
	private JavaMailSender javaMailSender;
	@Value("${spring.mail.username}")
	private String fromEmail;

	@Override
	public boolean sendVerificationEmail(String toEmail, String token) {
		// TODO Auto-generated method stub
		try {
			String verificationLink = "http://localhost:8080/Assignment02/user/confirm?email=" + toEmail + "&token="
					+ token;
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(toEmail);
			message.setSubject("Xác thực tài khoản");
			message.setText("Vui lòng nhấn vào đường link sau để xác thực tài khoản: " + verificationLink);
			message.setFrom(fromEmail);
			javaMailSender.send(message);
			return true;
		} catch (MailException e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return false;
		}
	}

}
