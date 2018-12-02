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
	Username varChar(25) PRIMARY KEY,
	PasswordHash varChar(64) NOT NULL,
	DisplayName varChar(60)
);

DROP TABLE IF EXISTS dbo.Party;
CREATE TABLE Party (
	PartyId int NOT NULL,
	UserId varChar(25) NOT NULL,
	PRIMARY KEY (PartyId, UserId),
	FOREIGN KEY (UserId) REFERENCES Customer (Username)
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
	FOREIGN KEY (RestId) REFERENCES Restaurant (RestId)
		ON DELETE CASCADE	ON UPDATE CASCADE
);

DROP TABLE IF EXISTS dbo.Menu;
CREATE TABLE Menu (
	MenuId int PRIMARY KEY,
	RestId int NOT NULL,
	MenuName varChar(140),
	StartTime int DEFAULT 0,
	EndTime int DEFAULT 2400,
	CONSTRAINT CHK_times CHECK ((StartTime >= 0 AND EndTime <= 2400) AND (StartTime < EndTime)),
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

DROP TABLE IF EXISTS dbo.Cuisine;

CREATE TABLE Cuisine (
	CuisineType varChar(25) NOT NULL,
	MenuItemId int NOT NULL,
	PRIMARY KEY(CuisineType, MenuItemId),
	FOREIGN KEY (MenuItemId) REFERENCES MenuItem (MenuItemId)
		ON DELETE CASCADE	ON UPDATE CASCADE
);

DROP TABLE IF EXISTS dbo.Reviews;
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
	FOREIGN KEY (Username) REFERENCES Customer (Username)
		ON DELETE CASCADE	ON UPDATE CASCADE,

	CONSTRAINT CHK_review CHECK (
		CleanlinessR IS NOT NULL OR 
		FoodR IS NOT NULL OR 
		ServiceR IS NOT NULL OR 
		ValueR IS NOT NULL)
);

DROP TABLE IF EXISTS dbo.Allergens;
CREATE TABLE Allergens (
	AllergenName varChar(25) NOT NULL,
	MenuItemId int NOT NULL,
	PRIMARY KEY (AllergenName, MenuItemId),
	FOREIGN KEY (MenuItemId) REFERENCES MenuItem (MenuItemId)
		ON DELETE CASCADE	ON UPDATE CASCADE
);

DROP TABLE IF EXISTS dbo.Allergies;
CREATE TABLE Allergies (
	AllergenName varChar(25) NOT NULL,
	Username varChar(25) NOT NULL,
	Severity int DEFAULT 5,
	Sensitivity int DEFAULT 5,
	PRIMARY KEY (AllergenName, Username),
	FOREIGN KEY (Username) REFERENCES Customer (Username)
		ON DELETE CASCADE	ON UPDATE CASCADE,
	CONSTRAINT CHK_Severity CHECK (Severity >= 1 AND Severity <= 5),
	CONSTRAINT CHK_Sensitivity CHECK (Sensitivity >= 1 AND Sensitivity <= 5)
);

DROP TABLE IF EXISTS dbo.Preferences;
CREATE TABLE Preferences (
	Username varChar(25) NOT NULL,
	CuisineName varChar(25),
	maxPrice decimal(6,2),
	PRIMARY KEY (CuisineName, Username),
	FOREIGN KEY (Username) REFERENCES Customer (Username)
		ON DELETE CASCADE	ON UPDATE CASCADE
);

/*
//////////////////////////////////////////////////////////////////////////////////
POPULATE
//////////////////////////////////////////////////////////////////////////////////
*/

USE FoodSearch;

INSERT INTO Customer VALUES ('lichtyj', 'password', 'Josh');
INSERT INTO Customer VALUES ('cheathame', 'password', 'Ethan');
INSERT INTO Customer VALUES ('farisa', 'password', 'Alelign');
INSERT INTO Customer VALUES ('joe', 'password', 'Joe');
INSERT INTO Customer VALUES ('bob', 'password', 'Bob');
INSERT INTO Customer VALUES ('jack', 'password', 'Jack');
INSERT INTO Customer VALUES ('steve', 'password', 'Steve');
INSERT INTO Customer VALUES ('jose', 'password', 'Jose');
INSERT INTO Customer VALUES ('frank', 'password', 'Frank');
INSERT INTO Customer VALUES ('username', 'password', 'Billy');

INSERT INTO Party VALUES (1, 'lichtyj');
INSERT INTO Party VALUES (1, 'cheathame');
INSERT INTO Party VALUES (1, 'farisa');
INSERT INTO Party VALUES (2, 'joe');
INSERT INTO Party VALUES (2, 'bob');
INSERT INTO Party VALUES (2, 'jack');
INSERT INTO Party VALUES (2, 'steve');
INSERT INTO Party VALUES (2, 'jose');
INSERT INTO Party VALUES (2, 'frank');
INSERT INTO Party VALUES (2, 'username');

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

INSERT INTO Cuisine VALUES ('American', 1);
INSERT INTO Cuisine VALUES ('American', 2);
INSERT INTO Cuisine VALUES ('French', 3);
INSERT INTO Cuisine VALUES ('Mexican', 4);
INSERT INTO Cuisine VALUES ('Italian', 5);
INSERT INTO Cuisine VALUES ('French', 6);
INSERT INTO Cuisine VALUES ('Mexican', 7);
INSERT INTO Cuisine VALUES ('Japanese', 8);
INSERT INTO Cuisine VALUES ('Mexican', 9);
INSERT INTO Cuisine VALUES ('Chinese', 10);

INSERT INTO Reviews VALUES ('lichtyj', 1, 3, NULL, 5, NULL, 3, NULL, 5, NULL);
INSERT INTO Reviews VALUES ('farisa', 2, 3, NULL, 3, NULL, 5, NULL, 3, NULL);
INSERT INTO Reviews VALUES ('joe', 3, 4, NULL, 1, NULL, 4, NULL, 1, NULL);
INSERT INTO Reviews VALUES ('bob', 4, 3, NULL, 2, NULL, 3, NULL, 5, NULL);
INSERT INTO Reviews VALUES ('jose', 5, 5, NULL, 3, NULL, 3, NULL, 3, NULL);
INSERT INTO Reviews VALUES ('jose', 6, 3, NULL, 1, NULL, 2, NULL, 5, NULL);
INSERT INTO Reviews VALUES ('frank', 7, 1, NULL, 4, NULL, 1, NULL, 3, NULL);
INSERT INTO Reviews VALUES ('username', 8, 2, NULL, 3, NULL, 3, NULL, 4, NULL);
INSERT INTO Reviews VALUES ('jack', 9, 3, NULL, 3, NULL, 5, NULL, 4, NULL);
INSERT INTO Reviews VALUES ('cheathame', 10, 3, NULL, 4, NULL, 3, NULL, 4, NULL);

INSERT INTO Allergies VALUES ('Dairy', 'lichtyj', 1, 1);
INSERT INTO Allergies VALUES ('Eggs', 'jose', 3, 4);
INSERT INTO Allergies VALUES ('Eggs', 'joe', 4, 5);
INSERT INTO Allergies VALUES ('Shellfish', 'bob', 5, 3);
INSERT INTO Allergies VALUES ('Nut', 'bob', 5, 4);
INSERT INTO Allergies VALUES ('Mustard', 'bob', 1, 2);
INSERT INTO Allergies VALUES ('Soybean', 'jack', 1, 3);
INSERT INTO Allergies VALUES ('Fish', 'username', 2, 5);
INSERT INTO Allergies VALUES ('Dairy', 'username', 3, 3);
INSERT INTO Allergies VALUES ('Sesame', 'frank', 4, 2);
INSERT INTO Allergies VALUES ('Wheat', 'joe', 5, 1);

INSERT INTO Allergens VALUES ('Dairy', 1);
INSERT INTO Allergens VALUES ('Wheat', 1);
INSERT INTO Allergens VALUES ('Wheat', 2);
INSERT INTO Allergens VALUES ('Shellfish', 4);
INSERT INTO Allergens VALUES ('Dairy', 4);
INSERT INTO Allergens VALUES ('Fish', 5);
INSERT INTO Allergens VALUES ('Wheat', 6);
INSERT INTO Allergens VALUES ('Fish', 8);
INSERT INTO Allergens VALUES ('Wheat', 8);
INSERT INTO Allergens VALUES ('Soybean', 10);

INSERT INTO Preferences VALUES ('lichtyj', 1, 20.00, 11);
INSERT INTO Preferences VALUES ('cheathame', 2, 10.00, 4);
INSERT INTO Preferences VALUES ('farisa', 3, 30.00, 3);
INSERT INTO Preferences VALUES ('joe', 4, 19.99, 2);
INSERT INTO Preferences VALUES ('bob', 5, 200.01, 6); 
INSERT INTO Preferences VALUES ('jack', 6, 50.00, 8);
INSERT INTO Preferences VALUES ('steve', 7, 10.00, 9);
INSERT INTO Preferences VALUES ('jose', 8, 600.00, 10);
INSERT INTO Preferences VALUES ('frank', 9, 100.00, 1);
INSERT INTO Preferences VALUES ('username', 1, 10.00, 3); 

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
WHERE c.Username = pref.Username AND pref.Username = p.UserId AND pref.maxPrice > (
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
WHERE c.Username = p.Username AND p.CuisineName = 'Mexican'
INTERSECT (
SELECT  c.DisplayName
FROM Customer c, Preferences p
WHERE c.Username = p.Username AND p.CuisineName = 'Breakfast');

-- Query Six: Retrieve all Customers that prefer n "Italian" (int) type cuisine.
SELECT DisplayName
FROM Customer
WHERE Username = (
	SELECT Username
	FROM Preferences
	WHERE CuisineName = 4);

-- Query Seven:
-- Allows users to sort by high/low reviews
-- Return Username, 4 qualities of rating based on Customer, where rating is >= 3.
SELECT c.Username, ValueR, FoodR, ServiceR, CleanlinessR
FROM Reviews r, Customer c
WHERE ValueR >= 3 AND FoodR >= 3 AND ServiceR >= 3 AND CleanlinessR >= 3 AND c.Username = r.Username
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