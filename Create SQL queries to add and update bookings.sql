-- Task 1
DELIMITER //

CREATE PROCEDURE AddBooking(booking_id INT, table_no INT, booking_date DATE, customer_id INT)
BEGIN
	INSERT INTO Bookings(BookingID, TableNumber, BookingDate, CustomerID) VALUES (booking_id, table_no, booking_date, customer_id);
    SELECT "New booking added" AS Confirmation;
END//

DELIMITER ;

-- Task 2
DELIMITER //

CREATE PROCEDURE UpdateBooking(booking_id INT, booking_date DATE)
BEGIN
	UPDATE Bookings SET BookingDate = booking_date WHERE BookingID = booking_id;
    SELECT CONCAT("Booking ", booking_id, " updated") AS Confirmation;
END//

DELIMITER ;

-- Task 3
DELIMITER //

CREATE PROCEDURE CancelBooking(booking_id INT)
BEGIN
	DELETE FROM Bookings WHERE BookingID = booking_id;
    SELECT CONCAT("Booking ", booking_id, " cancelled") as Confirmation;
END//

DELIMITER ;