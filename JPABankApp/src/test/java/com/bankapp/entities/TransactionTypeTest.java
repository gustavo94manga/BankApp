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

class TransactionTypeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private TransactionType transactionType;

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
		transactionType = em.find(TransactionType.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		transactionType = null;
	}

	@Test
	void test_TransactionTypeMapping() {
		assertNotNull(transactionType);
		assertEquals(10.00, transactionType.getPayment());
		
	}

	@Test
	void test_TransactionType_OTM_Transaction() {
		assertNotNull(transactionType);
		assertNotNull(transactionType.getTransactions());
		assertFalse(transactionType.getTransactions().isEmpty());
		
	}
	
}
