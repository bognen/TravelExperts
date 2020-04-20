package com.travelexperts.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Booking {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
   int BookingId; //Booking
   Date BookingDate; //Booking
   Date PackStartDate; // PackFrom
   Date PackEndDate; // PackTo
   String BookingNo; // Booking
   int TravelerCount; // Booking
   String TripType;	  // Booking
   int CustomerId;  // Customers
   String CustFirstName; // Customers
   String CustLastName; //Customers
   int PackageId; //Packages
   String PkgName; //Packages
   String PkgImageArray; // packages
   Double PkgBasePrice; // Packages
   
	public int getBookingId() {
		return BookingId;
	}
	public void setBookingId(int bookingId) {
		BookingId = bookingId;
	}
	public Date getBookingDate() {
		return BookingDate;
	}
	public void setBookingDate(Date bookingDate) {
		BookingDate = bookingDate;
	}
	public Date getPackStartDate() {
		return PackStartDate;
	}
	public void setPackStartDate(Date packStartDate) {
		PackStartDate = packStartDate;
	}
	public Date getPackEndDate() {
		return PackEndDate;
	}
	public void setPackEndDate(Date packEndDate) {
		PackEndDate = packEndDate;
	}
	public String getBookingNo() {
		return BookingNo;
	}
	public void setBookingNo(String bookingNo) {
		BookingNo = bookingNo;
	}
	public int getTravelerCount() {
		return TravelerCount;
	}
	public void setTravelerCount(int travelerCount) {
		TravelerCount = travelerCount;
	}
	public String getCustFirstName() {
		return CustFirstName;
	}
	public String getTripType() {
		return TripType;
	}
	public void setTripType(String tripType) {
		TripType = tripType;
	}
	public int getCustomerId() {
		return CustomerId;
	}
	public void setCustomerId(int customerId) {
		CustomerId = customerId;
	}
	public void setCustFirstName(String custFirstName) {
		CustFirstName = custFirstName;
	}
	public String getCustLastName() {
		return CustLastName;
	}
	public void setCustLastName(String custLastName) {
		CustLastName = custLastName;
	}
	public int getPackageId() {
		return PackageId;
	}
	public void setPackageId(int packageId) {
		PackageId = packageId;
	}
	public String getPkgName() {
		return PkgName;
	}
	public void setPkgName(String pkgName) {
		PkgName = pkgName;
	}
	public String getPkgImageArray() {
		return PkgImageArray;
	}
	public void setPkgImageArray(String pkgImageArray) {
		PkgImageArray = pkgImageArray;
	}
	public Double getPkgBasePrice() {
		return PkgBasePrice;
	}
	public void setPkgBasePrice(Double pkgBasePrice) {
		PkgBasePrice = pkgBasePrice;
	}

}
