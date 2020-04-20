//********************************************//
// Dima Bognen, Jonathan Pirca, Abel Rojas, Manish Sudani
// Controls access to customer informaiton
//********************************************//

package com.travelexperts.controllers;


import java.util.ArrayList;
import java.util.Hashtable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.travelexperts.model.Customer;
import com.travelexperts.model.User;
import com.travelexperts.security.JwtVal;
import com.travelexperts.service.CustomerService;

@CrossOrigin
@RestController
@RequestMapping("/customers")

public class CustomerController {
	
	private Logger logger = LoggerFactory.getLogger(CustomerController.class); 
	
	@Autowired
	CustomerService custService;

	@RequestMapping("/all")  
	public ArrayList<Customer> getAll() {
		//logger.info("all was called");
		return custService.getAll();
	}

	@RequestMapping("{id}")
	public Customer getCustomer(@PathVariable("id") String id) {
		return custService.getCustomer(id);
	}
	
	@PostMapping("/insert_customer")
	public int addCustomer(Customer cust) {
		return custService.insertCustomer(cust);
	}
	
	@PutMapping("/update_customer")
	public void updateCustomer(Customer cust) {
		custService.updateCustomer(cust);
	}
	
	// Controller which gets token converts it to string and returns user's full name
	@PostMapping("/get_full_name")
	public String getFullName(String token) {
		
		// Extract customer id from token
		//UserDetail details = (UserDetail) authentication.getPrincipal();
		//String token = details.getToken();
		JwtVal qwerty = new JwtVal();
		User currentUser = qwerty.validate(token);
		
		return custService.getCustName(currentUser.getCustomerId());
	}
}
