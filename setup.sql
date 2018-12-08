/*
Authors: Josh Lichty, Ethan Cheatham
Project: Food Search
DBMS Used: Microsoft SQL
*/

/*
//////////////////////////////////////////////////////////////////////////////////
CREATION SCRIPT
//////////////////////////////////////////////////////////////////////////////////
*/
DROP TABLE IF EXISTS dbo.Preferences;
DROP TABLE IF EXISTS dbo.Allergies;
DROP TABLE IF EXISTS dbo.Allergens;
DROP TABLE IF EXISTS dbo.Reviews;
DROP TABLE IF EXISTS dbo.Cuisine;
DROP TABLE IF EXISTS dbo.MenuItem;
DROP TABLE IF EXISTS dbo.Menu;
DROP TABLE IF EXISTS dbo.Locations;
DROP TABLE IF EXISTS dbo.Restaurant;
DROP TABLE IF EXISTS dbo.Party;
DROP TABLE IF EXISTS dbo.Customer;

CREATE TABLE Customer (
	Username varChar(25) PRIMARY KEY,
	PasswordHash varChar(64) NOT NULL,
	DisplayName varChar(60) NOT NULL
);

CREATE TABLE Party (
	PartyId int NOT NULL,
	PartyName varChar(25) NOT NULL,
	UserName varChar(25) NOT NULL,
	PRIMARY KEY (PartyId, Username),
	FOREIGN KEY (Username) REFERENCES Customer (Username)
		ON DELETE CASCADE	ON UPDATE CASCADE
);

CREATE TABLE Restaurant (
	RestId int IDENTITY PRIMARY KEY,
	RestName varChar(140) NOT NULL,
	Rating int DEFAULT 1, 
	CONSTRAINT CHK_rating CHECK (Rating >= 1 AND Rating <= 5)
);

CREATE TABLE Locations (
	LocationId int IDENTITY PRIMARY KEY,
	RestId int NOT NULL,
	StreetAddr varChar(255) NOT NULL,
	Zipcode int NOT NULL,
	FOREIGN KEY (RestId) REFERENCES Restaurant (RestId)
		ON DELETE CASCADE	ON UPDATE CASCADE
);

CREATE TABLE Menu (
	MenuId int IDENTITY PRIMARY KEY,
	RestId int NOT NULL,
	MenuName varChar(140) DEFAULT 'Menu',
	StartTime int DEFAULT 0,
	EndTime int DEFAULT 2400,
	CONSTRAINT CHK_times CHECK ((StartTime >= 0 AND EndTime <= 2400) AND (StartTime < EndTime)),
	FOREIGN KEY (RestId) REFERENCES Restaurant (RestId)
		ON DELETE CASCADE	ON UPDATE CASCADE
);

CREATE TABLE MenuItem (
	MenuItemId int IDENTITY PRIMARY KEY,
	MenuId int NOT NULL,
	ItemName varChar(50) NOT NULL,
	ItemDescription varChar(240),
	Calories int,
	Price decimal(6,2),
	FOREIGN KEY (MenuId) REFERENCES Menu (MenuId)
		ON DELETE CASCADE	ON UPDATE CASCADE
);

CREATE TABLE Cuisine (
	CuisineType varChar(25) NOT NULL,
	MenuItemId int NOT NULL,
	PRIMARY KEY(CuisineType, MenuItemId),
	FOREIGN KEY (MenuItemId) REFERENCES MenuItem (MenuItemId)
		ON DELETE CASCADE	ON UPDATE CASCADE
);

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

CREATE TABLE Allergens (
	AllergenName varChar(25) NOT NULL,
	MenuItemId int NOT NULL,
	PRIMARY KEY (AllergenName, MenuItemId),
	FOREIGN KEY (MenuItemId) REFERENCES MenuItem (MenuItemId)
		ON DELETE CASCADE	ON UPDATE CASCADE
);

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

INSERT INTO Party VALUES (1, 'Group L', 'lichtyj');
INSERT INTO Party VALUES (1, 'Group L', 'cheathame');
INSERT INTO Party VALUES (1, 'Group L', 'farisa');
INSERT INTO Party VALUES (2, 'Generic Names', 'joe');
INSERT INTO Party VALUES (2, 'Generic Names', 'bob');
INSERT INTO Party VALUES (2, 'Generic Names', 'jack');
INSERT INTO Party VALUES (2, 'Generic Names', 'steve');
INSERT INTO Party VALUES (2, 'Generic Names', 'jose');
INSERT INTO Party VALUES (2, 'Generic Names', 'frank');
INSERT INTO Party VALUES (2, 'Generic Names', 'username');

INSERT INTO Restaurant VALUES ('Blue Moon Burgers', 1);
INSERT INTO Restaurant VALUES ('Top of Tacoma', 1);
INSERT INTO Restaurant VALUES ('Pacific Grill', 3);
INSERT INTO Restaurant VALUES ('The Fish Peddler', 2);
INSERT INTO Restaurant VALUES ('The Old Spaghetti Factory', 2);
INSERT INTO Restaurant VALUES ('Stanley and Seaforts', 3);
INSERT INTO Restaurant VALUES ('The Matador', 2);
INSERT INTO Restaurant VALUES ('El Gaucho Tacoma', 4);
INSERT INTO Restaurant VALUES ('Asado Restaurant', 3);
INSERT INTO Restaurant VALUES ('Happy Teriyaki', 2);

INSERT INTO Locations VALUES (1,'523 Broadway E', '98102');
INSERT INTO Locations VALUES (2,'3529 McKinley Avenue', '981404');
INSERT INTO Locations VALUES (3,'1502 Pacific Ave', '98402');
INSERT INTO Locations VALUES (4, '1199 Dock St', '98402');
INSERT INTO Locations VALUES (5, '1250 Pacific Ave #101', '98402');
INSERT INTO Locations VALUES (6, '115 E 34th St', '98404');
INSERT INTO Locations VALUES (7, '721 Pacific Ave', '98402');
INSERT INTO Locations VALUES (8, '2119 Pacific Ave', '98402');
INSERT INTO Locations VALUES (9, '2810 6th Ave', '98406');
INSERT INTO Locations VALUES (10, '2223 Pacific Ave', '98402');

INSERT INTO Menu VALUES (1, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO Menu VALUES (2, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO Menu VALUES (3, 'Dinner', DEFAULT, DEFAULT);
INSERT INTO Menu VALUES (4, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO Menu VALUES (5, 'Lunch', DEFAULT, DEFAULT);
INSERT INTO Menu VALUES (6, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO Menu VALUES (7, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO Menu VALUES (8, 'Happy Hour', 1600, 1800);
INSERT INTO Menu VALUES (9, 'Dinner', DEFAULT, DEFAULT);
INSERT INTO Menu VALUES (10, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO MenuItem VALUES (1, 'El Diablo Azul', 'cayenne and cumin seasoning topped with fresh jalapenos, pepper jack cheese and our spicy buffalo sauce. fresh lettuce, red onion, tomato, on a ciabatta bun', NULL, NULL);
INSERT INTO MenuItem VALUES (2, 'T-Town Grinder', 'Turkey, salami, ham, Swiss and cheddar baked on a fresh herb roll topped with lettuce, tomato, pepperoncini, red onion and Tops sub sauce ', NULL, 10.25);
INSERT INTO MenuItem VALUES (3, 'Duck Confit', 'crisp duck leg confit w/ roasted parsnips, acorn squash, sweet potato, young kale, garam masala + pomegranate-cassis sauce ', NULL, 32.00);
INSERT INTO MenuItem VALUES (4, 'SEAFOOD NACHOS', 'Bay shrimp, crab, lobster, pico de gallo, cheddar jack cheese', NULL, 14.95);
INSERT INTO MenuItem VALUES (5, 'Chicken Caesar Salad', NULL, 400, 5.99);
INSERT INTO MenuItem VALUES (6, 'French Onion Soup', 'Caramelized onions, brandy, Swiss, aged parmesan', NULL, 11.00);
INSERT INTO MenuItem VALUES (7, 'BLACK BEAN QUESO', 'Black beans, habanero, garlic crema, tomatillo salsa, green onion', NULL, 7.00);
INSERT INTO MenuItem VALUES (8, 'Fried Calamari', 'roasted poblano aioli', NULL, 10.00);
INSERT INTO MenuItem VALUES (9, 'GARRON DE CORDERO', 'Braised Lamb Shank, Cipollini Mole, Served with Bacon Leek Butterbeans', NULL, 32.00);
INSERT INTO MenuItem VALUES (10, 'Teriyaki Beef', 'Thin sliced beef marinated and cooked in our special sauce', NULL, 9.95);

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

INSERT INTO Preferences VALUES ('lichtyj', 'Tacos', 12.00);
INSERT INTO Preferences VALUES ('lichtyj', 'Pizza', 20.00);
INSERT INTO Preferences VALUES ('lichtyj', 'Salad', 9.99);
INSERT INTO Preferences VALUES ('cheathame', 'Waffles', 11.00);
INSERT INTO Preferences VALUES ('cheathame', 'Spaghetti', 16.99);
INSERT INTO Preferences VALUES ('cheathame', 'Soup', 9.99);
INSERT INTO Preferences VALUES ('farisa', 'Nuggets', 5.00);
INSERT INTO Preferences VALUES ('farisa', 'Cake', 11.25);
INSERT INTO Preferences VALUES ('farisa', 'French dip', 5.00);
INSERT INTO Preferences VALUES ('farisa', 'Fish and Chips', 20.00);

