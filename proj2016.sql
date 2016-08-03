Drop table END_USER;
Create Table END_USER (
	EndUserID INT NOT NULL AUTO_INCREMENT, 
	FirstName VARCHAR(30),
	LastName VARCHAR(30),
	Gender VARCHAR(8),
	Username VARCHAR(30),
	Password VARCHAR(20),
	Email VARCHAR(50),
	Phone VARCHAR(20),
	UserType VARCHAR(20),
	PRIMARY KEY(EndUserID)
);

Drop table QUESTION;
Create Table QUESTION (
	ID INT NOT NULL AUTO_INCREMENT, 
	UserID INT, 
	QuestionDescription VARCHAR(150),
	PRIMARY KEY(ID),
	FOREIGN KEY(UserID) REFERENCES END_USER(EndUserID)
);


Drop table ANSWER;
Create Table ANSWER (
	ID INT NOT NULL AUTO_INCREMENT,
	UserID INT,
	QuestionID INT,
	QuestionDescription VARCHAR(150),
	PRIMARY KEY(ID),
	FOREIGN KEY(UserID) REFERENCES END_USER(EndUserID),
	FOREIGN KEY(QuestionID) REFERENCES QUESTION(ID)
);

Drop table SELLER;
Create Table SELLER (
	EndUserID INT NOT NULL,
	BankName VARCHAR(20),
	BankAccountNumber VARCHAR(20),
	BankRoutingNumber VARCHAR(20),
	PRIMARY KEY(EndUserID),
	FOREIGN KEY(EndUserID) REFERENCES END_USER(EndUserID)
);

Drop table BUYER;
Create Table BUYER (
	EndUserID INT NOT NULL, 
	CCType VARCHAR(20),
	CCNumber CHAR(16),
	ExpirationDate DATE,
	CVV VARCHAR(4),
	CardHolderName VARCHAR(25),
	ShippingStreet VARCHAR(30),
	ShippingCity VARCHAR(30),
	ShippingState CHAR(2),
	ShippingZipCode VARCHAR(10),
	PRIMARY KEY(EndUserID),
	FOREIGN KEY(EndUserID) REFERENCES END_USER(EndUserID)
);

Drop table CATEGORY;
Create Table CATEGORY (
	CategoryID INT NOT NULL AUTO_INCREMENT, 
	CategoryName VARCHAR(20),
	PRIMARY KEY(CategoryID)
);

Drop table ITEM;
Create Table ITEM (
	ItemID INT NOT NULL AUTO_INCREMENT, 
	EndUserID INT,
	CategoryID INT, 
	ItemName VARCHAR(50),
	ItemDescription VARCHAR(150),
	Color VARCHAR(15),
	QuantityOnHand INT,
	Weight VARCHAR(10),
	PRIMARY KEY(ItemID),
	FOREIGN KEY(CategoryID) REFERENCES CATEGORY(CategoryID),
	FOREIGN KEY(EndUserID) REFERENCES SELLER(EndUserID)
);

Drop table AUCTION;
Create Table AUCTION (
	AuctionID INT NOT NULL AUTO_INCREMENT, 
	ItemID INT,
	Status VARCHAR(15),
	ClosingPrice INT,
	InitialPrice INT,
	CurrentPrice INT, 
	Total_Bids SMALLINT,
	StartDate DATE,
	CloseDate DATE,
	CreatedBy INT, 
	CancelledBy INT, 
	Winner VARCHAR(40),
	PRIMARY KEY(AuctionID),
	FOREIGN KEY(CreatedBy) REFERENCES SELLER(EndUserID),
	FOREIGN KEY(CancelledBy) REFERENCES END_USER(EndUserID),
	FOREIGN KEY(ItemID) REFERENCES ITEM(ItemID)
);

Drop table ALERT;
Create Table ALERT (
	BuyerID INT,
	AuctionID INT, 
	PRIMARY KEY(BuyerID, AuctionID),
	FOREIGN KEY(BuyerID) REFERENCES BUYER(EndUserID),
	FOREIGN KEY(AuctionID) REFERENCES AUCTION(AuctionID)
);

Drop table BID;
Create Table BID (
	BidID INT NOT NULL AUTO_INCREMENT, 
	AuctionID INT,
	AuctionDateTime DATETIME,
	OfferPrice INT, 
	Cancelled BOOLEAN,
	OfferedBy INT,
	CancelledBy INT, 
	PRIMARY KEY(BidId),
	FOREIGN KEY(OfferedBy) REFERENCES BUYER(EndUserID),
	FOREIGN KEY(CancelledBy) REFERENCES END_USER(EndUserID),
	FOREIGN KEY(AuctionID) REFERENCES AUCTION(AuctionID)
);

Drop table EMAIL;
Create Table EMAIL (
	ID INT NOT NULL AUTO_INCREMENT,
	fromAddress VARCHAR(50),
	toAddress VARCHAR(50),
	Subject VARCHAR(50),
	Date_Time DATETIME,
	Content VARCHAR(1000),
	PRIMARY KEY(ID)
);
