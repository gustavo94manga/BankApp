package com.bankapp.service;

import java.util.Random;
import java.util.regex.Pattern;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class RegistrationServiceImpl implements RegistrationService {
	
    private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();


	@Override
	public boolean isValidEmail(String email) {
		String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
	    Pattern pat = Pattern.compile(emailRegex);
	    if (email == null)
	        return false;
	    return pat.matcher(email).matches();
	}

	@Override
	public boolean isValidPassword(String password) {
		 String passwordRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,20}$";
		    Pattern pat = Pattern.compile(passwordRegex);
		    if (password == null)
		        return false;
		    return pat.matcher(password).matches();
	}

	@Override
	public String generateMfaCode() {
		 int code = new Random().nextInt(999999);
	        return String.format("%06d", code);
	}
	
	@Override
	 public String hashPassword(String password) {
	        return passwordEncoder.encode(password);
	    }

}
