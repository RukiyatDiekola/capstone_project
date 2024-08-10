-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `BookingDate` date NOT NULL,
  `TableNumber` int NOT NULL,
  `CustomerID` int NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `customersid_fk_idx` (`CustomerID`),
  CONSTRAINT `customersid_fk` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'2022-12-23',23,1),(2,'2022-10-20',13,2),(3,'2022-09-12',20,3),(4,'2022-08-03',11,4),(5,'2022-08-04',2,5);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `EmailAddress` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(45) NOT NULL,
  `Address` varchar(255) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Vanessa','McCarthy','vm@mangatagallo.com','757536378','L222'),(2,'Marcos','Romero','mr@mangatagallo.com','757536379','L223'),(3,'Hiroki','Yamane','hy@mangatagallo.com','757536376','L224'),(4,'Anna','Iversen','ai@mangatagallo.com','757536375','L225'),(5,'Diana','Pinto','dp@mangatagallo.com','757536374','L226');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

--
-- Table structure for table `deliverystatus`
--

DROP TABLE IF EXISTS `deliverystatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverystatus` (
  `DeliverStatusID` int NOT NULL,
  `Status` varchar(45) NOT NULL,
  `DeliveryDate` date NOT NULL,
  `OrderID` int NOT NULL,
  PRIMARY KEY (`DeliverStatusID`),
  KEY `orderid_fk_idx` (`OrderID`),
  CONSTRAINT `orderid_fk` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverystatus`
--

/*!40000 ALTER TABLE `deliverystatus` DISABLE KEYS */;
INSERT INTO `deliverystatus` VALUES (1,'Done','2022-10-17',1),(2,'Done','2022-10-20',2),(3,'Done','2022-10-22',3),(4,'Done','2022-10-25',4);
/*!40000 ALTER TABLE `deliverystatus` ENABLE KEYS */;

--
-- Table structure for table `menuitem`
--

DROP TABLE IF EXISTS `menuitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuitem` (
  `MenuItemID` int NOT NULL AUTO_INCREMENT,
  `itemName` varchar(255) NOT NULL,
  `Category` varchar(255) NOT NULL,
  `Price` varchar(45) NOT NULL,
  PRIMARY KEY (`MenuItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitem`
--

/*!40000 ALTER TABLE `menuitem` DISABLE KEYS */;
INSERT INTO `menuitem` VALUES (1,'Marshed Potatoes','Main course','280'),(2,'Ice cream','Dessert','120'),(3,'Chapman','Drinks','150');
/*!40000 ALTER TABLE `menuitem` ENABLE KEYS */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `OrderDate` date NOT NULL,
  `Quantity` int NOT NULL,
  `TotalCost` decimal(10,2) NOT NULL,
  `OrderTime` time NOT NULL,
  `CustomerID` int NOT NULL,
  `MenuItemID` int NOT NULL,
  `BookingID` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `customerid_fk_idx` (`CustomerID`),
  KEY `menuitem_fk_idx` (`MenuItemID`),
  KEY `fk_booking` (`BookingID`),
  CONSTRAINT `customerid_fk` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_booking` FOREIGN KEY (`BookingID`) REFERENCES `bookings` (`BookingID`),
  CONSTRAINT `menuitem_fk` FOREIGN KEY (`MenuItemID`) REFERENCES `menuitem` (`MenuItemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2022-10-15',6,2500.00,'12:00:00',1,1,1),(2,'2022-10-16',5,800.00,'13:00:00',2,2,2),(3,'2022-10-17',4,800.00,'15:00:00',5,1,3),(4,'2022-10-17',7,1050.00,'14:00:00',3,2,4);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

--
-- Temporary view structure for view `ordersview`
--

DROP TABLE IF EXISTS `ordersview`;
/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordersview` AS SELECT 
 1 AS `OrderID`,
 1 AS `Quantity`,
 1 AS `TotalCost`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffID` int NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Role` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `PhoneNumber` varchar(45) NOT NULL,
  `Salary` varchar(45) NOT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;

--
-- Dumping routines for database 'littlelemondb'
--
/*!50003 DROP PROCEDURE IF EXISTS `CancelOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Rukiyat`@`%` PROCEDURE `CancelOrder`(IN order_id INT)
BEGIN
    DELETE FROM Orders
    WHERE OrderID = order_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMaxQuantity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Rukiyat`@`%` PROCEDURE `GetMaxQuantity`()
BEGIN
    SELECT MAX(Quantity) AS MaxQuantity
    FROM Orders;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `ordersview`
--

/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ordersview` AS select `orders`.`OrderID` AS `OrderID`,`orders`.`Quantity` AS `Quantity`,`orders`.`TotalCost` AS `TotalCost` from `orders` where (`orders`.`Quantity` > 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-09 13:23:26
SELECT * FROM Customers;
select * from bookings;

DROP PROCEDURE IF EXISTS CheckBooking;


DELIMITER $$

CREATE PROCEDURE CheckBooking(
    IN p_BookingDate DATE,
    IN p_TableNumber INT
)
BEGIN
    -- Declare a variable to hold the count of bookings
    DECLARE v_BookingCount INT;
    
    -- Initialize the variable with the count of bookings for the given table and date
    SELECT COUNT(*) INTO v_BookingCount
    FROM Booking
    WHERE BookingDate = p_BookingDate AND TableNumber = p_TableNumber;
    
    -- Check if the table is booked
    IF v_BookingCount > 0 THEN
        -- Table is booked
        SELECT CONCAT('Table ', p_TableNumber, ' is already booked') AS BookingStatus;
    ELSE
        -- Table is not booked
        SELECT CONCAT('Table ', p_TableNumber, ' is available') AS BookingStatus;
    END IF;
END $$

DELIMITER ;

SELECT * FROM BOOKINGS;
CALL CheckBooking('2022-10-20', 13);
SHOW PROCEDURE STATUS WHERE Db = 'littlelemondb';
SHOW PROCEDURE STATUS LIKE 'CheckBooking';
DROP PROCEDURE IF EXISTS CheckBooking;
DELIMITER $$

CREATE PROCEDURE CheckBooking(
    IN p_BookingDate DATE,
    IN p_TableNumber INT
)
BEGIN
    DECLARE v_BookingCount INT;

    SELECT COUNT(*) INTO v_BookingCount
    FROM bookings
    WHERE BookingDate = p_BookingDate AND TableNumber = p_TableNumber;

    IF v_BookingCount > 0 THEN
        SELECT CONCAT('Table ', p_TableNumber, ' is already booked') AS BookingStatus;
    ELSE
        SELECT CONCAT('Table ', p_TableNumber, ' is available') AS BookingStatus;
    END IF;
END $$

DELIMITER ;
CALL CheckBooking ('2022-10-20', 13);

SHOW GRANTS FOR CURRENT_USER;
SELECT ROUTINE_NAME
FROM information_schema.ROUTINES
WHERE ROUTINE_SCHEMA = 'littlelemondb'
  AND ROUTINE_NAME = 'CheckBooking';

  SHOW TABLES IN littlelemondb

describe bookings

commit;
DELIMITER $$

CREATE PROCEDURE AddValidBooking(
    IN p_BookingDate DATE,
    IN p_TableNumber INT,
    IN p_CustomerID INT
)
BEGIN
    -- Declare a variable to hold the count of bookings
    DECLARE v_BookingCount INT;

    -- Start the transaction
    START TRANSACTION;

    -- Check if the table is already booked on the given date
    SELECT COUNT(*) INTO v_BookingCount
    FROM bookings
    WHERE BookingDate = p_BookingDate AND TableNumber = p_TableNumber;

    -- If the table is already booked, rollback the transaction
    IF v_BookingCount > 0 THEN
        ROLLBACK;
        SELECT 'Table is already booked. Reservation declined.' AS BookingStatus;
    ELSE
        -- Otherwise, add the new booking record
        INSERT INTO bookings (BookingDate, TableNumber, CustomerID)
        VALUES (p_BookingDate, p_TableNumber, p_CustomerID);

        -- Commit the transaction
        COMMIT;
        SELECT 'Booking successfully added.' AS BookingStatus;
    END IF;
END $$

DELIMITER ;

CALL AddValidBooking('2022-10-20', 13, 3);
CALL AddValidBooking('2023-11-03', 04, 4);
commit;
select * from bookings;
DESCRIBE BOOKINGS;

DELIMITER $$

CREATE PROCEDURE AddBooking(
    IN p_BookingID INT,
    IN p_BookingDate DATE,
    IN p_TableNumber INT,
    IN p_CustomerID INT
)
BEGIN
    -- Insert a new booking record into the Booking table
    INSERT INTO bookings (BookingID, BookingDate, TableNumber, CustomerID)
    VALUES (p_BookingID, p_BookingDate, p_TableNumber, p_CustomerID);
    -- Return a success message
    SELECT 'New Booking Added' AS Message;
END $$

DELIMITER ;
CALL AddBooking(9, '2023-06-10', 5, 4);
DROP Procedure `AddBooking`

DELIMITER $$

CREATE PROCEDURE UpdateBooking(
    IN p_BookingID INT,
    IN p_BookingDate DATE
)
BEGIN
    -- Update the booking date for the specified BookingID
    UPDATE bookings
    SET BookingDate = p_BookingDate
    WHERE BookingID = p_BookingID;

    -- Return a success message
    SELECT 'Booking Updated' AS Message;
END $$

DELIMITER ;

CALL UpdateBooking(9, '2023-06-10');

DELIMITER $$

CREATE PROCEDURE CancelBooking(
    IN p_BookingID INT
)
BEGIN
    -- Delete the booking record with the specified BookingID
    DELETE FROM bookings
    WHERE BookingID = p_BookingID;

    -- Return a message indicating that the booking was cancelled
    SELECT CONCAT('Booking ', p_BookingID, ' cancelled') AS Message;
END $$

DELIMITER ;

CALL CancelBooking(8);
commit;

