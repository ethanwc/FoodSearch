USE master;
DROP DATABASE IF EXISTS FoodSearch;
CREATE DATABASE FoodSearch;
GO
USE FoodSearch;

DROP TABLE IF EXISTS dbo.Customer;
CREATE TABLE Customer (
	UserId varChar(25) PRIMARY KEY,
	PasswordHash varChar(64) NOT NULL,
	DisplayName varChar(60)
);

DROP TABLE IF EXISTS dbo.Party;
CREATE TABLE Party (
	PartyId int NOT NULL,
	Username varChar(25) NOT NULL,
	PRIMARY KEY (PartyId, Username),
	FOREIGN KEY (Username) REFERENCES Customer (UserId)
		ON DELETE CASCADE	ON UPDATE CASCADE
);

DROP TABLE IF EXISTS dbo.StreetAddr;
CREATE TABLE StreetAddr (
	AddressId int PRIMARY KEY,
	StreetAddr varChar(255) NOT NULL,
	Zipcode int NOT NULL,
	StateId varChar(2) NOT NULL
);

DROP TABLE IF EXISTS dbo.Restaurant;
CREATE TABLE Restaurant (
	RestId int PRIMARY KEY,
	RestName varChar(140) NOT NULL,
	Rating int DEFAULT 1, 
	CONSTRAINT CHK_rating CHECK (Rating >= 1 AND Rating <= 5)
);

DROP TABLE IF EXISTS dbo.Locations;
CREATE TABLE Locations (
	AddressId int NOT NULL,
	RestId int NOT NULL,
	PRIMARY KEY (AddressId, RestId),
	FOREIGN KEY (AddressId) REFERENCES StreetAddr (AddressId)
		ON DELETE CASCADE	ON UPDATE CASCADE,
	FOREIGN KEY (RestId) REFERENCES Restaurant (RestId)
		ON DELETE CASCADE	ON UPDATE CASCADE
);

DROP TABLE IF EXISTS dbo.Menu;
CREATE TABLE Menu (
	MenuId int PRIMARY KEY,
	RestId int NOT NULL,
	FOREIGN KEY (RestId) REFERENCES Restaurant (RestId)
		ON DELETE CASCADE	ON UPDATE CASCADE
);

DROP TABLE IF EXISTS dbo.MenuItem;
CREATE TABLE MenuItem (
	MenuItemId int PRIMARY KEY,
	MenuId int NOT NULL,
	ItemName varChar(50) NOT NULL,
	ItemDescription varChar(240),
	Calories int,
	Price decimal(6,2),
	FOREIGN KEY (MenuId) REFERENCES Menu (MenuId)
		ON DELETE CASCADE	ON UPDATE CASCADE
);

DROP TABLE IF EXISTS dbo.CuisineType;
CREATE TABLE CuisineType (
	CuisineId int PRIMARY KEY,
	Cuisine varChar(25) NOT NULL
);

DROP TABLE IF EXISTS dbo.Cuisine;

CREATE TABLE Cuisine (
	CuisineId int NOT NULL,
	MenuItemId int NOT NULL,
	PRIMARY KEY(CuisineId, MenuItemId),
	FOREIGN KEY (CuisineId) REFERENCES CuisineType (CuisineId)
		ON DELETE CASCADE	ON UPDATE CASCADE,
	FOREIGN KEY (MenuItemId) REFERENCES MenuItem (MenuItemId)
		ON DELETE CASCADE	ON UPDATE CASCADE
);

DROP TABLE IF EXISTS dbo.Reviews
CREATE TABLE Reviews (
	Username varChar(25),
	RestId int NOT NULL,
	CleanlinessR int,
	CleanlinessNote varChar(240),
	FoodR int,
	FoodNote varChar(240),
	ServiceR int,
	ServiceNote varChar(240),
	ValueR int, 
	ValueNote varChar(240),
	PRIMARY KEY (Username, RestID),
	FOREIGN KEY (RestId) REFERENCES Restaurant (RestId)
		ON DELETE CASCADE	ON UPDATE CASCADE,
	FOREIGN KEY (Username) REFERENCES Customer (UserId)
		ON DELETE CASCADE	ON UPDATE CASCADE,

	CONSTRAINT CHK_review CHECK (
		CleanlinessR IS NOT NULL OR 
		FoodR IS NOT NULL OR 
		ServiceR IS NOT NULL OR 
		ValueR IS NOT NULL)
);

DROP TABLE IF EXISTS dbo.Allergens
CREATE TABLE Allergens (
	Id int PRIMARY KEY,
	Allergen varChar(25)
);

DROP TABLE IF EXISTS dbo.Allergies
CREATE TABLE Allergies (
	AllergenId int NOT NULL,
	UserId varChar(25) NOT NULL,
	Severity int DEFAULT 5,
	Sensitivity int DEFAULT 5,
	FOREIGN KEY (UserId) REFERENCES Customer (UserId)
		ON DELETE CASCADE	ON UPDATE CASCADE,
	FOREIGN KEY (AllergenId) REFERENCES Allergens (Id)
		ON DELETE NO ACTION	ON UPDATE NO ACTION,
	CONSTRAINT CHK_Severity CHECK (Severity >= 1 AND Severity <= 5),
	CONSTRAINT CHK_Sensitivity CHECK (Sensitivity >= 1 AND Sensitivity <= 5)
)

DROP TABLE IF EXISTS dbo.FoodAllergens
CREATE TABLE FoodAllergens (
	AllergenId int NOT NULL,
	MenuItemId int NOT NULL,
	PRIMARY KEY (AllergenId, MenuItemId),
	FOREIGN KEY (AllergenId) REFERENCES Allergens (Id)
		ON DELETE NO ACTION	ON UPDATE NO ACTION,
	FOREIGN KEY (MenuItemId) REFERENCES MenuItem (MenuItemId)
		ON DELETE CASCADE	ON UPDATE CASCADE
);

DROP TABLE IF EXISTS dbo.Preferences
CREATE TABLE Preferences (
	PrefId int PRIMARY KEY IDENTITY,
	UserId varChar(25) NOT NULL,
	maxPrice decimal(6,2),
	CuisineId int,
	FOREIGN KEY (UserId) REFERENCES Customer (UserId)
		ON DELETE CASCADE	ON UPDATE CASCADE,
	FOREIGN KEY (CuisineId) REFERENCES CuisineType (CuisineId)
		ON DELETE CASCADE	ON UPDATE CASCADE
)


--  TABLE: Customers
--		UserId varChar(25) PRIMARY KEY
--		PasswordHash varChar(64) NOT NULL,
--		DisplayName varChar(60)
INSERT INTO Customer VALUES ('lichtyj', 'password', 'Josh');
INSERT INTO Customer VALUES ('cheathame', 'password', 'Ethan');
INSERT INTO Customer VALUES ('farisa', 'password', 'Alelign');

--	TABLE: Party
--		PartyId int NOT NULL,
--		Username varChar(25) NOT NULL,
--		PRIMARY KEY (PartyId, Username),
--		FOREIGN KEY (Username) REFERENCES Customer (UserId)
INSERT INTO Party VALUES (1, 'lichtyj');
INSERT INTO Party VALUES (1, 'cheathame');
INSERT INTO Party VALUES (1, 'farisa');

--	TABLE: StreetAddr
--		AddressId int PRIMARY KEY,
--		StreetAddr varChar(255) NOT NULL,
--		Zipcode int NOT NULL,
--		StateId varChar(2) NOT NULL
INSERT INTO StreetAddr VALUES (1 ,'523 Broadway E', '98102', 'WA');

--	TABLE: Restaurant
--		RestId int PRIMARY KEY,
--		RestName varChar(140) NOT NULL,
--		Rating int DEFAULT 1, 
--		FOREIGN KEY (AddressId) REFERENCES StreetAddr (AddressId)
--		CONSTRAINT CHK_rating CHECK (Rating >= 1 AND Rating <= 5)
INSERT INTO Restaurant VALUES (1, 'Blue Moon Burgers', 1);

--	TABLE: Locations
--	AddressId int NOT NULL,
--	RestId int NOT NULL,
--	PRIMARY KEY (AddressId, RestId),
--	FOREIGN KEY (AddressId) REFERENCES StreetAddr (AddressId)
--	FOREIGN KEY (RestId) REFERENCES Restaurant (RestId)
INSERT INTO Locations VALUES (1, 1);

--	TABLE: Menu
--		MenuId int PRIMARY KEY,
--		RestId int NOT NULL,
--		FOREIGN KEY (RestId) REFERENCES Restaurant (RestId)
INSERT INTO Menu VALUES (1, 1);

--	TABLE: MenuItem
--		MenuItemId int PRIMARY KEY,
--		MenuId int NOT NULL,
--		ItemName varChar(50) NOT NULL,
--		Description varChar(240),
--		Calories int,
--		Price decimal(6,2),
--		FOREIGN KEY (MenuId) REFERENCES Menu (MenuId)
INSERT INTO MenuItem VALUES (1, 1, 'El Diablo Azul', 'cayenne and cumin seasoning topped with fresh jalapenos, pepper jack cheese and our spicy buffalo sauce. fresh lettuce, red onion, tomato, on a ciabatta bun', NULL, NULL);

--	TABLE: CuisineType
--		CuisineId int PRIMARY KEY,
--		Cuisine varChar(25) NOT NULL
INSERT INTO CuisineType VALUES (1, 'American');
INSERT INTO CuisineType VALUES (2, 'Japanese');
INSERT INTO CuisineType VALUES (3, 'Breakfast');
INSERT INTO CuisineType VALUES (4, 'Italian');
INSERT INTO CuisineType VALUES (5, 'French');
INSERT INTO CuisineType VALUES (6, 'Thai');
INSERT INTO CuisineType VALUES (7, 'Chinese');
INSERT INTO CuisineType VALUES (8, 'Greek');
INSERT INTO CuisineType VALUES (9, 'Vegetarian');
INSERT INTO CuisineType VALUES (10, 'Dessert');
INSERT INTO CuisineType VALUES (11, 'Mexican');
INSERT INTO CuisineType VALUES (12, 'Jamaican');
INSERT INTO CuisineType VALUES (13, 'Brunch');
INSERT INTO CuisineType VALUES (14, 'Ethiopian');
INSERT INTO CuisineType VALUES (15, 'Egyptian');

--	TABLE: Cuisine
--		CuisineId int NOT NULL,
--		MenuItemId int NOT NULL,
--		PRIMARY KEY(CuisineId, MenuItemId),
--		FOREIGN KEY (CuisineId) REFERENCES CuisineType (CuisineId)
--		FOREIGN KEY (MenuItemId) REFERENCES MenuItem (MenuItemId)
INSERT INTO Cuisine VALUES (1, 1);

--	TABLE: Reviews
--		Username varChar(25),
--		RestId int NOT NULL,
--		CleanlinessR int,
--		CleanlinessNote varChar(240),
--		FoodR int,
--		FoodNote varChar(240),
--		ServiceR int,
--		ServiceNote varChar(240),
--		ValueR int, 
--		ValueNote varChar(240),
--		PRIMARY KEY (Username, RestID),
--		FOREIGN KEY (RestId) REFERENCES Restaurant (RestId)
--		FOREIGN KEY (Username) REFERENCES Customer (UserId)
--		CONSTRAINT CHK_review CHECK (
--			CleanlinessR IS NOT NULL OR 
--			FoodR IS NOT NULL OR 
--			ServiceR IS NOT NULL OR 
--			ValueR IS NOT NULL
INSERT INTO Reviews VALUES ('lichtyj', 1, 3, NULL, 5, NULL, 3, NULL, 5, NULL);

--	TABLE: Allergens
--		Id int PRIMARY KEY,
--		Allergen varChar(25)
INSERT INTO Allergens VALUES (1, 'Eggs');
INSERT INTO Allergens VALUES (2, 'Peanut');
INSERT INTO Allergens VALUES (3, 'Milk');
INSERT INTO Allergens VALUES (4, 'Fish');
INSERT INTO Allergens VALUES (5, 'Soybean');
INSERT INTO Allergens VALUES (6, 'Mustard');
INSERT INTO Allergens VALUES (7, 'Nut');
INSERT INTO Allergens VALUES (8, 'Sesame');
INSERT INTO Allergens VALUES (9, 'Shellfish');
INSERT INTO Allergens VALUES (10, 'Wheat');
INSERT INTO Allergens VALUES (11, 'Cheez');
INSERT INTO Allergens VALUES (12, 'Beans');

--	TABLE: Allergies
--		AllergenId int NOT NULL,
--		UserId varChar(25) NOT NULL,
--		Severity int DEFAULT 5,		// 1 being a minor reaction, 5 being death
--		Sensitivity int DEFAULT 5,	// 1 being consuming a significant quantity, 5 being cross contamination
--		FOREIGN KEY (UserId) REFERENCES Customer (UserId),
--		FOREIGN KEY (AllergenId) REFERENCES Allergens (Id),
--		CONSTRAINT CHK_Severity CHECK (Severity >= 1 AND Severity <= 5),
--		CONSTRAINT CHK_Sensitivity CHECK (Sensitivity >= 1 AND Sensitivity <= 5)
INSERT INTO Allergies VALUES (1, 'lichtyj', 1, 1);

--	TABLE: FoodAllergens
--		AllergenId int NOT NULL,
--		MenuItemId int NOT NULL,
--		PRIMARY KEY (AllergenId, MenuItemId),
--		FOREIGN KEY (AllergenId) REFERENCES Allergens (Id),
--		FOREIGN KEY (MenuItemId) REFERENCES MenuItem (MenuItemId)
INSERT INTO FoodAllergens VALUES (3, 1);
INSERT INTO FoodAllergens VALUES (10, 1);

--	TABLE: Preferences
--		PrefId int PRIMARY KEY IDENTITY,  <Identity means it auto-increments, leave this field blank
--		UserId varChar(25) NOT NULL,
--		maxPrice decimal(6,2),
--		CuisineId int,
--		FOREIGN KEY (UserId) REFERENCES Customer (UserId),
--		FOREIGN KEY (CuisineId) REFERENCES CuisineType (CuisineId)
INSERT INTO Preferences VALUES ('lichtyj', 20.00, 11);
