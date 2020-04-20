//********************************************//
// Dima Bognen, Jonathan Pirca, Abel Rojas, Manish Sudani
// Main application file
//********************************************//

package com.travelexperts.travelexperts;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@ComponentScan("com.travelexperts")
@SpringBootApplication(exclude = {SecurityAutoConfiguration.class} )
public class TravelExplertsApplication {

	public static void main(String[] args) {
		SpringApplication.run(TravelExplertsApplication.class, args);
	}

}
