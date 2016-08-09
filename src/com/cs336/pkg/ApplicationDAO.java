package com.cs336.pkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedList;

public class ApplicationDAO {

	public Connection getConnection() {
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
			connection = DriverManager.getConnection(connectionUrl, "root", "RepDepKept4");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return connection;
	}

	public void closeConnection(Connection connection) {
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/*
	 * End User Methods
	 */

	public boolean userLogin(String username, String password) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "SELECT Username, Password FROM END_USER WHERE Username ='" + username + "' AND Password = '"
				+ password + "'";
		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();

		if (rs.next()) {
			return true;
		} 
		else {
			return false;
		}
	}
	
	
	
	public String getUserType(int id) throws SQLException {
		Connection dbConnection = getConnection(); 
		String query; 
		String EndUserType = "Buyer";
		query = "SELECT UserType FROM END_USER WHERE EndUserID = '" + id + "'";
		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();

		if(rs.next()){
			EndUserType = rs.getString("UserType");
		}
		
		return EndUserType;
	}

	public void insertEndUser(EndUser endUser) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "Insert into END_USER(FirstName, LastName, Gender, Username, Password, Email, Phone, UserType) values (?,?,?,?,?,?,?,?)";
		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		preparedStatement.setString(1, endUser.getFirstName());
		preparedStatement.setString(2, endUser.getLastName());
		preparedStatement.setString(3, endUser.getGender());
		preparedStatement.setString(4, endUser.getUsername());
		preparedStatement.setString(5, endUser.getPassword());
		preparedStatement.setString(6, endUser.getEmail());
		preparedStatement.setString(7, endUser.getPhoneNum());
		preparedStatement.setString(8, endUser.getUserType());
		preparedStatement.executeUpdate();
		System.out.println("user added");

		preparedStatement.close();
		dbConnection.close();
	}

	public int getEndUserID(String username) throws SQLException {
		Connection dbConnection = getConnection();
		int id = 0; 
		String query = "SELECT EndUserID FROM END_USER WHERE Username='" + username + "'";
		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();
		if(rs.next()) {
			id = rs.getInt("EndUserID");
		}
		
		return id;
	}

	/*
	 * Buyer Methods
	 */

	public void insertBuyer(Buyer buyer, int id) throws SQLException {
		System.out.println("got here");
		Connection dbConnection = getConnection();
		String query = "INSERT INTO BUYER(EndUserID,CCType,CCNumber,ExpirationDate,CVV,CardHolderName,ShippingStreet,ShippingCity,ShippingState,ShippingZipCode) VALUES"
				+ "(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		preparedStatement.setInt(1, id);
		preparedStatement.setString(2, buyer.getCcType());
		preparedStatement.setString(3, buyer.getCcNumber());
		preparedStatement.setDate(4, buyer.getExpirationDate());
		preparedStatement.setString(5, buyer.getcVV());
		preparedStatement.setString(6, buyer.getCardHolderName());
		preparedStatement.setString(7, buyer.getShippingStreet());
		preparedStatement.setString(8, buyer.getShippingCity());
		preparedStatement.setString(9, buyer.getShippingState());
		preparedStatement.setString(10, buyer.getShippingZipCode());
		preparedStatement.executeUpdate();
		System.out.println("buyer added");
	}

	public ResultSet getBuyerBids(int userID) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "SELECT AuctionID,BidID,OfferPrice,OfferedBy FROM BID" + " WHERE OfferedBy=" + userID;

		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();
		return rs;
	}

	/*
	 * Seller Methods
	 */

	public boolean sellerExists(int id) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "SELECT EndUserId from SELLER " + "WHERE EndUserId=" + id;
		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();

		if (rs.next()) {
			return true;
		}

		return false;
	}

	public void insertSeller(Seller seller, int id) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "INSERT INTO SELLER(EndUserID,BankName,BankAccountNumber,BankRoutingNumber) VALUES(?,?,?,?)";
		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		preparedStatement.setInt(1, id);
		preparedStatement.setString(2, seller.getBankName());
		preparedStatement.setString(3, seller.getBankAccountNumber());
		preparedStatement.setString(4, seller.getBankRoutingNumber());

		preparedStatement.executeUpdate();
		System.out.println("seller added");
	}

	public ResultSet getSellerItems(int sellerID, boolean joinCategory) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "";

		if (!joinCategory) {
			query = "SELECT ItemID, ItemName, ItemDescription, Color, QuantityOnHand, Weight FROM ITEM "
					+ "JOIN SELLER ON ITEM.EndUserID = SELLER.EndUserID AND SELLER.EndUserID=" + sellerID + "";
		} else {
			query = "SELECT * FROM ITEM, CATEGORY, SELLER WHERE"
					+ " ITEM.CategoryID = CATEGORY.CategoryID AND ITEM.EndUserID = SELLER.EndUserID AND SELLER.EndUserID="
					+ sellerID + "";
		}

		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();
		return rs;
	}

	public ResultSet getSellerID(Seller seller) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "SELECT EndUserID FROM SELLER" + "WHERE EndUserID = " + seller.getSellerID();

		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();
		return rs;
	}

	public ResultSet getSellerAuctions(int sellerID) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "SELECT AuctionID,ItemID,Status,ClosingPrice,InitialPrice,Total_Bids,StartDate,CloseDate,CreatedBy FROM AUCTION"
				+ " JOIN SELLER ON AUCTION.CreatedBy = SELLER.EndUserID AND SELLER.EndUserId=" + sellerID + "";

		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();
		return rs;
	}
	
	/*
	 * Alert methods 
	 */
	
	
	
	/*
	 * Auction Methods
	 */

	public void insertAuction(Auction auction) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "Insert into AUCTION(ItemID,Status,ClosingPrice,InitialPrice,Total_Bids,StartDate,CloseDate,CreatedBy) values (?,?,?,?,?,?,?,?)";
		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		preparedStatement.setInt(1, auction.getItemID());
		preparedStatement.setString(2, auction.getStatus());
		preparedStatement.setDouble(3, auction.getClosingPrice());
		preparedStatement.setDouble(4, auction.getInitialPrice());
		preparedStatement.setInt(5, auction.getTotalBids());
		preparedStatement.setDate(6, auction.getStartDate());
		preparedStatement.setDate(7, auction.getCloseDate());
		preparedStatement.setInt(8, auction.getCreatedBy());

		preparedStatement.executeUpdate();
		preparedStatement.close();
		dbConnection.close();
	}

	public ResultSet getAuctionItemName(int itemId) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "SELECT ItemName FROM ITEM WHERE ItemID=" + itemId + "";

		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();
		return rs;
	}
	
	public ResultSet getAuction(int auctionID) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "SELECT * FROM AUCTION WHERE AuctionID=" + auctionID + "";
		
		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();
		return rs;
	}

	public ResultSet getAllAuctions() throws SQLException {
		Connection dbConnection = getConnection();
		String query = "SELECT AuctionID,ItemID,Status,ClosingPrice,InitialPrice,Total_Bids,StartDate,CloseDate,CreatedBy FROM AUCTION";

		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();
		return rs;
	}

	public ResultSet getAuctionID(Auction auction) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "SELECT AuctionID FROM AUCTION" + "WHERE ItemID=" + auction.getItemID() + "AND CreatedBy="
				+ auction.getCreatedBy();

		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();
		return rs;
	}

	// receives a specific auctionID and returns all of the bids corresponding
	// to that auctionID
	public ResultSet getAuctionBids(int auctionID) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "SELECT BidID,OfferPrice,OfferedBy FROM BID " + "WHERE BID.AuctionID=" + auctionID;

		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();
		return rs;
	}

	/*
	 * Bid Methods
	 */

	public void insertBid(Bid bid) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "Insert into BID(AuctionID,BidDateTime,OfferPrice,Cancelled,OfferedBy) values (?,?,?,?,?)";
		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
		preparedStatement.setInt(1, bid.getAuctionID());
		preparedStatement.setDate(2, date);
		preparedStatement.setDouble(3, bid.getOfferPrice());
		preparedStatement.setBoolean(4, false);
		preparedStatement.setInt(5, bid.getOfferedBy());
		preparedStatement.executeUpdate();
		preparedStatement.close();
		dbConnection.close();
	}

	/*
	 * Item Methods
	 */

	public void insertItem(Item item) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "Insert into ITEM(EndUserID,CategoryID,ItemName,ItemDescription,Color,QuantityOnHand,Weight) values (?,?,?,?,?,?,?)";
		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		preparedStatement.setInt(1, item.getSellerID());
		preparedStatement.setInt(2, item.getCategoryID());
		preparedStatement.setString(3, item.getName());
		preparedStatement.setString(4, item.getDescription());
		preparedStatement.setString(5, item.getColor());
		preparedStatement.setInt(6, item.getQuantityOnHand());
		preparedStatement.setString(7, item.getWeight());

		preparedStatement.executeUpdate();
		preparedStatement.close();
		dbConnection.close();
	}
	
	public ResultSet getItem(int id) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "SELECT * FROM ITEM WHERE ItemID=" + id + "";
		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();
		return rs;
	}
	
	
	/*
	 * Category Methods
	 */

	public ResultSet getCategories() throws SQLException {
		Connection dbConnection = getConnection();
		String query = "SELECT CategoryID,CategoryName FROM CATEGORY";
		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();
		return rs;
	}
	

	/*
	 * Searching 
	 */
	/**
	 * 
	 * 
	 * 
	 * 
	 * FUNCTIONS CIERA USES
	 * @throws SQLException 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * */



	/*
	 * 
	 * MY SEARCH FUNCTION, IS CALLED FROM CJ_SEARCHBY CATEGORY
	 * THE RESULTS ARE THEN SHOWN IN CJ_SEARCHRESULTS
	 * */
	public ResultSet SearchResults(String categoryID, String color, String status, String priceMin, String priceMax, String weightMin, String weightMax, String sortby, String orderby) throws SQLException {
		Connection dbConnection = getConnection(); 
		String specifiedColor = "";
		String specifiedStatus = "";
		String specifiedCategory = "";
		String orderBy = "";
		
		if(sortby.length() > 1){
			orderBy = orderby;
		}
		if(color.length()>0) {
			specifiedColor = " AND I.Color = '" + color+"'";
		}

		if(status.length()>0){
			specifiedStatus = " And A.Status = '" + status+"'";
		}

		if(categoryID.length()>0){
			specifiedCategory = " AND " + categoryID + " = I.CategoryID AND C.CategoryID = I.CategoryID ";
		}

		String query = "SELECT I.ItemName, C.CategoryName, I.Color, I.Weight, A.Status, A.InitialPrice, A.ClosingPrice, A.AuctionID"
				+ " FROM AUCTION A, ITEM I, CATEGORY C  WHERE  "
				+ " I.Weight >=  " + weightMin + "  AND I.Weight <=  " + weightMax + "  AND  "
				+ "  A.InitialPrice >=  "+ priceMin + " AND A.InitialPrice <=  " + priceMax 
				+ specifiedColor + specifiedStatus + specifiedCategory + "  AND A.ItemID = I.ItemID  AND C.CategoryID = A.Category " + " " + sortby + " " + orderBy;
		System.out.print(query);
		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();
		return rs;
	}
		/*
	 * 
	 * GETS THE INFOMATION I NEED TO MAKE A SEARCH USING ITEMS 
	 * 
	 * */
	public ResultSet getSellerItemsFromCategory(int category) throws SQLException {
		Connection dbConnection = getConnection(); 
		String query = "SELECT ItemID, ItemName, ItemDescription, Color, QuantityOnHand, Weight FROM ITEM";
		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();

		return rs;
	}

	public ResultSet getCategoryAndID() throws SQLException{
		Connection dbConnection = getConnection(); 
		String query; 
		query = "SELECT * FROM CATEGORY";	

		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();

		return rs;
	}
	/*
	 * 
	 * GETS THE STATUS OF AN AUCTION TO BE PUT IN A DROP DOWN FRM CJ_SEARCHBYCATEGORY
	 * 
	 * */
	public ResultSet getDistinctStatus() throws SQLException{
		Connection dbConnection = getConnection(); 
		String query; 
		query = "SELECT DISTINCT Status FROM AUCTION";	

		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();

		return rs;
	}

	/* SUB QUERY
	 *  MIGHT NOT USE THIS ANYMORE. 
	 *  I HAVE TO DOUBLE CHECK */
	public ResultSet getItemsWhereCategory(int categoryid) throws SQLException {

		Connection dbConnection = getConnection(); 
		String query; 

		if(categoryid!=0)
		{
			query = "SELECT ItemID, ItemName, ItemDescription, Color, QuantityOnHand, Weight "
					+ "FROM ITEM WHERE CategoryID =" +categoryid+ "";

		}
		else
		{
			query = "SELECT ItemID, ItemName, ItemDescription, Color, QuantityOnHand, Weight FROM ITEM";	
		}


		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();

		return rs;
	}

	/*
	 * GETS DISTINCT COLOR TO SEARCH BY COLOR FROM 
	 * */
	public ResultSet getItemsColor() throws SQLException {

		Connection dbConnection = getConnection(); 
		String query; 

		query = "SELECT DISTINCT I.Color FROM ITEM I, AUCTION A WHERE A.ItemID = I.ItemID";


		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();

		return rs;
	}

	public ResultSet getMaxWeight() throws SQLException {

		Connection dbConnection = getConnection(); 
		String query; 

		query = "SELECT DISTINCT I.Weight from ITEM I, AUCTION A WHERE A.ItemID = I.ItemID order by Weight desc";

		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();

		return rs;
	}


	public ResultSet getMaxPrice() throws SQLException {

		Connection dbConnection = getConnection(); 
		String query; 

		query = "SELECT InitialPrice FROM AUCTION order by InitialPrice desc";


		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();

		return rs;

	}

	public ResultSet getUnansweredQuestions() throws SQLException {

		Connection dbConnection = getConnection(); 
		String query; 

		query = "SELECT DISTINCT QuestionDescription, Q.ID From QUESTION Q Where Q.ID  NOT IN (SELECT A.QuestionID From ANSWER A)";


		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();

		return rs;

	}


	public String getQuestionFromQuestionID(String id) throws SQLException {

		Connection dbConnection = getConnection(); 
		String query; 
		String Question = "";

		query = "SELECT QuestionDescription From QUESTION Q Where Q.ID  = " + id;


		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();
		System.out.print(query);


		if(rs.next()){
			Question = rs.getString("QuestionDescription");
		}
		return Question;
	}	

	public int getUserIDFromQuestionID(String id) throws SQLException {

		Connection dbConnection = getConnection(); 
		String query; 
		int userID= 0;

		query = "SELECT UserID From QUESTION Q Where Q.ID  = " + id;


		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();
		System.out.println(query);


		if(rs.next()){
			userID = rs.getInt("UserID");
			System.out.print("user id is : " + userID);
		}
		return userID;
	}	

	public int getCountOfUnansweredQuestions() throws SQLException {

		Connection dbConnection = getConnection(); 
		String query; 
		int count= 0;

		query = "SELECT Count(*) AS count From QUESTION Q Where Q.ID  NOT IN (SELECT A.QuestionID From ANSWER A)";


		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();
		System.out.println(query);


		if(rs.next()){
			count = rs.getInt("count");
			System.out.print("count is : " + count);
		}
		return count;
	}	
	public int getUserID(String name, String password) throws SQLException {

		Connection dbConnection = getConnection(); 
		String query; 
		int EndUserID = 0;

		query = "SELECT EndUserID FROM END_USER WHERE Username = '" + name +"' AND password = '" + password + "'";


		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();
		System.out.println(query);


		if(rs.next()){
			EndUserID = rs.getInt("EndUserID");
			System.out.println("end user id is" + EndUserID);
		}
		return EndUserID;


	}
	
	/*
	 * 
	 * CIERAS INSERT INTO TABLE FUNCTIONS
	 * 
	 */

	public void insertAlert(int BuyerID, String AuctionID) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "Insert into ALERT"
				+ "(BuyerID, AuctionID) "
				+ "values ("+BuyerID+","+ AuctionID+")";
		PreparedStatement preparedStatement=dbConnection.prepareStatement(query); 
		System.out.print(query);
		preparedStatement.executeUpdate();
		preparedStatement.close();
		dbConnection.close();
	}
	
	public void insertQuestion(int UserID, String Question) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "Insert into QUESTION"
				+ "(UserID, QuestionDescription) "
				+ "values ("+UserID+",'"+ Question+"')";
		PreparedStatement preparedStatement=dbConnection.prepareStatement(query); 

		preparedStatement.executeUpdate();
		preparedStatement.close();
		dbConnection.close();
	}

	public void insertAnswer(String UserID, String QuestionID, String Answer) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "Insert into ANSWER"
				+ "(UserID, QuestionID, Answer) "
				+ "values ("+UserID+","+QuestionID+", '"+ Answer+"')";
		System.out.println(query);
		PreparedStatement preparedStatement=dbConnection.prepareStatement(query); 

		preparedStatement.executeUpdate();
		preparedStatement.close();
		dbConnection.close();
	}
	
/*
 * 
 *FUNCTIONS USED IN SEARCH FUNCTIONALITY 
 * 
 */
	public static String[] stopwords = {"a", "as", "able", "about", "above", "according", "accordingly",
			"across", "actually", "after", "afterwards", "again", "against", "aint", "all", "allow", 
			"allows", "almost", "alone", "along", "already", "also", "although", "always", "am", "among",
			"amongst", "an", "and", "another", "any", "anybody", "anyhow", "anyone", "anything", "anyway", 
			"anyways", "anywhere", "apart", "appear", "appreciate", "appropriate", "are", "arent", "around", 
			"as", "aside", "ask", "asking", "associated", "at", "available", "away", "awfully", "be", "became", 
			"because", "become", "becomes", "becoming", "been", "before", "beforehand", "behind", "being", "believe", 
			"below", "beside", "besides", "best", "better", "between", "beyond", "both", "brief", "but", "by", "cmon", ""
					+ "cs", "came", "can", "cant", "cannot", "cant", "cause", "causes", "certain", "certainly", "changes",
					"clearly", "co", "com", "come", "comes", "concerning", "consequently", "consider", "considering", "contain",
					"containing", "contains", "corresponding", "could", "couldnt", "course", "currently", "definitely", "described", 
					"despite", "did", "didnt", "different", "do", "does", "doesnt", "doing", "dont", "done", "down", "downwards", 
					"during", "each", "edu", "eg", "eight", "either", "else", "elsewhere", "enough", "entirely", "especially", "et", 
					"etc", "even", "ever", "every", "everybody", "everyone", "everything", "everywhere", "ex", "exactly", "example", 
					"except", "far", "few", "ff", "fifth", "first", "five", "followed", "following", "follows", "for", "former", 
					"formerly", "forth", "four", "from", "further", "furthermore", "get", "gets", "getting", "given", "gives", "go",
					"goes", "going", "gone", "got", "gotten", "greetings", "had", "hadnt", "happens", "hardly", "has", "hasnt", "have", 
					"havent", "having", "he", "hes", "hello", "help", "hence", "her", "here", "heres", "hereafter", "hereby", "herein", 
					"hereupon", "hers", "herself", "hi", "him", "himself", "his", "hither", "hopefully", "how", "howbeit", 
					"however", "i", "id", "ill", "im", "ive", "ie", "if", "ignored", "immediate", "in", "inasmuch", "inc", 
					"indeed", "indicate", "indicated", "indicates", "inner", "insofar", "instead", "into", "inward", "is", 
					"isnt", "it", "itd", "itll", "its", "its", "itself", "just", "keep", "keeps", "kept", "know", "knows",
					"known", "last", "lately", "later", "latter", "latterly", "least", "less", "lest", "let", "lets", "like",
					"liked", "likely", "little", "look", "looking", "looks", "ltd", "mainly", "many", "may", "maybe", 
					"me", "mean", "meanwhile", "merely", "might", "more", "moreover", "most", "mostly", "much",
					"must", "my", "myself", "name", "namely", "nd", "near", "nearly", "necessary", "need", "needs", 
					"neither", "never", "nevertheless", "new", "next", "nine", "no", "nobody", "non", "none", "noone",
					"nor", "normally", "not", "nothing", "novel", "now", "nowhere", "obviously", "of", "off", "often",
					"oh", "ok", "okay", "old", "on", "once", "one", "ones", "only", "onto", "or", "other", "others", 
					"otherwise", "ought", "our", "ours", "ourselves", "out", "outside", "over", "overall", "own", 
					"particular", "particularly", "per", "perhaps", "placed", "please", "plus", "possible", "presumably", 
					"probably", "provides", "que", "quite", "qv", "rather", "rd", "re", "really", "reasonably", "regarding",
					"regardless", "regards", "relatively", "respectively", "right", "said", "same", "saw", "say", 
					"saying", "says", "second", "secondly", "see", "seeing", "seem", "seemed", "seeming", "seems",
					"seen", "self", "selves", "sensible", "sent", "serious", "seriously", "seven", "several", "shall", 
					"she", "should", "shouldnt", "since", "six", "so", "some", "somebody", "somehow", "someone",
					"something", "sometime", "sometimes", "somewhat", "somewhere", "soon", "sorry", "specified", 
					"specify", "specifying", "still", "sub", "such", "sup", "sure", "ts", "take", "taken", 
					"tell", "tends", "th", "than", "thank", "thanks", "thanx", "that", "thats", "thats", 
					"the", "their", "theirs", "them", "themselves", "then", "thence", "there", "theres", 
					"thereafter", "thereby", "therefore", "therein", "theres", "thereupon", "these", "they",
					"theyd", "theyll", "theyre", "theyve", "think", "third", "this", "thorough", "thoroughly", 
					"those", "though", "three", "through", "throughout", "thru", "thus", "to", "together", 
					"too", "took", "toward", "towards", "tried", "tries", "truly", "try", "trying", "twice", 
					"two", "un", "under", "unfortunately", "unless", "unlikely", "until", "unto", "up", 
					"upon", "us", "use", "used", "useful", "uses", "using", "usually", "value", "various", 
					"very", "via", "viz", "vs", "want", "wants", "was", "wasnt", "way", "we", "wed", "well", 
					"were", "weve", "welcome", "well", "went", "were", "werent", "what", "whats", "whatever", 
					"when", "whence", "whenever", "where", "wheres", "whereafter", "whereas", "whereby", "wherein", 
					"whereupon", "wherever", "whether", "which", "while", "whither", "who", "whos", "whoever", "whole", 
					"whom", "whose", "why", "will", "willing", "wish", "with", "within", "without", "wont", "wonder", 
					"would", "would", "wouldnt", "yes", "yet", "you", "youd", "youll", "youre", "youve", "your", "yours", 
					"yourself", "yourselves", "zero", ".", "?", "," , "/", "find"};
	
	
	public static ArrayList<String> wordsList = new ArrayList<String>();

	public void removeStopWords(String RemoveStopWords){
		wordsList.clear();
		RemoveStopWords = RemoveStopWords.trim().replaceAll("\\s+", " ");
		System.out.println("After trim:  " + RemoveStopWords);
		//String[] words = RemoveStopWords.split(" ");
		String[] words = RemoveStopWords.replaceAll("[^a-zA-Z ]", "").toLowerCase().split("\\s+");

		for (String word : words) {
			wordsList.add(word);
		}
		System.out.println("After for loop:  " + wordsList);

		for (int j = 0; j < stopwords.length; j++) {
			if (wordsList.contains(stopwords[j])) {
				wordsList.remove(stopwords[j]);//remove it
			}
		}
		for (String str : wordsList) {
			System.out.print(str + " ");
		}

	}
	
	public ResultSet SearchFromArrayList() throws SQLException {

		Connection dbConnection = getConnection(); 
		String query = ""; 
		int i = 0;
		for (String str : wordsList) {
			if(i != 0){ query = query.concat(" UNION "); }
			query = query.concat(" (SELECT  Q.QuestionDescription, A.Answer FROM QUESTION Q, ANSWER A WHERE A.QuestionID = Q.ID AND Q.QuestionDescription LIKE '%"+str+"%' AND Q.ID IN (SELECT A.QuestionID From ANSWER A)) ");
			i++;
		
		}
		i = 0;
		System.out.println(query);
		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();

		return rs;
	}

	
	
	/**
	 * 
	 * 
	 * END OF CIERA FUNCTIONS
	 * 
	 * 
	 * 
	 * 
	 * */	


	
	
	
	public LinkedList<EndUser> getAllUsers() throws SQLException {
		LinkedList<EndUser> listOfPeople = new LinkedList<EndUser>();
		// display all tuples
		String selectString = "select * from END_USER;";
		Connection dbConnection = getConnection();
		PreparedStatement preparedStatement = dbConnection.prepareStatement(selectString);
		int resLength = 0;
		// creating a ResultSet
		ResultSet rs = preparedStatement.executeQuery();
		
		// iterate through the resultSet
		while (rs.next()) {
			System.out.println("row : id = " + rs.getInt("EndUserID") + ", first name = " + rs.getString("FirstName"));
			resLength++;
			listOfPeople.add(new EndUser(rs.getString("FirstName"), rs.getString("LastName"), rs.getString("Gender"),
					rs.getString("Username"), rs.getString("Password"), rs.getString("Email"), rs.getString("Phone"),
					rs.getString("UserType")));
		}
		
		System.out.println("Select statement executed, " + resLength + " rows retrieved");
		// close everything
		preparedStatement.close();
		dbConnection.close();
		return listOfPeople;
	}
	
	public ResultSet GRgetEarnings(String FilterType) throws SQLException {
		Connection dbConnection = getConnection();
		String query = "";

		if (FilterType.equals("TotalEarnings")) {
			query = "SELECT COUNT(a.AuctionID) as Total_Finished_Auctions, SUM(a.ClosingPrice) as Total_Earnings FROM AUCTION a WHERE a.status='Closed'";
		} 
		else if (FilterType.equals("PerEndUser")) {
			query = "SELECT DISTINCT u.EndUserID, u.FirstName, u.LastName, COUNT(a.CreatedBy) as Auction_Count, SUM(a.ClosingPrice) as Total_Earning FROM END_USER u, AUCTION a WHERE u.EndUserID = a.CreatedBy AND a.status='Closed' group by u.EndUserID";
		} 
		else if (FilterType.equals("PerItem")) {
			query = "SELECT DISTINCT a.ItemID, i.ItemName, SUM(a.ClosingPrice) as Total_Earning_Item FROM AUCTION a, ITEM i WHERE a.ItemID = i.ItemID AND	a.status='Closed' group by i.ItemID";
		} 
		else if (FilterType.equals("PerCategory")) {
			query = "SELECT DISTINCT a.Category, c.CategoryName, SUM(a.ClosingPrice) as Total_Earning_ItemCategory FROM AUCTION a, CATEGORY c WHERE a.Category = c.CategoryID AND a.status='Closed' group by a.Category";
		} 
		else if (FilterType.equals("BestSellingItems")) {
			query = "SELECT DISTINCT a.ItemID, i.ItemName, SUM(a.ClosingPrice) as Total_Earning_Item FROM AUCTION a, ITEM i WHERE a.ItemID = i.ItemID AND a.status='Closed' group by a.ItemID ORDER BY Total_Earning_Item DESC;";
		} 
		else if (FilterType.equals("BestBuyers")) {
			query = "SELECT DISTINCT u.EndUserID, u.FirstName, u.LastName, COUNT(a.Winner) as Auction_Count, SUM(a.ClosingPrice) as Total_Spending FROM END_USER u, AUCTION a WHERE u.EndUserID = a.Winner AND a.status='Closed' group by u.EndUserID ORDER BY SUM(a.ClosingPrice) DESC";
		} 
		else if (FilterType.equals("BestSellers")) {
			query = "SELECT DISTINCT u.EndUserID, u.FirstName, u.LastName, COUNT(a.CreatedBy) as AUCTION_COUNT, SUM(a.ClosingPrice) as TOTAL_EARNING FROM END_USER u, AUCTION a WHERE u.EndUserID = a.CreatedBy AND a.status='Closed' group by u.EndUserID ORDER BY SUM(a.ClosingPrice) DESC";
		}

		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();
		return rs;
	}

	public ResultSet GRgetAllQuestions(String type) throws SQLException{
		Connection dbConnection = getConnection();
		String query = "";
		
		if(type.equals("all")) {
			query ="SELECT q.UserId, u.FirstName, u.LastName, q.ID as Question_Number, q.QuestionDescription FROM QUESTION q, END_USER u WHERE q.UserID = u.EndUserID group by q.ID";
		}
		else if(type.equals("answered")) {
			query ="SELECT q.UserId, u.FirstName, u.LastName, q.ID as Question_Number, q.QuestionDescription, a.Answer FROM QUESTION q, END_USER u, ANSWER a WHERE q.UserID = u.EndUserID AND a.QuestionID = q.ID group by q.ID";
		}
		else if(type.equals("unanswered")) {
			query = "SELECT q.UserId, u.FirstName, u.LastName, q.ID as Question_Number, q.QuestionDescription FROM QUESTION q, END_USER u WHERE q.UserID = u.EndUserID AND q.ID NOT IN(SELECT a.QuestionID FROM ANSWER a) group by q.ID";	
		}
		
		PreparedStatement preparedStatement = dbConnection.prepareStatement(query);
		ResultSet rs = preparedStatement.executeQuery();
		return rs;
	}
	
	public static void main(String[] args) {
		ApplicationDAO dao = new ApplicationDAO();
		Connection connection = dao.getConnection();
		EndUser user = new EndUser("Shachar", "Zeplovitch", "Male", "szeplovitch95", "123456",
				"szeplovitch95@gmail.com", "2019652035", "admin");
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
