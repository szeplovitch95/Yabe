package com.cs336.pkg;

public class Seller extends EndUser {
	private String bankName; 
	private String bankAccountNumber; 
	private String bankRoutingNumber;
	
	public Seller(String firstName, String lastName, String gender, String username, String password, String email,
			String phoneNum, String userType, String bankName, String bankAccountNumber, String bankRoutingNumber) {
		super(firstName, lastName, gender, username, password, email, phoneNum, userType);
		this.bankName = bankName;
		this.bankAccountNumber = bankAccountNumber;
		this.bankRoutingNumber = bankRoutingNumber;
	} 
	
	public Seller() {}
	
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
