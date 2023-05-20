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

class EmployeeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Employee employee;

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
		employee = em.find(Employee.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		employee = null;
	}

	@Test
	void testUserEntityMapping() {
		assertNotNull(employee);
		assertNotNull("Edwin", employee.getFirstName());
		assertEquals("Flatto", employee.getLastName());
		assertEquals("Manager", employee.getRole());
		
	}
	//Employee test

}