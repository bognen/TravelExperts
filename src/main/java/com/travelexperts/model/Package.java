package com.travelexperts.model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Package {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int PackageId; 
    String PkgName; 
    String PkgStartDate; 
    String PkgEndDate; 
    String PkgDesc; 
    Double PkgBasePrice;
    String PkgVertImage; 
    String PkgImageArray; 
   
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
	public String getPkgStartDate() {
		return PkgStartDate;
	}
	public void setPkgStartDate(String pkgStartDate) {
		PkgStartDate = pkgStartDate;
	}
	public String getPkgEndDate() {
		return PkgEndDate;
	}
	public void setPkgEndDate(String pkgEndDate) {
		PkgEndDate = pkgEndDate;
	}
	public String getPkgDesc() {
		return PkgDesc;
	}
	public void setPkgDesc(String pkgDesc) {
		PkgDesc = pkgDesc;
	}
	public Double getPkgBasePrice() {
		return PkgBasePrice;
	}
	public void setPkgBasePrice(Double pkgBasePrice) {
		PkgBasePrice = pkgBasePrice;
	}
	public String getPkgVertImage() {
		return PkgVertImage;
	}
	public void setPkgVertImage(String pkgVertImage) {
		PkgVertImage = pkgVertImage;
	}
	public String getPkgImageArray() {
		return PkgImageArray;
	}
	public void setPkgImageArray(String pkgImageArray) {
		PkgImageArray = pkgImageArray;
	}
	
}
