package com.bankapp.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.bankapp.entities.UserAddress;
import com.bankapp.repository.UserAddressRepository;

public class UserAddressServiceImpl implements UserAddressService {

    private final UserAddressRepository userAddressRepository;

    
    public UserAddressServiceImpl(UserAddressRepository userAddressRepository) {
        this.userAddressRepository = userAddressRepository;
    }

    @Override
    public UserAddress saveUserAddress(UserAddress userAddress) {
        return userAddressRepository.save(userAddress);
    }

}
