-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: epiceats
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menuid` int NOT NULL AUTO_INCREMENT,
  `restaurantid` int DEFAULT NULL,
  `itemname` varchar(100) NOT NULL,
  `description` text,
  `price` int NOT NULL,
  `isavailable` varchar(10) DEFAULT 'YES',
  `ratings` float DEFAULT NULL,
  `imagepath` text,
  PRIMARY KEY (`menuid`),
  KEY `restaurantid` (`restaurantid`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`restaurantid`) REFERENCES `restaurants` (`restaurantid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (6,1,'Andhra Meals','Full rice meal with dal, sambar, curry, curd, and papad.',80,'YES',4.6,'images/items/item1.1.jpg'),(7,1,'Pappu Annam','Steamed rice served with thick dal (pappu).',60,'YES',4.4,'images/items/item1.2.jpg'),(8,1,'Gutti Vankaya Curry','Spicy stuffed brinjal curry with Andhra masala.',90,'YES',4.5,'images/items/item1.3.jpg'),(9,1,'Perugu Annam','Curd rice seasoned with mustard, chili, and curry leaves.',50,'YES',4.3,'images/items/item1.4.jpg'),(10,1,'Gongura Mutton Curry','Sour gongura leaves cooked with tender mutton.',150,'YES',4.7,'images/items/item1.5.jpg'),(16,2,'Idly with Karam Podi','Steamed rice cakes served with spicy lentil powder and ghee.',30,'YES',4.5,'images/items/item2.1.jpg'),(17,2,'Pesarattu Upma','Crispy pesarattu filled with soft upma and chutney.',45,'YES',4.6,'images/items/item2.2.jpg'),(18,2,'Poori Curry','Fluffy pooris served with spicy potato curry.',40,'YES',4.4,'images/items/item2.3.jpg'),(19,2,'Ghee Karam Dosa','Dosa spread with ghee and spicy chutney.',50,'YES',4.7,'images/items/item2.4.jpg'),(20,2,'Uggani with Bajji','Light puffed rice dish served with mirchi bajji.',35,'YES',4.3,'images/items/item2.5.jpg');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `orderitemid` int NOT NULL AUTO_INCREMENT,
  `orderid` int DEFAULT NULL,
  `menuid` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `totalamount` int NOT NULL,
  PRIMARY KEY (`orderitemid`),
  KEY `orderid` (`orderid`),
  KEY `menuid` (`menuid`),
  CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`),
  CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`menuid`) REFERENCES `menu` (`menuid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
INSERT INTO `orderitems` VALUES (5,5,17,1,45),(6,5,18,1,40),(7,5,19,2,100),(8,6,16,1,30),(9,6,18,2,80),(10,7,16,1,30);
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderid` int NOT NULL AUTO_INCREMENT,
  `restaurantid` int DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `orderdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `totalamount` int DEFAULT NULL,
  `status` varchar(50) DEFAULT 'PENDING',
  `paymentmode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `restaurantid` (`restaurantid`),
  KEY `userid` (`userid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`restaurantid`) REFERENCES `restaurants` (`restaurantid`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,'2025-06-15 07:50:08',140,'Confirmed','Cash on Delivery'),(2,2,1,'2025-06-15 07:52:30',35,'Confirmed','GPay'),(3,1,1,'2025-06-15 07:55:34',210,'Confirmed','Card'),(4,1,1,'2025-06-15 07:56:01',90,'Confirmed','Card'),(5,2,1,'2025-06-15 17:38:38',185,'Confirmed','Card'),(6,2,1,'2025-06-15 17:46:08',110,'Confirmed','Card'),(7,2,3,'2025-06-15 17:51:01',30,'Confirmed','Card');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `restaurantid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` text,
  `phonenumber` varchar(15) DEFAULT NULL,
  `cusinetype` varchar(100) DEFAULT NULL,
  `deliverytime` varchar(50) DEFAULT NULL,
  `admineuserid` int DEFAULT NULL,
  `rating` varchar(10) DEFAULT NULL,
  `isactive` varchar(10) DEFAULT 'YES',
  `imagepath` text,
  `createddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `lastlogindate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`restaurantid`),
  KEY `admineuserid` (`admineuserid`),
  CONSTRAINT `restaurants_ibfk_1` FOREIGN KEY (`admineuserid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'Annapurna Mess','MG Road, Vijayawada','9876543210','South Indian','30 mins',NULL,'4.3','YES','images/rest1.jpg','2025-06-14 16:08:11',NULL),(2,'Sri Kakatiya Tiffins','Benz Circle, Vijayawada','9123456789','Tiffins','25 mins',NULL,'4.1','YES','images/rest2.jpg','2025-06-14 16:08:11',NULL),(3,'Ruchi Veg Restaurant','Guntur Road, Vijayawada','9988776655','Veg Meals','35 mins',NULL,'4.0','YES','images/rest3.jpg','2025-06-14 16:08:11',NULL),(4,'Rayalaseema Ruchulu','Governorpet, Vijayawada','9000000001','Rayalaseema','40 mins',NULL,'4.5','YES','images/rest4.jpg','2025-06-14 16:08:11',NULL),(5,'Tirupati Tiffins','RTC X Roads, Vijayawada','9807654321','Breakfast','20 mins',NULL,'4.2','YES','images/rest5.jpg','2025-06-14 16:08:11',NULL),(6,'Pizza House','Eluru Road, Vijayawada','9345678901','Italian, Pizza','30 mins',NULL,'4.4','YES','images/rest6.jpeg','2025-06-14 16:08:11',NULL),(9,'Burger King','One Town, Vijayawada','9321457689','Burgers, Fast Food','50 mins',NULL,'4.0','YES','images/rest9.jpg','2025-06-14 16:08:11',NULL),(13,'KFC','Auto Nagar, Vijayawada','9001234567','Fried Chicken','40 mins',NULL,'4.5','YES','images/rest13.jpg','2025-06-14 16:08:11',NULL),(15,'Aha Andhra','Patamata, Vijayawada','9311122233','Spicy Andhra','35 mins',NULL,'4.6','YES','images/rest15.jpg','2025-06-14 16:08:11',NULL),(16,'Nellore Ruchulu','Kandrika, Vijayawada','9888777666','Nellore Biryani','30 mins',NULL,'4.4','YES','images/rest16.jpg','2025-06-14 16:08:11',NULL),(17,'Subway','Krishna Lanka, Vijayawada','9786543210','Sandwiches, Salads','50 mins',NULL,'4.1','YES','images/resta17.jpg','2025-06-14 16:08:11',NULL),(18,'Godavari Flavors','Siddhartha College Road, Vijayawada','9090909090','Fish & Rice','40 mins',NULL,'4.3','YES','images/rest18.jpg','2025-06-14 16:08:11',NULL),(19,'CreamStone','Bhavanipuram, Vijayawada','9340011223','Ice Creams, Desserts','25 mins',NULL,'4.0','YES','images/rest19.jpg','2025-06-14 16:08:11',NULL),(20,'Andhra Bhojanam Vantillu','Ajit Singh Nagar, Vijayawada','9345543210','Andhra Home Food','45 mins',NULL,'4.4','YES','images/rest20.jpg','2025-06-14 16:08:11',NULL);
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phonenumber` varchar(15) DEFAULT NULL,
  `address` text,
  `role` varchar(50) DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `lastlogindate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'G Siva Shankar Reddy','shiva','Sivash@6303','shivashnkrrdd@gmail.com','6303207573','20th Main Road,BTM 1st stage,Bengaluru','Customer','2025-06-15 05:24:59','2025-06-15 05:24:59'),(3,'K Vikram Kumar','vikram','vikram123','vikram@gmail.com','9652205608','BTM,20th road,Bang','Customer','2025-06-15 17:49:54','2025-06-15 17:49:54');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-16 12:31:44
