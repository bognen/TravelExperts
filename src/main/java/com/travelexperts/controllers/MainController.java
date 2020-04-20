//********************************************//
// Dima Bognen, Jonathan Pirca, Abel Rojas, Manish Sudani
// Controls access and redirect to jsp page
//********************************************//

package com.travelexperts.controllers;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.travelexperts.model.Booking;
import com.travelexperts.model.Customer;
import com.travelexperts.service.UserService;

@Controller
public class MainController {

	@Autowired
	UserService userService;
	
	// Controller which redirect user to the index page
	@RequestMapping("/")
	//@ResponseBody
	public String testFunction() {
		return "index";
	}
	
	@RequestMapping("/register")
	public String callRegister() {
		return "register";
	}
	
	@RequestMapping("/packages")
	public String allPackages() {
		return "packages";
	}
	
	@RequestMapping("/packageDetails")
	public String onePackage() {
		return "packageDetails";
	}
	
	@RequestMapping("/emailconfirmation")
	public String confirmEmail() {
		return "emailconfirmation";
	}
		
	@RequestMapping("/success")
	public String emailConfirmed(String token, Integer id) {
		return userService.emailConfirmed(token,id);
	}

	@PostMapping("/login")
	public String loginUser(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		String token = userService.loginUser(request,response);
		
		if(token.equals("noemail")) {
			return "noconfirmation";
		} else if(token.equals("wrong")) {
			return "wrongpass";
		}else {
			Cookie myCookie = new Cookie("traveltoken", token);
			//myCookie.setMaxAge(900); // set cookie to 30 min
		    //myCookie.setDomain("travelexperts.ca");
		    //myCookie.setPath("/");		
			response.addCookie(myCookie);		
			System.out.println("Token is set "+myCookie.getValue());
		
			//It is important to use redirect here as redirect reloads page
			return "redirect:/";
		}
	}
	
	@RequestMapping("/killtoken")
	public String killToken(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		Cookie myCookie = new Cookie("traveltoken", null);
		myCookie.setMaxAge(0); // set cookie to 30 min
	    //myCookie.setDomain("travelexperts.ca");
	    //myCookie.setPath("/");		
		response.addCookie(myCookie);	
		return "redirect:/";
	}
	
	
	// Controller returns 
	@PostMapping("/personalinfo")
	public String displayPersonal(Customer cust) {
		return "PersonalInfo";
	}
	
	// Controller returns
	@PostMapping("/mybookings")
	public String displayBookings(ArrayList<Booking> bookings) {
		return "bookings";
	}
}
