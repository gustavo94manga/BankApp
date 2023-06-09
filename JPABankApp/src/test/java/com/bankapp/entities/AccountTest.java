package com.bankapp.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class AccountTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Account account;

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
		account = em.find(Account.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		account = null;
	}

	@Test
	void testUserEntityMapping() {
		assertNotNull(account);
		assertEquals("Checking", account.getAccountType());
		assertEquals(123456789, account.getAccountNumber());
		assertEquals(50.00, account.getBalance());
	}

	@Test
	void account_MTO_user() {
		assertNotNull(account);
		assertEquals("Checking", account.getAccountType());
	
	}
	
	@Test
	void account_MTM_transaction() {
		assertNotNull(account);
		assertNotNull(account.getTransactions());
		assertFalse(account.getTransactions().isEmpty());
	}

}
