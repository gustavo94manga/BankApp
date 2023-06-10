package com.bankapp.service;

public interface RegistrationService {
	  public boolean isValidEmail(String email);
	  public boolean isValidPassword(String password);
	  public String generateMfaCode();
	  String hashPassword(String password);
	  void register(String username, String password);
}
