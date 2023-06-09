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

class TransactionTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Transaction transaction;

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
		transaction = em.find(Transaction.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		transaction = null;
	}

	@Test
	void testTransactionEntityMapping() {
		assertNotNull(transaction);
		assertEquals(transaction.getDescription(),null);
	
	}

	@Test
	void transaction_MTM_user() {
		assertNotNull(transaction);
		assertEquals(1, transaction.getTransactionAmount());
		assertFalse(transaction.getUsers().isEmpty());
	}
	
	@Test
	void transaction_MTO_user() {
		assertNotNull(transaction);
		assertNotNull(transaction.getTransactionType());
		assertEquals(10.00, transaction.getTransactionType().getPayment());
		assertEquals(1, transaction.getTransactionType().getId());
	}
	
	@Test
	void transaction_MTO_loan() {
		assertNotNull(transaction);
		assertNotNull(transaction.getLoan());
		assertEquals("Home", transaction.getLoan().getLoanType());
		assertEquals(1, transaction.getTransactionType().getId());
	}
	
	@Test
	void transaction_MTM_account() {
		assertNotNull(transaction);
		assertNotNull(transaction.getAccounts());
		assertFalse(transaction.getUsers().isEmpty());
	}
	
	
	
	
	
	
	
	
	
	
	

}
