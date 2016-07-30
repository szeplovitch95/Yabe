package com.cs336.pkg;

import java.sql.Date;

public class Auction {
	private String status; // Closed, Open, etc 
	private double closingPrice; 
	private double initialPrice; 
	private int totalBids; 
	private Date startDate; 
	private Date closeDate; 
	private String createdBy;
	private String cancelledBy;
	
	public Auction(String status, double closingPrice, double initialPrice, int totalBids, Date startDate,
			Date closeDate, String createdBy, String cancelledBy) {
		super();
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

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getCloseDate() {
		return closeDate;
	}

	public void setCloseDate(Date closeDate) {
		this.closeDate = closeDate;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getCancelledBy() {
		return cancelledBy;
	}

	public void setCancelledBy(String cancelledBy) {
		this.cancelledBy = cancelledBy;
	}
	
	
	
	
}
