package com.cs336.pkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class ApplicationDAO {

	public Connection getConnection(){
		String connectionUrl = "jdbc:mysql://classvm60.cs.rutgers.edu:3306/YABE?autoReconnect=true";
		Connection connection = null;
		
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
		
		if(rs.next()) {
			return true;
		} 
		else {
			return false; 
		}
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
		System.out.println("user added");	
		
		preparedStatement.close();
		dbConnection.close();
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
			System.out.println("row : id = " + rs.getInt("EndUserID") + ", first name = " + rs.getString("FirstName"));
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