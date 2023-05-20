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

class BankAddressTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private BankAddress bankAddress;

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
		bankAddress = em.find(BankAddress.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		bankAddress = null;
	}

	@Test
	void testUserEntityMapping() {
		assertNotNull(bankAddress);
		assertNotNull("999 Main St.", bankAddress.getAddress());
		assertEquals("Miami", bankAddress.getCity());
		
	}

}
