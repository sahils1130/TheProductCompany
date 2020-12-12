-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: lostaggregated
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
-- Table structure for table `customer_dim`
--

DROP TABLE IF EXISTS `customer_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_dim` (
  `Customer_SK` int NOT NULL AUTO_INCREMENT,
  `CustomerID_NK` int DEFAULT NULL,
  `Customer_Name` varchar(45) DEFAULT NULL,
  `Customer_dept` varchar(45) DEFAULT NULL,
  `Customer_suite` varchar(45) DEFAULT NULL,
  `Customer_address` varchar(45) DEFAULT NULL,
  `Customer_city` varchar(45) DEFAULT NULL,
  `Customer_state` varchar(45) DEFAULT NULL,
  `Customer_zip` int DEFAULT NULL,
  `Customer_custTypeID` varchar(45) DEFAULT NULL,
  `Customer_custTypeName` varchar(45) DEFAULT NULL,
  `Customer_division` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Customer_SK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_dim`
--

LOCK TABLES `customer_dim` WRITE;
/*!40000 ALTER TABLE `customer_dim` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_dim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_dim`
--

DROP TABLE IF EXISTS `product_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_dim` (
  `Product_SK` int NOT NULL AUTO_INCREMENT,
  `ProductID_NK` int DEFAULT NULL,
  `Product_Name` varchar(45) DEFAULT NULL,
  `Price1` decimal(10,2) DEFAULT NULL,
  `Price2` decimal(10,2) DEFAULT NULL,
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
  `Division` varchar(45) DEFAULT NULL,
  `UnitCost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Product_SK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_dim`
--

LOCK TABLES `product_dim` WRITE;
/*!40000 ALTER TABLE `product_dim` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_dim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_fact_lost`
--

DROP TABLE IF EXISTS `sales_fact_lost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_fact_lost` (
  `Customer_SK` int NOT NULL,
  `Product_SK` int NOT NULL,
  `Ship_Cost` decimal(10,2) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`Customer_SK`,`Product_SK`),
  KEY `fk2_idx` (`Product_SK`),
  CONSTRAINT `fk1` FOREIGN KEY (`Customer_SK`) REFERENCES `customer_dim` (`Customer_SK`),
  CONSTRAINT `fk2` FOREIGN KEY (`Product_SK`) REFERENCES `product_dim` (`Product_SK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_fact_lost`
--

LOCK TABLES `sales_fact_lost` WRITE;
/*!40000 ALTER TABLE `sales_fact_lost` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_fact_lost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'lostaggregated'
--

--
-- Dumping routines for database 'lostaggregated'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-29 16:28:45
