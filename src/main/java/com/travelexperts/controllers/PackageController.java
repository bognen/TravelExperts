//********************************************//
// Dima Bognen, Jonathan Pirca, Abel Rojas, Manish Sudani
// Controls access package info
//********************************************//

package com.travelexperts.controllers;

import java.util.ArrayList;
import java.util.Hashtable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.travelexperts.model.Booking;
import com.travelexperts.model.Package;
import com.travelexperts.service.BookingService;
import com.travelexperts.service.PackageService;


@CrossOrigin
@RestController
@RequestMapping("/pack")
public class PackageController {
	
	private Logger logger = LoggerFactory.getLogger(CustomerController.class); 
	
	@Autowired
	PackageService packService;

	@RequestMapping("/all")  
	public ArrayList<Package> getAll() {
		//logger.info("all was called");
		return packService.getAll();
	}
	
	@RequestMapping("/topthree")  
	public ArrayList<Package> getThree() {
		//logger.info("all was called");
		return packService.getThree();
	}

	@RequestMapping("{id}")
	public Package getPackage(@PathVariable("id") int id) {
		return packService.getPackage(id);
	}
	
}
