package com.bankapp.controllers;

import java.security.Principal;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bankapp.entities.User;
import com.bankapp.entities.UserAddress;
import com.bankapp.entities.UserDetail;
import com.bankapp.repository.UserAddressRepository;
import com.bankapp.repository.UserDetailRepository;
import com.bankapp.service.AuthService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost/"})
//@CrossOrigin(origins = "http://localhost:4200")
public class RegistrationController {
	
	@Autowired
	private AuthService authService;
	
	@Autowired
	private UserAddressRepository userAddressRepository;  
	
	@Autowired
	private UserDetailRepository userDetailRepository;
	
	@PostMapping("/register")
	public User register(@RequestBody User user, HttpServletResponse res) {
		if (user == null) {
			res.setStatus(400);
			return null;
		}
		UserAddress userAddress = user.getUserAddress();
		if (userAddress != null) {
			userAddress = userAddressRepository.save(userAddress);  // Save UserAddress to the database
			user.setUserAddress(userAddress);
		}
		UserDetail userDetail = user.getUserDetail();
		if(userDetail != null) {
			userDetail = userDetailRepository.save(userDetail);
			user.setUserDetail(userDetail);
		}
		user = authService.register(user);
		return user;
	}
	
	@GetMapping("authenticate")
	public User authenticate(Principal principal, HttpServletResponse res) {
		if(principal == null) {
			res.setStatus(401);
			res.setHeader("WWW-Authenticate", "Basic");
			return null;
		}
		return authService.getUserByUsername(principal.getName());
		
	}
	    

}
