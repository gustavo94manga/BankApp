package com.bankapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.bankapp.entities.User;
import com.bankapp.repository.UserRepository;

@Service
public class AuthServiceImpl implements AuthService {
    
    @Autowired
    private UserRepository userRepo;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    
    @Override
    public User register(User user) {
        String encrypted = passwordEncoder.encode(user.getPassword());
        user.setPassword(encrypted);
        user.setEnabled(true);
        return userRepo.saveAndFlush(user);
    }

    @Override
    public User getUserByUsername(String username) {
        return userRepo.findByUsername(username);
    }
}
