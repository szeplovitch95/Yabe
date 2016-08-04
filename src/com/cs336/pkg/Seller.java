package com.cs336.pkg;

public class Seller extends EndUser {
	private int sellerID;
	private String bankName;
	private String bankAccountNumber;
	private String bankRoutingNumber;

	public Seller(int sellerID, String firstName, String lastName, String gender, String username, String password,
			String email, String phoneNum, String userType, String bankName, String bankAccountNumber,
			String bankRoutingNumber) {
		super(firstName, lastName, gender, username, password, email, phoneNum, userType);
		this.sellerID = sellerID;
		this.bankName = bankName;
		this.bankAccountNumber = bankAccountNumber;
		this.bankRoutingNumber = bankRoutingNumber;
	}

	public Seller() {
	}

	public int getSellerID() {
		return sellerID;
	}

	public void setSellerID(int sellerID) {
		this.sellerID = sellerID;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBankAccountNumber() {
		return bankAccountNumber;
	}

	public void setBankAccountNumber(String bankAccountNumber) {
		this.bankAccountNumber = bankAccountNumber;
	}

	public String getBankRoutingNumber() {
		return bankRoutingNumber;
	}

	public void setBankRoutingNumber(String bankRoutingNumber) {
		this.bankRoutingNumber = bankRoutingNumber;
	}
}
