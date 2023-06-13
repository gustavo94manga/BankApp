package com.bankapp.service;

import com.bankapp.entities.UserDetail;
import com.bankapp.repository.UserDetailRepository;

public class UserDetailServiceImpl implements UserDetailService {

	private UserDetailRepository userDetailRepo;
	
	@Override
	public UserDetail saveUserDetails(UserDetail userDetail) {
		return userDetailRepo.save(userDetail);
	}

}
