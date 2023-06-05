package com.bankapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bankapp.entities.Account;
import com.bankapp.entities.User;

public interface AccountRepository extends JpaRepository<User, Integer> {
	User findByUsername(String username);
	Account findAccountById_Username(int id, String username);
}

