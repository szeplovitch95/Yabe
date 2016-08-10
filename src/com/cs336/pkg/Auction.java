package com.cs336.pkg;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;

public class Auction {
	private int ItemID;
	private String status; // Closed, Open, etc
	private double closingPrice;
	private double currentPrice;
	private double initialPrice;
	private int totalBids;
	private Date startDate;
	private Date closeDate;
	private int createdBy;
	private int cancelledBy;

	public Auction(int ItemID, String status, double closingPrice, double currentPrice, double initialPrice,
			int totalBids, Date startDate, Date closeDate, int createdBy, int cancelledBy) {
		super();
		this.ItemID = ItemID;
		this.status = status;
		this.closingPrice = closingPrice;
		this.currentPrice = currentPrice;
		this.initialPrice = initialPrice;
		this.totalBids = totalBids;
		this.startDate = startDate;
		this.closeDate = closeDate;
		this.createdBy = createdBy;
		this.cancelledBy = cancelledBy;
	}

	public Auction() {
	}

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

	public void setCurrentPrice(double currentPrice) {
		this.currentPrice = currentPrice;
	}

	public double getCurrentPrice() {
		return currentPrice;
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

	// TODO change date format to dd/MM/yyyy
		public Date stringToDate(String value) throws ParseException {
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date date = sdf1.parse(value);
			return new java.sql.Date(date.getTime());
		}
}
