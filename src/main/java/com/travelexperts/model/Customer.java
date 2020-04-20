package com.travelexperts.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Customer {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int CustomerId;
 	String CustFirstName; 	
 	String CustLastName; 
	String CustAddress;
	String CustCity;
	String CustProv; 	
	String CustPostal;
	String CustCountry;
	String CustHomePhone;
	String CustBusPhone;
	String  CustEmail;
	Integer AgentId;
	
	public int getCustomerId() {
		return CustomerId;
	}
	public void setCustomerId(int customerId) {
		CustomerId = customerId;
	}
	public String getCustFirstName() {
		return CustFirstName;
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
	public String getCustAddress() {
		return CustAddress;
	}
	public void setCustAddress(String custAddress) {
		CustAddress = custAddress;
	}
	public String getCustCity() {
		return CustCity;
	}
	public void setCustCity(String custCity) {
		CustCity = custCity;
	}
	public String getCustProv() {
		return CustProv;
	}
	public void setCustProv(String custProv) {
		CustProv = custProv;
	}
	public String getCustPostal() {
		return CustPostal;
	}
	public void setCustPostal(String custPostal) {
		CustPostal = custPostal;
	}
	public String getCustCountry() {
		return CustCountry;
	}
	public void setCustCountry(String custCountry) {
		CustCountry = custCountry;
	}
	public String getCustHomePhone() {
		return CustHomePhone;
	}
	public void setCustHomePhone(String custHomePhone) {
		CustHomePhone = custHomePhone;
	}
	public String getCustBusPhone() {
		return CustBusPhone;
	}
	public void setCustBusPhone(String custBusPhone) {
		CustBusPhone = custBusPhone;
	}
	public String getCustEmail() {
		return CustEmail;
	}
	public void setCustEmail(String custEmail) {
		CustEmail = custEmail;
	}
	public Integer getAgentId() {
		return AgentId;
	}
	public void setAgentId(Integer agentId) {
		AgentId = agentId;
	}
	
}

