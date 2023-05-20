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

class UserTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	void user_OTO_user_address() {
		assertNotNull(user);
		assertEquals(1, user.getUserAddress().getId());
	}

	@Test
	void user_OTM_account() {
		assertNotNull(user);
		assertFalse(user.getUserAccounts().isEmpty());
	}

	@Test
	void user_OTO_userDetail() {
		assertNotNull(user);
		assertEquals("John", user.getUserDetail().getFirstName());
	}

	@Test
	void user_MTM_transaction() {
		assertNotNull(user);
		assertFalse(user.getTransactions().isEmpty());
	}
	
	@Test
	void user_OTM_loan() {
		assertNotNull(user);
		assertFalse(user.getLoans().isEmpty());
	}
	
	@Test
	void user_MTM_bank() {
		assertNotNull(user);
		assertNotNull(user.getBanks());
		assertFalse(user.getBanks().isEmpty());
	}


}
