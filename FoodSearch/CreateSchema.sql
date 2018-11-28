/*
Authors: Josh Lichty, Ethan Cheatham, Alelign Faris
Project: Food Search
DBMS Used: Microsoft SQL
*/

/*
//////////////////////////////////////////////////////////////////////////////////
CREATION SCRIPT
//////////////////////////////////////////////////////////////////////////////////
*/

DROP TABLE IF EXISTS dbo.Customer;
CREATE TABLE Customer (
	UserId int PRIMARY KEY,
	Username varChar(25),
	PasswordHash varChar(64) NOT NULL,
	DisplayName varChar(60)
);

DROP TABLE IF EXISTS dbo.Party;
CREATE TABLE Party (
	PartyId int NOT NULL,
	UserId int NOT NULL,
	PRIMARY KEY (PartyId, UserId),
	FOREIGN KEY (UserId) REFERENCES Customer (UserId)
		ON DELETE CASCADE	ON UPDATE CASCADE
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
	LocationId int PRIMARY KEY,
	RestId int NOT NULL,
	StreetAddr varChar(255) NOT NULL,
	Zipcode int NOT NULL,
	StateId varChar(2) NOT NULL,
	FOREIGN KEY (RestId) REFERENCES Restaurant (RestId)
		ON DELETE CASCADE	ON UPDATE CASCADE
);

DROP TABLE IF EXISTS dbo.Menu;
CREATE TABLE Menu (
	MenuId int PRIMARY KEY,
	RestId int NOT NULL,
	MenuName varChar(140),
	StartTime int,
	EndTime int,
	CONSTRAINT CHK_times CHECK (
		(StartTime IS NULL AND EndTime is NULL) 
		OR ((StartTime IS NOT NULL AND EndTime IS NOT NULL) 
		AND (StartTime < EndTime))),
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
	UserId int,
	RestId int NOT NULL,
	CleanlinessR int,
	CleanlinessNote varChar(240),
	FoodR int,
	FoodNote varChar(240),
	ServiceR int,
	ServiceNote varChar(240),
	ValueR int, 
	ValueNote varChar(240),
	PRIMARY KEY (UserId, RestID),
	FOREIGN KEY (RestId) REFERENCES Restaurant (RestId)
		ON DELETE CASCADE	ON UPDATE CASCADE,
	FOREIGN KEY (UserId) REFERENCES Customer (UserId)
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
	UserId int NOT NULL,
	Severity int DEFAULT 5,
	Sensitivity int DEFAULT 5,
	FOREIGN KEY (UserId) REFERENCES Customer (UserId)
		ON DELETE CASCADE	ON UPDATE CASCADE,
	FOREIGN KEY (AllergenId) REFERENCES Allergens (Id)
		ON DELETE NO ACTION	ON UPDATE NO ACTION,
	CONSTRAINT CHK_Severity CHECK (Severity >= 1 AND Severity <= 5),
	CONSTRAINT CHK_Sensitivity CHECK (Sensitivity >= 1 AND Sensitivity <= 5)
);



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
	PrefId int PRIMARY KEY,
	UserId int NOT NULL,
	maxPrice decimal(6,2),
	CuisineId int,
	FOREIGN KEY (UserId) REFERENCES Customer (UserId)
		ON DELETE CASCADE	ON UPDATE CASCADE,
	FOREIGN KEY (CuisineId) REFERENCES CuisineType (CuisineId)
		ON DELETE CASCADE	ON UPDATE CASCADE
);