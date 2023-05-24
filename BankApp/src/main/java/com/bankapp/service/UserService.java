package com.bankapp.service;

import java.util.Optional;

import com.bankapp.entities.User;

public interface UserService {

	User findByUsername(String username);
	User create(User user);
	User update(int id, User user);
	boolean deleteById(int id);
}
