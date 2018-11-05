-- Query One: Computes a join of at least three tables
-- Not sure what to do here.


-- Query Two: Uses nested queries with the ANY or ALL operator and uses a GROUP BY clause
-- Retrieve all Restaurants that have allergens. 
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
-- Retrieve all Menu Item's that are at a specified restaurant less than or equal to specified price.
SELECT Mi.ItemName, Mi.Price
FROM MenuItem Mi, Menu Mu, Restaurant R
WHERE Mi.MenuId = (
		SELECT Mu.MenuId
		FROM Mu
		WHERE Mu.RestId = (
			SELECT R.RestId
			FROM R
			WHERE R.RestName = 'Pizza Hut' ));


-- Query Four: Uses a FULL JOIN
-- Combine all Customer Names and Reviews
SELECT Customer.DisplayName, Reviews.CleanlinessNote, Reviews.FoodNote, Reviews.ServiceNote, Reviews.ValueNote
FROM Customer
FULL OUTER JOIN Reviews ON Customer.UserId = Reviews.Username
ORDER BY Customer.DispalyName;


-- Query Five: Uses nested queries with any of the set operations UNION, EXCEPT, or INTERSECT
-- Display all customers except those who a max price less than $5.
SELECT * FROM (
	SELECT Customer C, Preferences P 
	FROM C
	EXCEPT
	SELECT C.UserId 
	FROM C
	WHERE P.maxPrice < 5.00);


-- Query Six: Retrieve all Customers that prefer n "Italian" (int) type cuisine.
SELECT DisplayName
FROM Customer
WHERE UserId = (
	SELECT UserId
	FROM Preferences
	WHERE CuisineId = 4);

-- Query Seven: Retrieve all reviews that are 4 or 5 star about specific type (cleanliness/food/service/value)
SELECT Username, ValueR, ValueNote, FoodR, FoodNote
FROM Reviews
WHERE ValueR >= 4 AND FoodR >= 4
ORDER BY ValueR DESC;

-- Query Eight: Compute the Average review of a restaurant given id.
SELECT R.RestName, (Re.CleanlinessR + Re.FoodR + Re.ServiceR + Re.ValueR)/4 as Total
FROM Restaurant R, Reviews Re
WHERE R.RestId = '1';


-- Query Nine: Retrieve restaurants ordered by specified star type (cleanliness/food/service/value)
SELECT R.RestName, (Re.CleanlinessR + Re.FoodR + Re.ServiceR + Re.ValueR)/4 as Total
FROM Restaurant R, Reviews Re
WHERE R.RestId = Reviews.RestId
ORDER BY Total DESC;

-- Query Ten: Search Database for specific food item
SELECT Mi.ItemName
FROM MenuItem Mi
WHERE Mi.ItemName LIKE 'Tacos%';
