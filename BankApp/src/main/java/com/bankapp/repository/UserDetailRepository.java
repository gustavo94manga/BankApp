package com.bankapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bankapp.entities.UserDetail;

public interface UserDetailRepository extends JpaRepository<UserDetail, Integer>{

	
}
