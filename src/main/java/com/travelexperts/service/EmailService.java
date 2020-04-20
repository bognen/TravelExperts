//********************************************//
// Dima Bognen, Jonathan Pirca, Abel Rojas, Manish Sudani
// Service sendsconfirmation email 
//********************************************//

package com.travelexperts.service;

import com.travelexperts.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;

@Service
public class EmailService {
	
	private JavaMailSender javaMailSender;
	private CustomerService cService = new CustomerService();
	
	@Autowired
	public EmailService(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}
	
	public void confirmationEmail(User user) throws MessagingException, UnsupportedEncodingException {
		
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "utf-8");
		
		//Get current user full name
		String name = cService.getCustName(user.getCustomerId());
		
		//Build the email message 
		String htmlMsg = "<h3>Hello "+ name +"</h3></br>"+
				"<p>We are glad to have you on board</p></br></br>"+
				"<p>In order to finish registration and access your account, please use the link below</p></br></br>"+
				
				"<a href=\"http://localhost:8080/success?token="+user.getToken()+"&id="+user.getUserId()+"\">"+
				"http://TravelEXPERTS/success?token=" +user.getToken()+"&id="+user.getUserId()+
				"</a>"+
			    
				"</br></br>"+

				"<p>If did not register on the site, please, ignore this email </p>";
		
		mimeMessage.setContent(htmlMsg, "text/html");
		helper.setTo(user.getEmail());
		helper.setSubject("Welcome to Travel Experts");		
		InternetAddress ia = new InternetAddress("startupinkm@gmail.com","Travel EXPERTS");
		helper.setFrom(ia);
		
		javaMailSender.send(mimeMessage);
	
	}
}