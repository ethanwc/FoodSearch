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