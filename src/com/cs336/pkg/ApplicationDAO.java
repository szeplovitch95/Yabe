package com.cs336.pkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.mysql.jdbc.Statement;

public class ApplicationDAO {

	public Connection getConnection(){
		String connectionUrl = "jdbc:mysql://classvm60.cs.rutgers.edu:3306/YABE?autoReconnect=true";
		Connection connection = null;

		System.out.print("Connecting...");
		
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			connection = DriverManager.getConnection(connectionUrl,"root", "RepDepKept4");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("... Connected.");
		
		return connection;
		
	}
	
	public void closeConnection(Connection connection){
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String getUserFullName(String username, String password) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "SELECT FirstName, LastName FROM END_USER WHERE Username ='" + username + "' AND Password = '" + password + "'";
		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();
		return rs.getString("FirstName") + rs.getString("LastName");
	}
	
	
	public boolean userLogin(String username, String password) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "SELECT Username, Password FROM END_USER WHERE Username ='" + username + "' AND Password = '" + password + "'";
		
		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();
		getAllUsers();
		
		if(rs.next()) {
			return true;
		} 
		else {
			return false; 
		}
	}
	
	
	
	
	public void insertItem(Item item) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "Insert into ITEM(EndUserID,CategoryID,ItemName, ItemDescription, Color, QuantityOnHand, Weight) values (?,?,?,?,?,?,?)";
		PreparedStatement preparedStatement=dbConnection.prepareStatement(query); 
		preparedStatement.setInt(1,item.getSellerID());
		preparedStatement.setInt(2,item.getCategoryID());
		preparedStatement.setString(3,item.getName()); 
		preparedStatement.setString(5,item.getDescription());
		preparedStatement.setString(4,item.getColor());
		preparedStatement.setInt(6,item.getQuantityOnHand());
		preparedStatement.setString(7,item.getWeight());
		
		preparedStatement.executeUpdate();
		preparedStatement.close();
		dbConnection.close();
	}
	
	public ResultSet getSellerItems(int sellerID) throws SQLException {
		Connection dbConnection = getConnection(); 
		String query = "SELECT ItemID, ItemName, ItemDescription, Color, QuantityOnHand, Weight FROM ITEM";
		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();
		
		return rs;
	}
	
	
	public void insertEndUser(EndUser endUser) throws SQLException{
		
		Connection dbConnection = getConnection();
		String query = "Insert into END_USER(FirstName, LastName, Gender, Username, Password, Email, Phone, UserType) values (?,?,?,?,?,?,?,?)";
		PreparedStatement preparedStatement=dbConnection.prepareStatement(query); 
		preparedStatement.setString(1,endUser.getFirstName()); 
		preparedStatement.setString(2,endUser.getLastName());
		preparedStatement.setString(3,endUser.getGender());
		preparedStatement.setString(4,endUser.getUsername());
		preparedStatement.setString(5,endUser.getPassword());
		preparedStatement.setString(6,endUser.getEmail());
		preparedStatement.setString(7,endUser.getPhoneNum());
		preparedStatement.setString(8,endUser.getUserType());
		
		// execute insert SQL statement
		preparedStatement.executeUpdate();
		System.out.println("user has been added");
		getAllUsers();
		
		preparedStatement.close();
		dbConnection.close();
	}
	public LinkedList<Category> getAllCategories() throws SQLException{
		LinkedList<Category> listOfCategories = new LinkedList<Category>();
		String selectString = "select * from CATEGORY;";
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		int resLength = 0;
		ResultSet rs = preparedStatement.executeQuery();
		while(rs.next( )) {
			System.out.println("CategoryName  = " + rs.getString("CategoryName") );
			resLength++;
			listOfCategories.add(
					new Category (rs.getInt("CategoryID"), rs.getString("CategoryName")));
		}
		System.out.println("Select statement executed, " + resLength + " rows retrieved");
		
		//close everything
		preparedStatement.close();
		dbConnection.close();
		
		return listOfCategories;
	}	
	public LinkedList<Item> getAllItems() throws SQLException{
		LinkedList<Item> listOfItems = new LinkedList<Item>();
		String selectString = "select * from ITEM;";
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		int resLength = 0;
		ResultSet rs = preparedStatement.executeQuery();
		while(rs.next( )) {
			System.out.println("Item = " + rs.getString("ItemName") + 
					", Description = " + rs.getString("ItemDescription") + 
					", Color = " + rs.getString("Color") + 
					", Weight = " + rs.getString("Weight")+ 
					", Quantity = " + rs.getString("QuantityOnHand"));
			resLength++;
			listOfItems.add(
					new Item(
							rs.getString("ItemName"),
							rs.getString("ItemDescription"),
							rs.getString("Color"), 
							rs.getString("Weight"),
							rs.getInt("QuantityOnHand")));
		}
		System.out.println("Select statement executed, " + resLength + " rows retrieved");
		
		//close everything
		preparedStatement.close();
		dbConnection.close();
		
		return listOfItems;
	}
	
	public LinkedList<EndUser> getAllUsers() throws SQLException{
		
		LinkedList<EndUser> listOfPeople = new LinkedList<EndUser>();
		
		//display all tuples
		String selectString = "select * from END_USER;";
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		int resLength = 0;
		//creating a ResultSet
		ResultSet rs = preparedStatement.executeQuery(); 
		
		//iterate through the resultSet
		while(rs.next( )) {
			System.out.println("Row : id = " + rs.getInt("EndUserID") + 
								", First name = " + rs.getString("FirstName") + 
								", Last name = " + rs.getString("LastName") + 
								", Gender = " + rs.getString("Gender") + 
								", email = " + rs.getString("Email")+ 
								", phone = " + rs.getString("Phone")+ 
								", usertype = " + rs.getString("UserType"));
			
			
			resLength++;
			
			listOfPeople.add(new EndUser(rs.getString("FirstName"), rs.getString("LastName"), rs.getString("Gender"),
										 rs.getString("Username"), rs.getString("Password"), rs.getString("Email"),
										 rs.getString("Phone"), rs.getString("UserType"))
							);
		}
		System.out.println("Select statement executed, " + resLength + " rows retrieved");
		
		//close everything
		preparedStatement.close();
		dbConnection.close();
		
		return listOfPeople;
	}
	
	
	public static void main(String[] args) {
		ApplicationDAO dao = new ApplicationDAO();
		Connection connection = dao.getConnection();
		
		EndUser user = new EndUser("Shachar", "Zeplovitch", "Male", "szeplovitch95", "123456", "szeplovitch95@gmail.com","2019652035", "admin");
		
		try {
			dao.insertEndUser(user);
			dao.getAllUsers();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		dao.closeConnection(connection);
	}
}
