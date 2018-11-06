-- Query One: Computes a join of at least three tables
-- Used for a 'settings/personal info' page.
-- Expects all the information from customer, preferences, and allergies based on the customer's userid.
SELECT *
FROM Customer
INNER JOIN Preferences ON Customer.UserId = Preferences.UserId
INNER JOIN Allergies ON Customer.UserId = Allergies.UserId;


-- Query Two: Uses nested queries with the ANY or ALL operator and uses a GROUP BY clause
-- User searches by location (state).
-- Expects a list of all Restaurants in Washington.
SELECT RestName
FROM Restaurant
WHERE RestId = ANY (
	SELECT RestId
	FROM Locations
	WHERE AddressID = ANY (
		SELECT AddressID
		FROM StreetAddr
		WHERE StateId = 'WA'));


-- Query Three: A correlated nested query
-- Retrieves user's preferences in order to display releveant results.
-- Expects a list of the user's preferences.
-- ????????????????

-- Query Four: Uses a FULL JOIN
-- Used to display a specific user's rating information on a 'review' section of a specific restaurant.
-- Expects a table containting Customer name ordered descending, and their notes on the qualities of the restaurant.
SELECT Customer.DisplayName, Reviews.CleanlinessNote, Reviews.FoodNote, Reviews.ServiceNote, Reviews.ValueNote
FROM Customer
FULL OUTER JOIN Reviews ON Customer.UserId = Reviews.Username
ORDER BY Customer.DisplayName;


-- Query Five: Uses nested queries with any of the set operations UNION, EXCEPT, or INTERSECT
-- Used to determine what users might be interested in a certain menu item.
-- Expects a list of Customers that have a max price > $5.00
SELECT  C.UserId
FROM Customer C INTERSECT (
SELECT C.UserId
FROM Customer C, Preferences P
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
-- Retrieve restaurants ordered by specified star type (cleanliness/food/service/value)
-- Returns all restaurants ranked from best to worst.
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