package com.cs336.pkg;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SqlDateTime {

	public static void main(String[] args) throws ParseException {
		java.util.Date javaDate = new java.util.Date();
		long javaTime = javaDate.getTime();
		System.out.println("The Java Date is: " + javaDate.toString());

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");

		Date parsedTimeStamp = dateFormat.parse("2014-08-22 15:02");

		Timestamp timestamp = new Timestamp(parsedTimeStamp.getTime());

		System.out.println(timestamp);

		java.sql.Date sqlDate = new java.sql.Date(javaTime);
		System.out.println("The SQL DATE is: " + sqlDate.toString());

		java.sql.Time sqlTime = new java.sql.Time(javaTime);
		System.out.println("The SQL TIME is: " + sqlTime.toString());

		java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(javaTime);
		System.out.println("The SQL TIMESTAMP is: " + sqlTimestamp.toString());
	}
}