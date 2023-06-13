package com.bankapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bankapp.entities.UserAddress;

public interface UserAddressRepository extends JpaRepository<UserAddress, Integer>{

}
