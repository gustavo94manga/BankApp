package com.bankapp.service;

import com.bankapp.entities.User;

public interface AuthService {

	public User register(User user);
	public User getUserByUsername(String username);
	
}
