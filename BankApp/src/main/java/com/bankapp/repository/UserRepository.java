package com.bankapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bankapp.entities.User;

public interface UserRepository extends JpaRepository<User, Integer>{
	
	User findById(int userId);
	User findByUsername(String username);
	
}
