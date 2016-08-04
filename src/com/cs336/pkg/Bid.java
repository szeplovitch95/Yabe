package com.cs336.pkg;

import java.sql.Date;

public class Bid {
	private Date auctionDate;
	private double offerPrice;
	private boolean cancelled;
	private String offeredBy;
	private String cancelledBy;

	public Bid(Date auctionDate, double offerPrice, boolean cancelled, String offeredBy, String cancelledBy) {
		super();
		this.auctionDate = auctionDate;
		this.offerPrice = offerPrice;
		this.cancelled = cancelled;
		this.offeredBy = offeredBy;
		this.cancelledBy = cancelledBy;
	}

	public Bid() {
	}

	public Date getAuctionDate() {
		return auctionDate;
	}

	public void setAuctionDate(Date auctionDate) {
		this.auctionDate = auctionDate;
	}

	public double getOfferPrice() {
		return offerPrice;
	}

	public void setOfferPrice(double offerPrice) {
		this.offerPrice = offerPrice;
	}

	public boolean isCancelled() {
		return cancelled;
	}

	public void setCancelled(boolean cancelled) {
		this.cancelled = cancelled;
	}

	public String getOfferedBy() {
		return offeredBy;
	}

	public void setOfferedBy(String offeredBy) {
		this.offeredBy = offeredBy;
	}

	public String getCancelledBy() {
		return cancelledBy;
	}

	public void setCancelledBy(String cancelledBy) {
		this.cancelledBy = cancelledBy;
	}
}
