//********************************************//
// Dima Bognen, Jonathan Pirca, Abel Rojas, Manish Sudani
// Controls access user info
//********************************************//

package com.travelexperts.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.travelexperts.model.User;
import com.travelexperts.service.UserService;


@CrossOrigin
@RestController
@RequestMapping("/users")
public class UserController {
	
	@Autowired
	UserService userService;

	@PostMapping("/adduser")
	public String addCustomer(User user) {
		return userService.insertUser(user);
	}	
}
