-- Query One: Computes a join of at least three tables
-- Used for a 'settings/personal info' page.
-- Expects all the information from customer, preferences, and allergies based on the customer's userid.
SELECT *
FROM Customer
INNER JOIN Preferences ON Customer.UserId = Preferences.UserId
INNER JOIN Allergies ON Customer.UserId = Allergies.UserId;


-- Query Two: Uses nested queries with the ANY or ALL operator and uses a GROUP BY clause
-- User searches by Locations (state).
-- Expects a list of all Restaurants in Washington.
SELECT RestName
FROM Restaurant
WHERE RestId = ANY (
	SELECT RestId
	FROM Locations
	WHERE StateId = 'WA')
	GROUP BY RestId;


-- Query Three: A correlated nested query
-- Display the customers with above average budgets
SELECT c.DisplayName, pref.maxPrice
FROM Customer c, Party p, Preferences pref
WHERE c.UserId = pref.UserId AND pref.UserId = p.UserId AND pref.maxPrice > (
    SELECT AVG(pref2.maxPrice)
    FROM Preferences pref2, Party p2
    WHERE p.PartyId = p2.PartyId);


-- Query Four: Uses a FULL JOIN
-- Used to display a specific user's rating information on a 'review' section of a specific restaurant.
-- Expects a table containting Customer name ordered descending, and their notes on the qualities of the restaurant.
SELECT Customer.DisplayName, Reviews.CleanlinessNote, Reviews.FoodNote, Reviews.ServiceNote, Reviews.ValueNote
FROM Customer
FULL OUTER JOIN Reviews ON Customer.UserId = Reviews.Username
ORDER BY Customer.DisplayName;


-- Query Five: Uses nested queries with any of the set operations UNION, EXCEPT, or INTERSECT
-- Determines what users are willing to spend x amount of money on an item.
-- Expects a list of Customers that have a max price > $5.00
SELECT  C.UserId
FROM Customer C INTERSECT (
SELECT P.UserId
FROM Preferences P
WHERE P.maxPrice > 5.00);


-- Query Six: Retrieve all Customers that prefer n "Italian" (int) type cuisine.
-- Used to send specific recommendations to users about "Italian" restaurants.
-- Expects a list of Customers that favor "Italian" food.
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
FROM Reviews
WHERE ValueR >= 3 AND FoodR >= 3 AND ServiceR >= 3 AND CleanlinessR >= 3
ORDER BY ValueR DESC;


-- Query Eight:
-- Used to compute total average of a restaurant "review" composed of multiple ratings.
-- Returns the average of the reviews.
SELECT R.RestName, (Re.CleanlinessR + Re.FoodR + Re.ServiceR + Re.ValueR)/4 as Total
FROM Restaurant R, Reviews Re
WHERE R.RestId = '1';


-- Query Nine: 
-- Browse ALL Restaurants based on rating (descending).
-- Retrieve price of a menu item.
SELECT R.RestName, (Re.CleanlinessR + Re.FoodR + Re.ServiceR + Re.ValueR)/4 as Total
FROM Restaurant R, Reviews Re
WHERE R.RestId = Re.RestId
ORDER BY Total DESC;


-- Query Ten: 
-- Search Database for specific food item(search bar, important feature)
-- Returns all food items matching search.
SELECT Mi.ItemName
FROM MenuItem Mi
WHERE Mi.ItemName LIKE 'El Diablo Azul%';


-- Query Eleven:
-- Retrieve the price of a specified menu item.
-- Returns a the price of menu item.
SELECT Mi.price
FROM MenuItemId Mi
WHERE Mi.MenuItemId = '1';


-- Query Twelve:
-- Search by price, instead of name
-- Returns all menu items that are <= specified price.
SELECT Mi.ItemName
FROM MenuItem Mi
WHERE Mi.price <= 6.00;