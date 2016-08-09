package com.cs336.pkg;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Buyer extends EndUser {
	private int buyerID;
	private String ccType;
	private String ccNumber;
	private Date expirationDate;
	private String cVV;
	private String cardHolderName;
	private String shippingStreet;
	private String shippingCity;
	private String shippingState;
	private String shippingZipCode;

	public Buyer(int buyerID, String firstName, String lastName, String gender, String username, String password,
			String email, String phoneNum, String userType, String ccType, String ccNumber, Date expirationDate,
			String cVV, String cardHolderName, String shippingStreet, String shippingCity, String shippingState,
			String shippingZipCode) {
		super(firstName, lastName, gender, username, password, email, phoneNum, userType);
		this.buyerID = buyerID;
		this.ccType = ccType;
		this.ccNumber = ccNumber;
		this.expirationDate = expirationDate;
		this.cVV = cVV;
		this.cardHolderName = cardHolderName;
		this.shippingStreet = shippingStreet;
		this.shippingCity = shippingCity;
		this.shippingState = shippingState;
		this.shippingZipCode = shippingZipCode;
	}

	public Buyer() {
	}

	public int getBuyerID() {
		return buyerID;
	}

	public void setBuyerID(int buyerID) {
		this.buyerID = buyerID;
	}

	public String getCcType() {
		return ccType;
	}

	public void setCcType(String ccType) {
		this.ccType = ccType;
	}

	public String getCcNumber() {
		return ccNumber;
	}

	public void setCcNumber(String ccNumber) {
		this.ccNumber = ccNumber;
	}

	public Date getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}

	public String getcVV() {
		return cVV;
	}

	public void setcVV(String cVV) {
		this.cVV = cVV;
	}

	public String getCardHolderName() {
		return cardHolderName;
	}

	public void setCardHolderName(String cardHolderName) {
		this.cardHolderName = cardHolderName;
	}

	public String getShippingStreet() {
		return shippingStreet;
	}

	public void setShippingStreet(String shippingStreet) {
		this.shippingStreet = shippingStreet;
	}

	public String getShippingCity() {
		return shippingCity;
	}

	public void setShippingCity(String shippingCity) {
		this.shippingCity = shippingCity;
	}

	public String getShippingState() {
		return shippingState;
	}

	public void setShippingState(String shippingState) {
		this.shippingState = shippingState;
	}

	public String getShippingZipCode() {
		return shippingZipCode;
	}

	public void setShippingZipCode(String shippingZipCode) {
		this.shippingZipCode = shippingZipCode;
	}

	public Date stringToDate(String value) throws ParseException {
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = sdf1.parse(value);
		return new java.sql.Date(date.getTime());
	}
}
