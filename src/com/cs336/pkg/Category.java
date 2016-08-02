package com.cs336.pkg;

public class Category {

		private String categoryName; // Closed, Open, etc 
		private int categoryID;
		
		public Category(int categoryID, String categoryName) {
			super();
			this.categoryID = categoryID;
			this.categoryName = categoryName;
		}
		
		public Category() {}
		
		public int getCategoryID() {
			return categoryID;
		} 

		public String getCategoryName() {
			return categoryName;
		}

	public void setCategoryID(int CategoryID) {
			this.categoryID = CategoryID;
		} 
		
		public void setCategoryName(String CategoryName) {
			this.categoryName = CategoryName;
		}
}
