package com.bankapp.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class BankTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Bank bank;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPABankApp");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		bank = em.find(Bank.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		bank = null;
	}

	@Test
	void testUserEntityMapping() {
		assertNotNull(bank);
		assertNotNull(bank.getName());
		
	}
	
	@Test
	void bank_MTM_user() {
		assertNotNull(bank);
		assertNotNull(bank.getUsers());
		assertFalse(bank.getUsers().isEmpty());
	}
	
	@Test
	void Bank_OTO_BankAddress() {
		assertNotNull(bank);
		assertEquals(1, bank.getBankAddress().getId());
	}
	
	

}