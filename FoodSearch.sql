USE master;
DROP DATABASE IF EXISTS FoodSearch;
CREATE DATABASE FoodSearch;
GO
USE FoodSearch;

DROP TABLE IF EXISTS dbo.Customer;
CREATE TABLE Customer (
	Username varChar(25) PRIMARY KEY,
	PasswordHash varChar(64) NOT NULL,
	Fname varChar(25) NOT NULL,
	Lname varChar(25) NOT NULL
);

DROP TABLE IF EXISTS dbo.Party;
CREATE TABLE Party (
	PartyID int NOT NULL,
	Username varChar(25) NOT NULL,
	PRIMARY KEY (PartyID, Username),
	FOREIGN KEY (Username) REFERENCES Customer (Username)
		ON DELETE CASCADE	ON UPDATE CASCADE
);

DROP TABLE IF EXISTS dbo.StreetAddr;
CREATE TABLE StreetAddr (
	AddressID int PRIMARY KEY,
	StreetAddr varChar(255) NOT NULL,
	Zipcode int NOT NULL,
	StateID varChar(2) NOT NULL
);

DROP TABLE IF EXISTS dbo.Restaurant;
CREATE TABLE Restaurant (
	RestID int PRIMARY KEY,
	AddressID int NOT NULL,
	Rating int DEFAULT 1, 
	FOREIGN KEY (AddressID) REFERENCES StreetAddr (AddressID)
		ON DELETE NO ACTION	ON UPDATE CASCADE,
	CONSTRAINT CHK_rating CHECK (Rating >= 1 AND Rating <= 5)
);

DROP TABLE IF EXISTS dbo.Menu;
CREATE TABLE Menu (
	MenuID int PRIMARY KEY,
	RestID int NOT NULL,
	FOREIGN KEY (RestID) REFERENCES Restaurant (RestID)
);

DROP TABLE IF EXISTS dbo.MenuItem;
CREATE TABLE MenuItem (
	MenuItemID int PRIMARY KEY,
	MenuID int NOT NULL,
	Calories int,
	Price money NOT NULL,
	FOREIGN KEY (MenuID) REFERENCES Menu (MenuID)
		ON DELETE CASCADE	ON UPDATE CASCADE
);

DROP TABLE IF EXISTS dbo.CuisineType;
CREATE TABLE CuisineType (
	CuisineID int PRIMARY KEY,
	Cuisine varChar(25) NOT NULL
);

DROP TABLE IF EXISTS dbo.Cuisine;

CREATE TABLE Cuisine (
	CuisineID int NOT NULL,
	MenuItemID int NOT NULL,
	PRIMARY KEY(CuisineID, MenuItemID),
	FOREIGN KEY (CuisineID) REFERENCES CuisineType (CuisineID)
		ON DELETE CASCADE	ON UPDATE CASCADE,
	FOREIGN KEY (MenuItemID) REFERENCES MenuItem (MenuItemID)
		ON DELETE CASCADE	ON UPDATE CASCADE
);

DROP TABLE IF EXISTS dbo.Reviews
CREATE TABLE Reviews (
	Username varChar(25),
	RestID int NOT NULL,
	CleanlinessR int,
	CleanlinessNote varChar(240),
	FoodR int,
	FoodNote varChar(240),
	ServiceR int,
	ServiceNote varChar(240),
	ValueR int, 
	ValueNote varChar(240),
	PRIMARY KEY (Username, RestID),
	FOREIGN KEY (RestID) REFERENCES Restaurant (RestID)
		ON DELETE CASCADE	ON UPDATE CASCADE,
	FOREIGN KEY (Username) REFERENCES Customer (Username)
		ON DELETE CASCADE	ON UPDATE CASCADE,

	CONSTRAINT CHK_review CHECK (
		CleanlinessR IS NOT NULL OR 
		FoodR IS NOT NULL OR 
		ServiceR IS NOT NULL OR 
		ValueR IS NOT NULL)
);
-- Work in progress