-- Task 1
DELIMITER //

CREATE PROCEDURE MakeBooking(booking_id INT, booking_date DATE, table_no INT, customer_id INT)
BEGIN
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID) VALUES
(booking_id, booking_date, table_no, customer_id);
SELECT "New booking added" AS Confirmation;
END//

DELIMITER ;

CALL MakeBooking(1, "2022-10-10", 5, 1);
CALL MakeBooking(2, "2022-11-12", 3, 3);
CALL MakeBooking(3, "2022-10-11", 2, 2);
CALL MakeBooking(4, "2022-10-13", 2, 1);

-- Task 2
DELIMITER //

CREATE PROCEDURE CheckBooking(booking_date DATE, table_no INT)
BEGIN
DECLARE bookedTable INT DEFAULT 0;
SELECT COUNT(bookedTable) INTO bookedTable FROM Bookings WHERE BookingDate = booking_date AND TableNumber = table_no;
IF bookedTable > 0 THEN
	SELECT CONCAT("Table ", table_no, " is already booked") AS "Booking status";
ELSE
	SELECT CONCAT("Table ", table_no, " is not booked") AS "Booking status";
END IF;
END//

DELIMITER ;

-- Task 3
DELIMITER //

CREATE PROCEDURE AddValidBooking(booking_date DATE, table_no INT, customer_id INT)
BEGIN
DECLARE bookedTable INT DEFAULT 0;
START TRANSACTION;
SELECT COUNT(bookedTable) INTO bookedTable FROM Bookings WHERE BookingDate = booking_date AND TableNumber = table_no;
INSERT INTO Bookings (TableNumber, BookingDate, CustomerID) VALUES (table_no, booking_date, customer_id);
IF bookedTable > 0 THEN
	SELECT CONCAT("Table ", table_no, " is already booked - booking cancelled") AS "Booking status";
    ROLLBACK;
ELSE
	SELECT CONCAT("Table ", table_no, " is booked") AS "Booking status";
    COMMIT;
END IF;
END//

DELIMITER ;

