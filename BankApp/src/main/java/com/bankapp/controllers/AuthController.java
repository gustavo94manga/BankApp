package com.bankapp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;

import com.bankapp.service.AuthService;

@RestController
//@CrossOrigin({"*", "http://localhost/"})
@CrossOrigin(origins = "http://localhost:4200")
public class AuthController {
  @Autowired
  private AuthService authService; 
  
  
}
