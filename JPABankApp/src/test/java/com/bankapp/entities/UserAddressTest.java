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

class UserAddressTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private UserAddress userAddress;

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
		userAddress = em.find(UserAddress.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		userAddress = null;
	}

	@Test
	void testUserEntityMapping() {
		assertNotNull(userAddress);
		assertEquals("123 Main St.", userAddress.getAddress());
		assertEquals("Houston", userAddress.getCity());
		assertEquals("Tx", userAddress.getState());
		
	}

}
