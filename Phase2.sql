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

USE master;
DROP DATABASE IF EXISTS FoodSearch;
CREATE DATABASE FoodSearch;
GO
USE FoodSearch;

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

/*
//////////////////////////////////////////////////////////////////////////////////
POPULATE
//////////////////////////////////////////////////////////////////////////////////
*/

USE FoodSearch

INSERT INTO Customer VALUES (1, 'lichtyj', 'password', 'Josh');
INSERT INTO Customer VALUES (2, 'cheathame', 'password', 'Ethan');
INSERT INTO Customer VALUES (3, 'farisa', 'password', 'Alelign');
INSERT INTO Customer VALUES (4, 'joe', 'password', 'Joe');
INSERT INTO Customer VALUES (5, 'bob', 'password', 'Bob');
INSERT INTO Customer VALUES (6, 'jack', 'password', 'Jack');
INSERT INTO Customer VALUES (7 ,'steve', 'password', 'Steve');
INSERT INTO Customer VALUES (8 ,'jose', 'password', 'Jose');
INSERT INTO Customer VALUES (9 ,'frank', 'password', 'Frank');
INSERT INTO Customer VALUES (10, 'username', 'password', 'Billy');

INSERT INTO Party VALUES (1, 1);
INSERT INTO Party VALUES (1, 2);
INSERT INTO Party VALUES (1, 3);
INSERT INTO Party VALUES (2, 4);
INSERT INTO Party VALUES (2, 5);
INSERT INTO Party VALUES (2, 6);
INSERT INTO Party VALUES (2, 7);
INSERT INTO Party VALUES (2, 8);
INSERT INTO Party VALUES (2, 9);
INSERT INTO Party VALUES (2, 10);

INSERT INTO Restaurant VALUES (1, 'Blue Moon Burgers', 1);
INSERT INTO Restaurant VALUES (2, 'Top of Tacoma', 1);
INSERT INTO Restaurant VALUES (3, 'Pacific Grill', 3);
INSERT INTO Restaurant VALUES (4, 'The Fish Peddler', 2);
INSERT INTO Restaurant VALUES (5, 'The Old Spaghetti Factory', 2);
INSERT INTO Restaurant VALUES (6, 'Stanley and Seaforts', 3);
INSERT INTO Restaurant VALUES (7, 'The Matador', 2);
INSERT INTO Restaurant VALUES (8, 'El Gaucho Tacoma', 4);
INSERT INTO Restaurant VALUES (9, 'Asado Restaurant', 3);
INSERT INTO Restaurant VALUES (10, 'Happy Teriyaki', 2);;

INSERT INTO Locations VALUES (1, 1,'523 Broadway E', '98102', 'WA');
INSERT INTO Locations VALUES (2, 2,'3529 McKinley Avenue', '981404', 'WA');
INSERT INTO Locations VALUES (3, 3,'1502 Pacific Ave', '98402', 'WA');
INSERT INTO Locations VALUES (4, 4, '1199 Dock St', '98402', 'WA');
INSERT INTO Locations VALUES (5, 5, '1250 Pacific Ave #101', '98402', 'WA');
INSERT INTO Locations VALUES (6, 6, '115 E 34th St', '98404', 'WA');
INSERT INTO Locations VALUES (7, 7, '721 Pacific Ave', '98402', 'WA');
INSERT INTO Locations VALUES (8, 8, '2119 Pacific Ave', '98402', 'WA');
INSERT INTO Locations VALUES (9, 9, '2810 6th Ave', '98406', 'WA');
INSERT INTO Locations VALUES (10, 10, '2223 Pacific Ave', '98402', 'WA');

INSERT INTO Menu VALUES (1, 1, NULL, NULL, NULL);
INSERT INTO Menu VALUES (2, 2, NULL, NULL, NULL);
INSERT INTO Menu VALUES (3, 3, 'Dinner', NULL, NULL);
INSERT INTO Menu VALUES (4, 4, NULL, NULL, NULL);
INSERT INTO Menu VALUES (5, 5, 'Lunch', NULL, NULL);
INSERT INTO Menu VALUES (6, 6, NULL, NULL, NULL);
INSERT INTO Menu VALUES (7, 7, NULL, NULL, NULL);
INSERT INTO Menu VALUES (8, 8, 'Happy Hour', 1600, 1800);
INSERT INTO Menu VALUES (9, 9, 'Dinner', NULL, NULL);
INSERT INTO Menu VALUES (10, 10, NULL, NULL, NULL);

INSERT INTO MenuItem VALUES (1, 1, 'El Diablo Azul', 'cayenne and cumin seasoning topped with fresh jalapenos, pepper jack cheese and our spicy buffalo sauce. fresh lettuce, red onion, tomato, on a ciabatta bun', NULL, NULL);
INSERT INTO MenuItem VALUES (2, 2, 'T-Town Grinder', 'Turkey, salami, ham, Swiss and cheddar baked on a fresh herb roll topped with lettuce, tomato, pepperoncini, red onion and Top’s sub sauce ', NULL, 10.25);
INSERT INTO MenuItem VALUES (3, 3, 'Duck Confit', 'crisp duck leg confit w/ roasted parsnips, acorn squash, sweet potato, young kale, garam masala + pomegranate-cassis sauce ', NULL, 32.00);
INSERT INTO MenuItem VALUES (4, 4, 'SEAFOOD NACHOS', 'Bay shrimp, crab, lobster, pico de gallo, cheddar jack cheese', NULL, 14.95);
INSERT INTO MenuItem VALUES (5, 5, 'Chicken Caesar Salad', NULL, 400, 5.99);
INSERT INTO MenuItem VALUES (6, 6, 'French Onion Soup', 'Caramelized onions, brandy, Swiss, aged parmesan', NULL, 11.00);
INSERT INTO MenuItem VALUES (7, 7, 'BLACK BEAN QUESO', 'Black beans, habanero, garlic crema, tomatillo salsa, green onion', NULL, 7.00);
INSERT INTO MenuItem VALUES (8, 8, 'Fried Calamari', 'roasted poblano aioli', NULL, 10.00);
INSERT INTO MenuItem VALUES (9, 9, 'GARRON DE CORDERO', 'Braised Lamb Shank, Cipollini Mole, Served with Bacon Leek Butterbeans', NULL, 32.00);
INSERT INTO MenuItem VALUES (10, 10, 'Teriyaki Beef', 'Thin sliced beef marinated and cooked in our special sauce', NULL, 9.95);

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
INSERT INTO CuisineType VALUES (14, 'English');

INSERT INTO Cuisine VALUES (1, 1);
INSERT INTO Cuisine VALUES (1, 2);
INSERT INTO Cuisine VALUES (5, 3);
INSERT INTO Cuisine VALUES (11, 4);
INSERT INTO Cuisine VALUES (4, 5);
INSERT INTO Cuisine VALUES (5, 6);
INSERT INTO Cuisine VALUES (11, 7);
INSERT INTO Cuisine VALUES (2, 8);
INSERT INTO Cuisine VALUES (11, 9);
INSERT INTO Cuisine VALUES (7, 10);

INSERT INTO Reviews VALUES (1, 1, 3, NULL, 5, NULL, 3, NULL, 5, NULL);
INSERT INTO Reviews VALUES (3, 2, 3, NULL, 3, NULL, 5, NULL, 3, NULL);
INSERT INTO Reviews VALUES (4, 3, 4, NULL, 1, NULL, 4, NULL, 1, NULL);
INSERT INTO Reviews VALUES (6, 4, 3, NULL, 2, NULL, 3, NULL, 5, NULL);
INSERT INTO Reviews VALUES (7, 5, 5, NULL, 3, NULL, 3, NULL, 3, NULL);
INSERT INTO Reviews VALUES (8, 6, 3, NULL, 1, NULL, 2, NULL, 5, NULL);
INSERT INTO Reviews VALUES (9, 7, 1, NULL, 4, NULL, 1, NULL, 3, NULL);
INSERT INTO Reviews VALUES (10, 8, 2, NULL, 3, NULL, 3, NULL, 4, NULL);
INSERT INTO Reviews VALUES (4, 9, 3, NULL, 3, NULL, 5, NULL, 4, NULL);
INSERT INTO Reviews VALUES (2, 10, 3, NULL, 4, NULL, 3, NULL, 4, NULL);


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

INSERT INTO Allergies VALUES (3, 1, 1, 1);
INSERT INTO Allergies  VALUES (1, 5, 3, 4);
INSERT INTO Allergies VALUES (1, 4, 4, 5);
INSERT INTO Allergies VALUES (9, 4, 5, 3);
INSERT INTO Allergies VALUES (8, 4, 5, 4);
INSERT INTO Allergies VALUES (7, 4, 1, 2);
INSERT INTO Allergies VALUES (5, 5, 1, 3);
INSERT INTO Allergies VALUES (4, 6, 2, 5);
INSERT INTO Allergies VALUES (3, 7, 3, 3);
INSERT INTO Allergies VALUES (6, 8, 4, 2);
INSERT INTO Allergies VALUES (10, 9, 5, 1);

INSERT INTO FoodAllergens VALUES (3, 1);
INSERT INTO FoodAllergens VALUES (10, 1);
INSERT INTO FoodAllergens VALUES (10, 2);
INSERT INTO FoodAllergens VALUES (9, 4);
INSERT INTO FoodAllergens VALUES (3, 4);
INSERT INTO FoodAllergens VALUES (4, 5);
INSERT INTO FoodAllergens VALUES (10, 6);
INSERT INTO FoodAllergens VALUES (4, 8);
INSERT INTO FoodAllergens VALUES (10, 8);
INSERT INTO FoodAllergens VALUES (5, 10);

INSERT INTO Preferences VALUES (1, 1, 20.00, 11);
INSERT INTO Preferences VALUES (2, 2, 10.00, 4);
INSERT INTO Preferences VALUES (3, 3,30.00, 3);
INSERT INTO Preferences VALUES (4, 4, 19.99, 2);
INSERT INTO Preferences VALUES (5, 5, 200.01, 6); 
INSERT INTO Preferences VALUES (6, 6, 50.00, 8);
INSERT INTO Preferences VALUES (7, 7,10.00, 9);
INSERT INTO Preferences VALUES (8, 8, 600.00, 10);
INSERT INTO Preferences VALUES (9, 9, 100.00, 1);
INSERT INTO Preferences VALUES (10, 1, 10.00, 3); 

/*
//////////////////////////////////////////////////////////////////////////////////
QUERIES
//////////////////////////////////////////////////////////////////////////////////
*/

-- Query One: Computes a join of at least three tables
-- Displays all food options in FoodSearch
SELECT *
FROM Restaurant
INNER JOIN Menu ON Restaurant.RestId = Menu.RestId
INNER JOIN MenuItem ON Menu.MenuId = MenuItem.MenuId;

-- Query Two: Uses nested queries with the ANY or ALL operator and uses a GROUP BY clause
-- User searches by PartyId
-- Displays Restaurants and Menu Items everyone can afford
SELECT r.RestName, mi.ItemName
FROM Restaurant r, Menu m, MenuItem mi
WHERE r.RestId = m.MenuId AND m.MenuId = mi.MenuId AND  mi.Price < ALL (
	SELECT p.maxPrice
	FROM Preferences p, Party
	WHERE Party.PartyId = 2) GROUP BY r.RestName, mi.ItemName

-- Query Three: A correlated nested query
-- Display the customers in a party with above average budgets
SELECT c.DisplayName, pref.maxPrice
FROM Customer c, Party p, Preferences pref
WHERE c.UserId = pref.UserId AND pref.UserId = p.UserId AND pref.maxPrice > (
	SELECT AVG(pref2.maxPrice)
	FROM Preferences pref2, Party p2
	WHERE p.PartyId = p2.PartyId)

-- Query Four: Uses a FULL JOIN
-- Combine all Restaurant Names and Reviews
SELECT rest.RestName, rev.CleanlinessR, rev.FoodR, rev.ServiceR, rev.ValueR
FROM Restaurant rest
FULL OUTER JOIN Reviews rev ON rest.RestId = rev.RestId
ORDER BY rest.RestName;

-- Query Five: Uses nested queries with any of the set operations UNION, EXCEPT, or INTERSECT
-- Display users who like <Mexican> and <Breakfast>
SELECT  c.DisplayName
FROM Customer c, Preferences p
WHERE c.UserId = p.UserId AND p.CuisineId = 11
INTERSECT (
SELECT  c.DisplayName
FROM Customer c, Preferences p
WHERE c.UserId = p.UserId AND p.CuisineId = 3);

-- Query Six: Retrieve all Customers that prefer n "Italian" (int) type cuisine.
SELECT DisplayName
FROM Customer
WHERE UserId = (
	SELECT UserId
	FROM Preferences
	WHERE CuisineId = 4);

-- Query Seven:
-- Allows users to sort by high/low reviews
-- Return Username, 4 qualities of rating based on Customer, where rating is >= 3.
SELECT Username, ValueR, FoodR, ServiceR, CleanlinessR
FROM Reviews r, Customer c
WHERE ValueR >= 3 AND FoodR >= 3 AND ServiceR >= 3 AND CleanlinessR >= 3 AND c.UserId = r.UserId
ORDER BY ValueR DESC;

-- Query Eight:
-- Search by price, instead of name
-- Returns all menu items that are <= specified price.
SELECT Mi.ItemName
FROM MenuItem Mi
WHERE Mi.price <= 6.00;

-- Query Nine: Retrieve restaurants ordered by average reviews (cleanliness/food/service/value)
SELECT r.RestName, (re.CleanlinessR + re.FoodR + re.ServiceR + re.ValueR)/4.0 as Total
FROM Restaurant r, Reviews re
WHERE r.RestId = re.RestId
ORDER BY Total DESC;

-- Query Ten: Search Database for specific food item(search bar, important feature)
SELECT r.RestName, mi.ItemName
FROM MenuItem mi, Restaurant r, Menu m
WHERE mi.ItemName LIKE '%lamb%' OR mi.ItemDescription LIKE '%lamb%' 
								AND r.RestId = M.MenuId 
								AND m.MenuId = mi.MenuId;

-- Query Eleven:
-- Retrieve the price of a specified menu item.
-- Returns a the price of menu item.
SELECT Mi.price
FROM MenuItem Mi
WHERE Mi.MenuItemId = '2';