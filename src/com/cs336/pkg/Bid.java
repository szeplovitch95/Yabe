package com.cs336.pkg;

import java.sql.Date;

public class Bid {
	private int auctionID;
	private Date BidDateTime;
	private double offerPrice;
	private boolean cancelled;
	private int offeredBy;
	private int cancelledBy;
	
	public Bid(int auctionID, Date BidDateTime, double offerPrice, boolean cancelled, int offeredBy, int cancelledBy) {
		super();
		this.auctionID = auctionID;
		this.BidDateTime = BidDateTime;
		this.offerPrice = offerPrice;
		this.cancelled = cancelled;
		this.offeredBy = offeredBy;
		this.cancelledBy = cancelledBy;
	}

	public Bid() {
	}

	public int getAuctionID() {
		return auctionID;
	}

	public void setAuctionID(int auctionID) {
		this.auctionID = auctionID;
	}

	public Date getBidDateTime() {
		return BidDateTime;
	}

	public void setBidDateTime(Date BidDateTime) {
		this.BidDateTime = BidDateTime;
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

	public int getOfferedBy() {
		return offeredBy;
	}

	public void setOfferedBy(int offeredBy) {
		this.offeredBy = offeredBy;
	}

	public int getCancelledBy() {
		return cancelledBy;
	}

	public void setCancelledBy(int cancelledBy) {
		this.cancelledBy = cancelledBy;
	}
}
