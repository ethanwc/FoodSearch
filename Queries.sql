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