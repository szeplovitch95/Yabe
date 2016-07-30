package com.cs336.pkg;

public class Item {
	private String name; 
	private String description; 
	private String color; 
	private String weight; 
	private int quantityOnHand; 
	
	public Item(String name, String description, String color, String weight, int quantityOnHand) {
		super();
		this.name = name;
		this.description = description;
		this.color = color;
		this.weight = weight;
		this.quantityOnHand = quantityOnHand;
	}
	
	public Item() {}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public int getQuantityOnHand() {
		return quantityOnHand;
	}

	public void setQuantityOnHand(int quantityOnHand) {
		this.quantityOnHand = quantityOnHand;
	}
}
