package com.cs336.pkg;

public class Alert {
	private int buyerID;
	private int auctionID;

	public Alert(int buyerID, int auctionID) {
		super();
		this.buyerID = buyerID;
		this.auctionID = auctionID;
	}

	public Alert() {
	}

	public int getBuyerName() {
		return buyerID;
	}

	public void setBuyerName(int buyerID) {
		this.buyerID = buyerID;
	}

	public int getAuctionName() {
		return auctionID;
	}

	public void setAuctionName(int auctionID) {
		this.auctionID = auctionID;
	}
}