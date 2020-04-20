//********************************************//
// Dima Bognen, Jonathan Pirca, Abel Rojas, Manish Sudani
// Service whichprovides DB connection  
//********************************************//

package com.travelexperts.service;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	public static Connection getConnection() {
		Connection conn = null;

		try {
			// create our mysql database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
			//String myUrl = "jdbc:mysql://travelexperts.cc3i7aicdfky.us-east-2.rds.amazonaws.com:3306/travelexperts";
			String myUrl = "jdbc:mysql://localhost:3306/travelexperts";
			conn = DriverManager.getConnection(myUrl, "root", "39PGR6umu9TU");
			return conn;
			} catch (Exception e) {
	        System.err.println("Got an exception! ");
	        System.err.println(e.getMessage());
	    }
		return conn;
	}

}