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

class LoanTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Loan loan;

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
		loan = em.find(Loan.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		loan = null;
	}

	@Test
	void testUserEntityMapping() {
		assertNotNull(loan);
		assertEquals("Home", loan.getLoanType());
		assertEquals(25000, loan.getLoanAmount());
		assertEquals(2.5, loan.getInterestRate());
		
	}
	
	@Test
	void test_Loan_To_Transaction_OTM() {
		assertNotNull(loan);
		assertNotNull(loan.getTransactions());
		assertFalse(loan.getTransactions().isEmpty());
		
	}

	@Test
	void test_Loan_To_User_MTO() {
		assertNotNull(loan);
		assertNotNull(loan.getUser());
		assertEquals("admin@java.com", loan.getUser().getEmail());
		assertEquals(1, loan.getUser().getId());
		
	}
	
	
	
	
}
