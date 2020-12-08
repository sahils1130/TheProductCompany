CREATE DATABASE  IF NOT EXISTS `salesorder_5_2201` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `salesorder_5_2201`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: salesorder_5_2201
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Customer_SK` int NOT NULL AUTO_INCREMENT,
  `CustomerID_NK` int DEFAULT NULL,
  `Customer_Name` varchar(45) DEFAULT NULL,
  `Customer_dept` varchar(45) DEFAULT NULL,
  `Customer_suite` varchar(45) DEFAULT NULL,
  `Customer_address` varchar(45) DEFAULT NULL,
  `Customer_city` varchar(45) DEFAULT NULL,
  `Customer_state` varchar(45) DEFAULT NULL,
  `Cutomer_zip` int DEFAULT NULL,
  `Customer_custtypeID` varchar(45) DEFAULT NULL,
  `Customer_custtypeName` varchar(45) DEFAULT NULL,
  `Customer_division` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Customer_SK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `junk`
--

DROP TABLE IF EXISTS `junk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `junk` (
  `Junk_SK` int NOT NULL AUTO_INCREMENT,
  `Ship_Method` varchar(45) DEFAULT NULL,
  `Payment_Method` varchar(45) DEFAULT NULL,
  `Order_Method` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Junk_SK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `junk`
--

LOCK TABLES `junk` WRITE;
/*!40000 ALTER TABLE `junk` DISABLE KEYS */;
/*!40000 ALTER TABLE `junk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_date`
--

DROP TABLE IF EXISTS `order_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_date` (
  `Order_Date_SK` int NOT NULL AUTO_INCREMENT,
  `Order_Date` date DEFAULT NULL,
  `Order_Year` int DEFAULT NULL,
  `Order_Quarter` int DEFAULT NULL,
  `Order_Month` int DEFAULT NULL,
  `Order_Week` int DEFAULT NULL,
  `Order_Fiscal_Year` int DEFAULT NULL,
  `Order_Fiscal_Quarter` int DEFAULT NULL,
  `Order_Fiscal_Month` int DEFAULT NULL,
  `Order_Fiscal_Week` int DEFAULT NULL,
  PRIMARY KEY (`Order_Date_SK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_date`
--

LOCK TABLES `order_date` WRITE;
/*!40000 ALTER TABLE `order_date` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Product_SK` int NOT NULL AUTO_INCREMENT,
  `ProductID_NK` int DEFAULT NULL,
  `Product_Name` varchar(45) DEFAULT NULL,
  `price1` decimal(10,2) DEFAULT NULL,
  `price2` decimal(10,2) DEFAULT NULL,
  `UnitCost` decimal(10,2) DEFAULT NULL,
  `Supplier_Name` varchar(45) DEFAULT NULL,
  `Supplier_Address` varchar(45) DEFAULT NULL,
  `Supplier_Attn` varchar(45) DEFAULT NULL,
  `Supplier_City` varchar(45) DEFAULT NULL,
  `Supplier_State` varchar(45) DEFAULT NULL,
  `Supplier_Zip` int DEFAULT NULL,
  `ProductTypeID` varchar(45) DEFAULT NULL,
  `TypeDescription` varchar(45) DEFAULT NULL,
  `BUID` varchar(45) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Abbreviation` varchar(45) DEFAULT NULL,
  `division` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Product_SK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_date`
--

DROP TABLE IF EXISTS `sales_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_date` (
  `Sales_Date_SK` int NOT NULL AUTO_INCREMENT,
  `Sales_Date` date DEFAULT NULL,
  `Sales_Year` int DEFAULT NULL,
  `Sales_Quarter` int DEFAULT NULL,
  `Sales_Month` int DEFAULT NULL,
  `Sales_Week` int DEFAULT NULL,
  `Sales_Fiscal_Year` int DEFAULT NULL,
  `Sales_Fiscal_Quarter` int DEFAULT NULL,
  `Sales_Fiscal_Month` int DEFAULT NULL,
  `Sales_Fiscal_Week` int DEFAULT NULL,
  PRIMARY KEY (`Sales_Date_SK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_date`
--

LOCK TABLES `sales_date` WRITE;
/*!40000 ALTER TABLE `sales_date` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_fact`
--

DROP TABLE IF EXISTS `sales_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_fact` (
  `Customer_SK` int NOT NULL,
  `Product_SK` int NOT NULL,
  `Order_Date_SK` int NOT NULL,
  `Sales_Date` int NOT NULL,
  `Junk_SK` int NOT NULL,
  `InvoiceID (DD)` int DEFAULT NULL,
  `Discounted` int DEFAULT NULL,
  `Ship_Cost` decimal(10,2) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`Customer_SK`,`Product_SK`,`Order_Date_SK`,`Sales_Date`,`Junk_SK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_fact`
--

LOCK TABLES `sales_fact` WRITE;
/*!40000 ALTER TABLE `sales_fact` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'salesorder_5_2201'
--

--
-- Dumping routines for database 'salesorder_5_2201'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-12 21:32:04
