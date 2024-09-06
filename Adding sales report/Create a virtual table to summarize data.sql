-- Task 1
CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, Cost
FROM Orders
WHERE Quantity > 2;

-- Task 2
SELECT c.CustomerID, c.FullName, o.OrderID, o.Cost, m.MenuName, mi.CourseName, mi.StarterName
FROM Customers AS c INNER JOIN Orders AS o
ON c.CustomerID = o.CustomerID
INNER JOIN Menus AS m
ON o.MenuID = m.MenuID
INNER JOIN MenuItems AS mi
ON m.MenuItemsID = mi.MenuItemsID
WHERE o.Cost > 150
ORDER BY o.Cost;

-- Task 3
SELECT MenuName
FROM Menus
WHERE MenuID= ANY(
	SELECT MenuID
    FROM Orders
    WHERE Quantity > 2
);
