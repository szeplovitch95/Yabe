package com.cs336.pkg;

public class Alert {
	private String buyerName; 
	private String auctionName; 
	
	public Alert(String buyerName, String auctionName) {
		super();
		this.buyerName = buyerName; 
		this.auctionName = auctionName; 
	}
	
	public Alert() {}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	public String getAuctionName() {
		return auctionName;
	}

	public void setAuctionName(String auctionName) {
		this.auctionName = auctionName;
	}
}