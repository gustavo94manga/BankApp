package com.bankapp.controllers;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bankapp.entities.User;
import com.bankapp.service.RegistrationServiceImpl;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost/"})
public class RegistrationController {
	
	private RegistrationServiceImpl registrationService;
	
	public RegistrationController(RegistrationServiceImpl registratoinService) {
		this.registrationService = registrationService;
	}
	
	@PostMapping("register")
	public void register(@RequestBody User user) {
		registrationService.register(user.getUsername(), user.getPassword());
	}
	    

}
