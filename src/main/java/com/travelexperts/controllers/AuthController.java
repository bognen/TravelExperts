//********************************************//
// Dima Bognen, Jonathan Pirca, Abel Rojas, Manish Sudani
// Controls access to sensitive informaiton
//********************************************//

package com.travelexperts.controllers;

import com.travelexperts.model.Booking;
import com.travelexperts.model.Customer;
import com.travelexperts.model.User;
import com.travelexperts.model.UserDetail;
import com.travelexperts.security.JwtVal;
import com.travelexperts.service.BookingService;
import com.travelexperts.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
@RequestMapping("/auth")
public class AuthController {

	@Autowired
	CustomerService cService;
	@Autowired
	BookingService bService;
		
	// Controller returns personal info
	@RequestMapping("/customerinfo")
	@GetMapping(produces=MediaType.APPLICATION_JSON_VALUE) // Important to get response
	public Customer obtainPersonalInfo(Authentication authentication) {

		// Get a customer id
		// Get token
		UserDetail details = (UserDetail) authentication.getPrincipal();
		String token = details.getToken();
		JwtVal qwerty = new JwtVal();
		User currentUser = qwerty.validate(token);	
		Customer cust = cService.getCustomer(String.valueOf(currentUser.getCustomerId()));
		
		return cust;
	}
	
	// Controller returns list of bookings
	@RequestMapping("/bookings")
	@GetMapping(produces=MediaType.APPLICATION_JSON_VALUE) // Important to get response
	public ArrayList<Booking> obtainBookings(Authentication authentication) {
		
		// Get a customer id
		// Get token
		UserDetail details = (UserDetail) authentication.getPrincipal();
		String token = details.getToken();
		JwtVal qwerty = new JwtVal();
		User currentUser = qwerty.validate(token);	
		
		ArrayList<Booking> book = bService.getBooking(currentUser.getCustomerId());
		
		return book;
	}
		
} // end of the class
