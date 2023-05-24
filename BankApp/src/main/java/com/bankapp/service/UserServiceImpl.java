package com.bankapp.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bankapp.entities.User;
import com.bankapp.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepo;
	
	@Override
	public User findByUsername(String username) {
		return userRepo.findByUsername(username);
	}

	@Override
	public User create(User user) {
		return userRepo.saveAndFlush(user);
	}

	@Override
	public User update(int id, User user) {
		User existing = userRepo.findById(id).get();
		if(existing != null) {
			existing.setUsername(user.getUsername());
			existing.setPassword(user.getPassword());
			existing.setEmail(user.getEmail());
			existing.setPhone(user.getPhone());
			userRepo.saveAndFlush(existing);
			return existing;
		} else {
		return null;
		}
	}

	@Override
	public boolean deleteById(int id) {
		Boolean deleted = false;
		User toDelete = userRepo.findById(id).get();
		if(toDelete != null) {
			userRepo.delete(toDelete);
			deleted = true;
		}
		return deleted;
	}

	@Override
	public Optional<User> findById(int id) {
		return userRepo.findById(id);
	}

	@Override
	public List<User> listAllUsers() {
		return userRepo.findAll();
	}


}
