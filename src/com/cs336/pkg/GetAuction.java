package com.cs336.pkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class GetAuction {

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
	public LinkedList<Auction> getAllAuction() throws SQLException{
		LinkedList<Auction> listOfAuctions = new LinkedList<Auction>();
		String selectString = "select * from AUCTION;";
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		int resLength = 0;
		ResultSet rs = preparedStatement.executeQuery();
		while(rs.next( )) {
			//System.out.println("CategoryName  = " + rs.getString("CategoryName") );
			resLength++;
			listOfAuctions.add(
					new Auction (rs.getInt("ItemID"), 
								 rs.getString("status"),
								 rs.getDouble("closingPrice"),
								 rs.getDouble("initialPrice"),
								 rs.getInt("totalBids"),
								 rs.getDate("startDate"),
								 rs.getDate("closeDate"),
								 rs.getInt("createdBy"),
								 rs.getInt("cancelledBy")
								 ));
		}
		System.out.println("Select statement executed, " + resLength + " rows retrieved");
		
		//close everything
		preparedStatement.close();
		dbConnection.close();
		
		return listOfAuctions;
	}	
}
	