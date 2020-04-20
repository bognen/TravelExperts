//********************************************//
// Dima Bognen, Jonathan Pirca, Abel Rojas, Manish Sudani
// Service which interacts with DB and extracts package info
//********************************************//

package com.travelexperts.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.travelexperts.model.Package;
import com.travelexperts.service.DBConnection;

@Service
public class PackageService {
	
	// get All Packages
	public ArrayList<Package> getAll(){
		
		@SuppressWarnings("unchecked")
		ArrayList<Package> packageList = new ArrayList();

		try {
			Connection conn = DBConnection.getConnection();
			
			String query = "SELECT `PackageId`, `PkgName`, `PkgStartDate`, `PkgEndDate`, `PkgDesc`, "
					+ "`PkgBasePrice`, `PkgVertImage`, `PkgImageArray` FROM `packages`";		
	        Statement st = conn.createStatement();
	        // execute the query, and get a java resultset
	        ResultSet rs = st.executeQuery(query);
	
	        // iterate through the java resultset
	        while (rs.next()) {
	        	Package pack = new Package();
	        	pack.setPackageId(rs.getInt("PackageId"));
                pack.setPkgName(rs.getString("PkgName"));
                pack.setPkgStartDate(rs.getString("PkgStartDate"));
                pack.setPkgEndDate(rs.getString("PkgEndDate"));
	        	pack.setPkgDesc(rs.getString("PkgDesc"));
                pack.setPkgBasePrice(rs.getDouble("PkgBasePrice"));
                pack.setPkgVertImage(rs.getString("PkgVertImage"));
                pack.setPkgImageArray(rs.getString("PkgImageArray"));
	
	            // add created instance to the list
	            packageList.add(pack);
	        }
	        st.close();
	       
        }catch (Exception e) {
	        System.err.println("Got an exception! ");
	        System.err.println(e.getMessage());
	    }
		
		return packageList;
	}
	
	// get Top 3 Packages
	public ArrayList<Package> getThree(){
		
		@SuppressWarnings("unchecked")
		ArrayList<Package> packageList = new ArrayList();
		
		try {
			Connection conn = DBConnection.getConnection();
			
			String query = "SELECT `PackageId`, `PkgName`, `PkgStartDate`, `PkgEndDate`, `PkgDesc`, "
					+ "`PkgBasePrice` FROM `packages` "
					+ "ORDER BY `PkgEndDate` ASC "
					+ "LIMIT 3";		
	        Statement st = conn.createStatement();
	        // execute the query, and get a java resultset
	        ResultSet rs = st.executeQuery(query);
	
	        // iterate through the java resultset
	        while (rs.next()) {
	        	Package pack = new Package();
	        	pack.setPackageId(rs.getInt("PackageId"));
                pack.setPkgName(rs.getString("PkgName"));
                pack.setPkgStartDate(rs.getString("PkgStartDate"));
                pack.setPkgEndDate(rs.getString("PkgEndDate"));
	        	pack.setPkgDesc(rs.getString("PkgDesc"));
                pack.setPkgBasePrice(rs.getDouble("PkgBasePrice"));
	
	            // add created instance to the list
	            packageList.add(pack);
	        }
	        st.close();
	       
        }catch (Exception e) {
	        System.err.println("Got an exception! ");
	        System.err.println(e.getMessage());
	    }
		
		return packageList;
	}
		
	// get specific Package by id
	public Package getPackage(int PackId) {
		Package selectedPack = new Package();
		
		try {
			Connection conn = DBConnection.getConnection();
			
			// Create our parameritized SQL SELECT query.
			String query = "SELECT `PackageId`, `PkgName`, `PkgStartDate`, `PkgEndDate`, `PkgDesc`, "
					+ "`PkgBasePrice`, `PkgVertImage`, `PkgImageArray` FROM `packages` "
					+ "WHERE PackageId = ?";
						
			// Create statement and pass parameters 
	        PreparedStatement st = conn.prepareStatement(query);
	        st.setInt(1,PackId);
	        // execute the query, and get a java resultset
	        ResultSet rs = st.executeQuery();
	        while (rs.next())
	        {    		        	
                selectedPack.setPackageId(rs.getInt("PackageId"));
                selectedPack.setPkgName(rs.getString("PkgName"));
                selectedPack.setPkgStartDate(rs.getString("PkgStartDate"));
                selectedPack.setPkgEndDate(rs.getString("PkgEndDate"));
                selectedPack.setPkgDesc(rs.getString("PkgDesc"));
                selectedPack.setPkgBasePrice(rs.getDouble("PkgBasePrice"));
                selectedPack.setPkgVertImage(rs.getString("PkgVertImage"));
                selectedPack.setPkgImageArray(rs.getString("PkgImageArray"));
              }
	        st.close();
        }catch (Exception e) {
	        System.err.println("Got an exception! ");
	        System.err.println(e.getMessage());
	    }
		
		return selectedPack;
	}
	
} // end of the class
