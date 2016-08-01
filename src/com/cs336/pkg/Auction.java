package com.cs336.pkg;

import java.sql.Date;

public class Auction {
	private int ItemID;
	private String status; // Closed, Open, etc 
	private double closingPrice; 
	private double initialPrice; 
	private int totalBids; 
	private String startDate; 
	private String closeDate; 
	private int createdBy;
	private int cancelledBy;
	
	public Auction(int ItemID, String status, double closingPrice, double initialPrice, int totalBids, String startDate,
			String closeDate, int createdBy, int cancelledBy) {
		super();
		this.ItemID = ItemID;
		this.status = status;
		this.closingPrice = closingPrice;
		this.initialPrice = initialPrice;
		this.totalBids = totalBids;
		this.startDate = startDate;
		this.closeDate = closeDate;
		this.createdBy = createdBy;
		this.cancelledBy = cancelledBy;
	} 
	
	public Auction() {}

	public int getItemID() {
		return ItemID;
	}

	public void setItemID(int itemID) {
		ItemID = itemID;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public double getClosingPrice() {
		return closingPrice;
	}

	public void setClosingPrice(double closingPrice) {
		this.closingPrice = closingPrice;
	}

	public double getInitialPrice() {
		return initialPrice;
	}

	public void setInitialPrice(double initialPrice) {
		this.initialPrice = initialPrice;
	}

	public int getTotalBids() {
		return totalBids;
	}

	public void setTotalBids(int totalBids) {
		this.totalBids = totalBids;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getCloseDate() {
		return closeDate;
	}

	public void setCloseDate(String closeDate) {
		this.closeDate = closeDate;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public int getCancelledBy() {
		return cancelledBy;
	}

	public void setCancelledBy(int cancelledBy) {
		this.cancelledBy = cancelledBy;
	}
	
	
	
	
}
