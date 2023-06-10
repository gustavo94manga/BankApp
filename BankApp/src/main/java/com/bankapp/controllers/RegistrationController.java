package com.bankapp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.bankapp.entities.User;
import com.bankapp.service.RegistrationService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost/"})
public class RegistrationController {
	private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	private RegistrationService registrationService;
	
	 @Autowired
	    public RegistrationController(RegistrationService registrationService) {
	        this.registrationService = registrationService;
	    }

	
	@PostMapping("/register")
	public void Register(@RequestBody User user) {
		 String hashedPassword = passwordEncoder.encode(user.getPassword());
		    user.setPassword(hashedPassword);
	}
	
	  @PostMapping("/register")
	    public void register(@RequestBody User user) {
	        if (!registrationService.isValidEmail(user.getEmail()) || 
	            !registrationService.isValidPassword(user.getPassword())) {
	            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid email or password");
	        }
	        String hashedPassword = registrationService.hashPassword(user.getPassword());
	        user.setPassword(hashedPassword);
	        String mfaCode = registrationService.generateMfaCode();
	        // store user and mfaCode in database, send mfaCode to user's email...
	    }

}
