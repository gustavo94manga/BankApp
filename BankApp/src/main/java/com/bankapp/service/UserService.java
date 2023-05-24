package com.bankapp.service;

import java.util.List;
import java.util.Optional;

import com.bankapp.entities.User;

public interface UserService {
	List<User> listAllUsers();
	User findByUsername(String username);
	User create(User user);
	User update(int id, User user);
	boolean deleteById(int id);
	Optional<User> findById(int id);
}
