//********************************************//
// Dima Bognen, Jonathan Pirca, Abel Rojas, Manish Sudani
// Controls access to booking informaiton
//********************************************//

package com.travelexperts.controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.travelexperts.model.Booking;
import com.travelexperts.model.User;
import com.travelexperts.model.UserDetail;
import com.travelexperts.security.JwtVal;
import com.travelexperts.service.BookingService;


@CrossOrigin
@RestController
@RequestMapping("/bookings")
public class BookingController {
	private Logger logger = LoggerFactory.getLogger(CustomerController.class); 
	
	@Autowired
	BookingService bookService;

	@RequestMapping("/all")  
	public ArrayList<Booking> getAll() {
		//logger.info("all was called");
		return bookService.getAll();
	}

	@RequestMapping("{id}")
	public ArrayList<Booking> getBooking(@PathVariable("id") int id) {
		return bookService.getBooking(id);
	}
	
	@PostMapping("/addbooking")
	public void addBooking(HttpServletRequest request, Booking book) {
		
		// Get customerId from the passed token

		String token = request.getHeader("Authorisation");
		JwtVal qwerty = new JwtVal();
		User currentUser = qwerty.validate(token);
		
		// Add Customer Id to booking model
		book.setCustomerId(currentUser.getCustomerId());
		
		bookService.insertBooking(book);
	}
	
	@PutMapping("/changebooking")
	public void updateBooking(Booking book) {
		bookService.updateBooking(book);
	}
	
	// Controller deletes speciific booking
	@DeleteMapping("/deletebooking")	
	public void deleteBooking(int bookingId) {
		bookService.deleteBooking(bookingId);
	}
}
