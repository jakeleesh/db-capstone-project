-- Task 1
CREATE PROCEDURE GetMaxQuantity()
SELECT MAX(Quantity) AS "Max Quantity in Order" FROM Orders;

CALL GetMaxQuantity();

-- Task 2
PREPARE GetOrderDetail
FROM 'SELECT OrderID, Quantity, Cost FROM Orders Where OrderID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

-- Task 3
DELIMITER //

CREATE PROCEDURE CancelOrder(id INT)
BEGIN
SELECT CONCAT("Order ", id, " is cancelled") AS Confirmation FROM Bookings;
DELETE FROM Bookings WHERE BookingID = id;
END//

DELIMITER ;

CALL CancelBooking(5);