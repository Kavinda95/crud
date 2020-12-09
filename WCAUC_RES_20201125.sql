-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: db_wcauction1
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `tbl_attributes`
--

DROP TABLE IF EXISTS `tbl_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_attributes` (
  `tbl_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_attributes_type` int(11) NOT NULL,
  `tbl_attributes_key` varchar(45) NOT NULL,
  `tbl_attributes_value` varchar(45) NOT NULL,
  `fk_sub_cat_id` int(11) NOT NULL,
  `fk_main_attr_id` int(11) NOT NULL,
  PRIMARY KEY (`tbl_attributes_id`),
  KEY `fk_tbl_sub_category_id_idx` (`fk_sub_cat_id`),
  KEY `fk_tbl_main_attributes_id_idx` (`fk_main_attr_id`),
  CONSTRAINT `fk_tbl_tbl_attributes_main_attributes_id` FOREIGN KEY (`fk_main_attr_id`) REFERENCES `tbl_main_attributes` (`tbl_main_attributes_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_tbl_attributes_sub_category_id` FOREIGN KEY (`fk_sub_cat_id`) REFERENCES `tbl_sub_category` (`tbl_sub_category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_attributes`
--

LOCK TABLES `tbl_attributes` WRITE;
/*!40000 ALTER TABLE `tbl_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_auction`
--

DROP TABLE IF EXISTS `tbl_auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_auction` (
  `tbl_auction_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_auction_created_date` datetime NOT NULL,
  `tbl_action_updated_date` datetime DEFAULT NULL,
  `tbl_auction_start_date` datetime DEFAULT NULL,
  `tbl_auction_end_date` datetime DEFAULT NULL,
  `tbl_auction_status` int(11) NOT NULL,
  `fk_product_id` int(11) NOT NULL,
  PRIMARY KEY (`tbl_auction_id`),
  KEY `fk_tbl_auction_tbl_product1_idx` (`fk_product_id`),
  CONSTRAINT `fk_tbl_tbl_auction_product_id` FOREIGN KEY (`fk_product_id`) REFERENCES `tbl_product` (`tbl_product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_auction`
--

LOCK TABLES `tbl_auction` WRITE;
/*!40000 ALTER TABLE `tbl_auction` DISABLE KEYS */;
INSERT INTO `tbl_auction` VALUES (1,'2020-01-19 03:14:07',NULL,'2020-01-19 03:14:07','2021-02-19 03:14:07',3,4);
/*!40000 ALTER TABLE `tbl_auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_base_category`
--

DROP TABLE IF EXISTS `tbl_base_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_base_category` (
  `tbl_base_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_base_category_name` varchar(45) NOT NULL,
  `tbl_base_category_thumb_img` varchar(300) NOT NULL,
  `fk_store_id` int(11) NOT NULL,
  PRIMARY KEY (`tbl_base_category_id`),
  KEY `fk_tbl_store_id_idx` (`fk_store_id`),
  CONSTRAINT `fk_tbl_base_category_store_id` FOREIGN KEY (`fk_store_id`) REFERENCES `tbl_store` (`tbl_store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_base_category`
--

LOCK TABLES `tbl_base_category` WRITE;
/*!40000 ALTER TABLE `tbl_base_category` DISABLE KEYS */;
INSERT INTO `tbl_base_category` VALUES (1,'Smartphones','https://www.ideabeam.com/images/product/big/samsung-galaxy-a50s.jpg',1),(2,'Wagons','https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.roadandtrack.com%2Fnew-cars%2Fa25806338%2F2018-wagon-market-share-falling%2F&psig=AOvVaw2zRsfLVxdrTYbvcYqMB9RC&ust=1601974492409000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLDs8ZiKnewCFQAAAAAdAAAAABAD',2),(3,'Suv','https://cdn.motor1.com/images/mgl/b263w/s3/future-suvs-lead.jpg',2);
/*!40000 ALTER TABLE `tbl_base_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bid`
--

DROP TABLE IF EXISTS `tbl_bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bid` (
  `user_id` int(11) NOT NULL,
  `auction_id` int(11) NOT NULL,
  `tbl_bid_amount` double NOT NULL,
  `tbl_bid_maxbid` varchar(45) DEFAULT NULL,
  `tbl_bid_type` int(11) NOT NULL,
  `tbl_bid_status` int(11) NOT NULL,
  `tbl_bid_time` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`auction_id`),
  KEY `fk_tbl_user_has_tbl_auction_tbl_auction1_idx` (`auction_id`),
  KEY `fk_tbl_user_has_tbl_auction_tbl_user1_idx` (`user_id`),
  CONSTRAINT `fk_tbl_bid_auction_id` FOREIGN KEY (`auction_id`) REFERENCES `tbl_auction` (`tbl_auction_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_bid_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`tbl_user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bid`
--

LOCK TABLES `tbl_bid` WRITE;
/*!40000 ALTER TABLE `tbl_bid` DISABLE KEYS */;
INSERT INTO `tbl_bid` VALUES (37,1,154.32,NULL,0,0,'2020-11-24 10:31:50'),(38,1,153.32,NULL,0,0,'2020-11-24 10:30:59');
/*!40000 ALTER TABLE `tbl_bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_buy_auction`
--

DROP TABLE IF EXISTS `tbl_buy_auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_buy_auction` (
  `tbl_buy_auction_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_buy_auction_datetime` datetime NOT NULL,
  `tbl_buy_auction_status` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL,
  `fk_auction_id` int(11) NOT NULL,
  PRIMARY KEY (`tbl_buy_auction_id`),
  KEY `fk_tbl_buy_auction_tbl_bid1_idx` (`fk_user_id`,`fk_auction_id`),
  KEY `fk_tbl_buy_auction_tbl_auction_id` (`fk_auction_id`),
  CONSTRAINT `fk_tbl_buy_auction_tbl_auction_id` FOREIGN KEY (`fk_auction_id`) REFERENCES `tbl_auction` (`tbl_auction_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_buy_auction_tbl_bid1` FOREIGN KEY (`fk_user_id`, `fk_auction_id`) REFERENCES `tbl_bid` (`user_id`, `auction_id`),
  CONSTRAINT `fk_tbl_buy_auction_tbl_user_id` FOREIGN KEY (`fk_user_id`) REFERENCES `tbl_user` (`tbl_user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_buy_auction`
--

LOCK TABLES `tbl_buy_auction` WRITE;
/*!40000 ALTER TABLE `tbl_buy_auction` DISABLE KEYS */;
INSERT INTO `tbl_buy_auction` VALUES (64,'2020-11-17 11:32:59',1,37,1);
/*!40000 ALTER TABLE `tbl_buy_auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_company`
--

DROP TABLE IF EXISTS `tbl_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_company` (
  `tbl_company_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_company_name` varchar(45) NOT NULL,
  `tbl_company_contact` varchar(45) NOT NULL,
  `tbl_company_email` varchar(45) NOT NULL,
  `tbl_company_zip` int(11) NOT NULL,
  `tbl_company_address` varchar(100) NOT NULL,
  PRIMARY KEY (`tbl_company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_company`
--

LOCK TABLES `tbl_company` WRITE;
/*!40000 ALTER TABLE `tbl_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_company_has_user`
--

DROP TABLE IF EXISTS `tbl_company_has_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_company_has_user` (
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`company_id`,`user_id`),
  KEY `fk_tbl_company_has_tbl_user_tbl_user1_idx` (`user_id`),
  KEY `fk_tbl_company_has_tbl_user_tbl_company1_idx` (`company_id`),
  CONSTRAINT `fk_tbl_company_has_tbl_user_tbl_company_id` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`tbl_company_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_company_has_tbl_user_tbl_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`tbl_user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_company_has_user`
--

LOCK TABLES `tbl_company_has_user` WRITE;
/*!40000 ALTER TABLE `tbl_company_has_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_company_has_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_content`
--

DROP TABLE IF EXISTS `tbl_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_content` (
  `tbl_content_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_content_type` int(11) DEFAULT NULL,
  `tbl_content_title` varchar(45) DEFAULT NULL,
  `tbl_content_desc` varchar(1000) DEFAULT NULL,
  `fk_page_id` int(11) NOT NULL,
  PRIMARY KEY (`tbl_content_id`),
  KEY `fk_tbl_content_tbl_page1_idx` (`fk_page_id`),
  CONSTRAINT `fk_tbl_content_page_id` FOREIGN KEY (`fk_page_id`) REFERENCES `tbl_page` (`tbl_page_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_content`
--

LOCK TABLES `tbl_content` WRITE;
/*!40000 ALTER TABLE `tbl_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_current_cart`
--

DROP TABLE IF EXISTS `tbl_current_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_current_cart` (
  `tbl_current_cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_current_cart_status` int(11) NOT NULL,
  `fk_user_address_id` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL,
  PRIMARY KEY (`tbl_current_cart_id`),
  KEY `fk_tbl_current_cart_tbl_user_address1_idx` (`fk_user_address_id`),
  KEY `fk_tbl_current_cart_tbl_user1_idx` (`fk_user_id`),
  CONSTRAINT `fk_tbl_current_cart_tbl_user_address_id` FOREIGN KEY (`fk_user_address_id`) REFERENCES `tbl_user_address` (`tbl_user_address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_current_cart_tbl_user_id` FOREIGN KEY (`fk_user_id`) REFERENCES `tbl_user` (`tbl_user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_current_cart`
--

LOCK TABLES `tbl_current_cart` WRITE;
/*!40000 ALTER TABLE `tbl_current_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_current_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_current_cart_has_product`
--

DROP TABLE IF EXISTS `tbl_current_cart_has_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_current_cart_has_product` (
  `current_cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `tbl_current_cart_has_product_qty` int(11) NOT NULL,
  PRIMARY KEY (`current_cart_id`,`product_id`),
  KEY `fk_tbl_current_cart_has_tbl_product_tbl_product1_idx` (`product_id`),
  KEY `fk_tbl_current_cart_has_tbl_product_tbl_current_cart1_idx` (`current_cart_id`),
  CONSTRAINT `fk_tbl_current_cart_has_tbl_product_tbl_current_cart1` FOREIGN KEY (`current_cart_id`) REFERENCES `tbl_current_cart` (`tbl_current_cart_id`),
  CONSTRAINT `fk_tbl_current_cart_has_tbl_product_tbl_product1` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`tbl_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_current_cart_has_product`
--

LOCK TABLES `tbl_current_cart_has_product` WRITE;
/*!40000 ALTER TABLE `tbl_current_cart_has_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_current_cart_has_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_discount`
--

DROP TABLE IF EXISTS `tbl_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_discount` (
  `tbl_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_discount_type` int(11) NOT NULL,
  `tbl_discount_amount` varchar(45) NOT NULL,
  `tbl_discount_startdate` datetime NOT NULL,
  `tbl_discount_enddate` datetime NOT NULL,
  `fk_sub_category_id` int(11) NOT NULL,
  PRIMARY KEY (`tbl_discount_id`),
  KEY `fk_tbl_discount_tbl_sub_category1_idx` (`fk_sub_category_id`),
  CONSTRAINT `fk_tbl_discount_tbl_sub_category_id` FOREIGN KEY (`fk_sub_category_id`) REFERENCES `tbl_sub_category` (`tbl_sub_category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_discount`
--

LOCK TABLES `tbl_discount` WRITE;
/*!40000 ALTER TABLE `tbl_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_main_attributes`
--

DROP TABLE IF EXISTS `tbl_main_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_main_attributes` (
  `tbl_main_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_main_attributes_type` int(11) NOT NULL,
  `fk_base_cat_id` int(11) NOT NULL,
  PRIMARY KEY (`tbl_main_attributes_id`),
  KEY `fk_tbl_base_category_id_idx` (`fk_base_cat_id`),
  CONSTRAINT `fk_tbl_main_attributes_base_category_id` FOREIGN KEY (`fk_base_cat_id`) REFERENCES `tbl_base_category` (`tbl_base_category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_main_attributes`
--

LOCK TABLES `tbl_main_attributes` WRITE;
/*!40000 ALTER TABLE `tbl_main_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_main_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_page`
--

DROP TABLE IF EXISTS `tbl_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_page` (
  `tbl_page_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_page_name` varchar(45) NOT NULL,
  `tbl_page_title` varchar(45) NOT NULL,
  `tbl_page_url` varchar(400) DEFAULT NULL,
  `fk_store_id` int(11) NOT NULL,
  PRIMARY KEY (`tbl_page_id`),
  KEY `fk_tbl_page_tbl_store_idx` (`fk_store_id`),
  CONSTRAINT `fk_tbl_page_store_id` FOREIGN KEY (`fk_store_id`) REFERENCES `tbl_store` (`tbl_store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_page`
--

LOCK TABLES `tbl_page` WRITE;
/*!40000 ALTER TABLE `tbl_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_payment_config`
--

DROP TABLE IF EXISTS `tbl_payment_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_payment_config` (
  `tbl_payment_config_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_payment_config_type` int(11) NOT NULL,
  `tbl_payment_config_accesskey` varchar(100) NOT NULL,
  `fk_store_id` int(11) NOT NULL,
  PRIMARY KEY (`tbl_payment_config_id`),
  KEY `fk_tbl_payment_config_tbl_store1_idx` (`fk_store_id`),
  CONSTRAINT `fk_tbl_payment_config_store_id` FOREIGN KEY (`fk_store_id`) REFERENCES `tbl_store` (`tbl_store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_payment_config`
--

LOCK TABLES `tbl_payment_config` WRITE;
/*!40000 ALTER TABLE `tbl_payment_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_payment_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_product` (
  `tbl_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_product_name` varchar(45) NOT NULL,
  `tbl_product_sku` varchar(45) NOT NULL,
  `tbl_product_baseprice` varchar(45) NOT NULL,
  `tbl_product_qty` int(11) NOT NULL,
  `tbl_product_desc` varchar(2500) NOT NULL,
  PRIMARY KEY (`tbl_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product`
--

LOCK TABLES `tbl_product` WRITE;
/*!40000 ALTER TABLE `tbl_product` DISABLE KEYS */;
INSERT INTO `tbl_product` VALUES (1,'Samsung galaxy a50s','Samsung galaxy a50s','450',250,'\"Awesaome desc\"'),(2,'Iphone X','Iphone X','450',250,'\"Iphone X Awesaome desc\"'),(3,'Mercedes-Benz E400 Wagon','Mercedes-Benz E400 Wagon','15000',3,'There is perhaps no wagon in this world that’s more successful than the Mercedes-Benz E-Class. You wouldn’t guess it from the car’s U.S. representation, where only a small number of the estates are sold, but on a global scale, one out of every three E-Class models sold is a wagon. Hell, in Germany alone, the wagon bodystyle accounts for half of all E-Class sales. It’s a success story told over the wagon’s rich 40-year history, and it culminates with this new version, that’ll come to America early next year in E400 guise.'),(4,'Toyota Land Cruiser HDJ81','Toyota Land Cruiser HDJ81','12000',4,'The Black Knight Off-Road 76 Series Landcruiser, with a turbo diesel V8');
/*!40000 ALTER TABLE `tbl_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product_collections`
--

DROP TABLE IF EXISTS `tbl_product_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_product_collections` (
  `tbl_collections_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_collections_name` varchar(45) NOT NULL,
  PRIMARY KEY (`tbl_collections_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product_collections`
--

LOCK TABLES `tbl_product_collections` WRITE;
/*!40000 ALTER TABLE `tbl_product_collections` DISABLE KEYS */;
INSERT INTO `tbl_product_collections` VALUES (1,'on sale'),(2,'best sellers'),(3,'auction');
/*!40000 ALTER TABLE `tbl_product_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product_has_attributes`
--

DROP TABLE IF EXISTS `tbl_product_has_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_product_has_attributes` (
  `product_id` int(11) NOT NULL,
  `attributes_id` int(11) NOT NULL,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`product_id`,`attributes_id`),
  KEY `fk_tbl_product_has_tbl_attributes_tbl_attributes1_idx` (`attributes_id`),
  KEY `fk_tbl_product_has_tbl_attributes_tbl_product1_idx` (`product_id`),
  CONSTRAINT `fk_tbl_product_has_attributes_attributes_id` FOREIGN KEY (`attributes_id`) REFERENCES `tbl_attributes` (`tbl_attributes_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_product_has_attributes_product_id` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`tbl_product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product_has_attributes`
--

LOCK TABLES `tbl_product_has_attributes` WRITE;
/*!40000 ALTER TABLE `tbl_product_has_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_product_has_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product_has_collections`
--

DROP TABLE IF EXISTS `tbl_product_has_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_product_has_collections` (
  `fk_product_id` int(11) NOT NULL,
  `fk_collections_id` int(11) NOT NULL,
  PRIMARY KEY (`fk_product_id`,`fk_collections_id`),
  KEY `fk_tbl_product_has_tbl_product_collections_tbl_product_coll_idx` (`fk_collections_id`),
  KEY `fk_tbl_product_has_tbl_product_collections_tbl_product1_idx` (`fk_product_id`),
  CONSTRAINT `fk_tbl_product_has_collections_collection_id` FOREIGN KEY (`fk_collections_id`) REFERENCES `tbl_product_collections` (`tbl_collections_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_product_has_collections_product_id` FOREIGN KEY (`fk_product_id`) REFERENCES `tbl_product` (`tbl_product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product_has_collections`
--

LOCK TABLES `tbl_product_has_collections` WRITE;
/*!40000 ALTER TABLE `tbl_product_has_collections` DISABLE KEYS */;
INSERT INTO `tbl_product_has_collections` VALUES (1,1),(2,1),(3,1),(2,2),(4,2),(1,3),(4,3);
/*!40000 ALTER TABLE `tbl_product_has_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product_has_variant_variantdata`
--

DROP TABLE IF EXISTS `tbl_product_has_variant_variantdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_product_has_variant_variantdata` (
  `product_id` int(11) NOT NULL,
  `variants_id` int(11) NOT NULL,
  `variant_data_id` int(11) NOT NULL,
  `fk_image_id` int(11) NOT NULL,
  PRIMARY KEY (`variants_id`,`variant_data_id`,`product_id`),
  KEY `fk_tbl_product_has_variant_variantdata_tbl_variants1_idx` (`variants_id`),
  KEY `fk_tbl_product_has_variant_variantdata_tbl_variant_data1_idx` (`variant_data_id`),
  KEY `fk_tbl_product_has_variant_variantdata_tbl_product1_idx` (`product_id`),
  KEY `fk_tbl_product_has_variant_variantdata_tbl_image1_idx` (`fk_image_id`),
  CONSTRAINT `fk_tbl_product_has_variant_variantdata_product_id` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`tbl_product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_product_has_variant_variantdata_tbl_image_id` FOREIGN KEY (`fk_image_id`) REFERENCES `tbl_product_image` (`tbl_image_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_product_has_variant_variantdata_variant_data_id` FOREIGN KEY (`variant_data_id`) REFERENCES `tbl_variant_data` (`tbl_variant_data_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_product_has_variant_variantdata_variants_id` FOREIGN KEY (`variants_id`) REFERENCES `tbl_variants` (`tbl_variants_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product_has_variant_variantdata`
--

LOCK TABLES `tbl_product_has_variant_variantdata` WRITE;
/*!40000 ALTER TABLE `tbl_product_has_variant_variantdata` DISABLE KEYS */;
INSERT INTO `tbl_product_has_variant_variantdata` VALUES (1,1,1,1),(2,1,1,2),(2,1,2,3),(3,1,3,4),(3,3,6,4),(3,6,15,4),(3,1,1,5),(3,2,4,5),(3,3,7,5),(3,4,8,5),(3,5,12,5),(4,2,5,6),(4,3,7,6),(4,4,11,6),(4,5,13,6),(4,6,14,6);
/*!40000 ALTER TABLE `tbl_product_has_variant_variantdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product_image`
--

DROP TABLE IF EXISTS `tbl_product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_product_image` (
  `tbl_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_image_url` varchar(300) NOT NULL,
  `tbl_image_isthumb` int(11) NOT NULL,
  PRIMARY KEY (`tbl_image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product_image`
--

LOCK TABLES `tbl_product_image` WRITE;
/*!40000 ALTER TABLE `tbl_product_image` DISABLE KEYS */;
INSERT INTO `tbl_product_image` VALUES (1,'https://www.ideabeam.com/images/product/big/samsung-galaxy-a50s.jpg',1),(2,'https://images-na.ssl-images-amazon.com/images/I/5103Xi7yQgL._SX466_.jpg',1),(3,'https://images-na.ssl-images-amazon.com/images/I/51oXVi%2BZhhL._SX466_.jpg',1),(4,'https://cdn.motor1.com/images/mgl/pQMvo/s3/2017-mercedes-benz-e400-wagon-review.jpg',1),(5,'https://cnet4.cbsistatic.com/img/AdthJUuMHa3gdZ96hEDADTl85Sw=/940x0/2019/10/18/e4dd90ff-31b3-4879-a0e3-f53a2df73460/mercedes-benz-recall-main-art.jpg',1),(6,'https://pbs.twimg.com/media/C59f2AKVMAEYobS.jpg',1);
/*!40000 ALTER TABLE `tbl_product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_related_products`
--

DROP TABLE IF EXISTS `tbl_related_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_related_products` (
  `product_id` int(11) NOT NULL,
  `related_product_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_product_id`),
  KEY `fk_related_tbl_product_id_idx` (`related_product_id`),
  CONSTRAINT `fk_related_tbl_product_id` FOREIGN KEY (`related_product_id`) REFERENCES `tbl_product` (`tbl_product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_related_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`tbl_product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_related_products`
--

LOCK TABLES `tbl_related_products` WRITE;
/*!40000 ALTER TABLE `tbl_related_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_related_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_shipping_config`
--

DROP TABLE IF EXISTS `tbl_shipping_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_shipping_config` (
  `tbl_shipping_config_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_shipping_config_type` int(11) NOT NULL,
  `fk_store_id` int(11) NOT NULL,
  PRIMARY KEY (`tbl_shipping_config_id`),
  KEY `fk_tbl_shipping_config_tbl_store1_idx` (`fk_store_id`),
  CONSTRAINT `fk_tbl_shipping_config_store_id` FOREIGN KEY (`fk_store_id`) REFERENCES `tbl_store` (`tbl_store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_shipping_config`
--

LOCK TABLES `tbl_shipping_config` WRITE;
/*!40000 ALTER TABLE `tbl_shipping_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_shipping_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_store`
--

DROP TABLE IF EXISTS `tbl_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_store` (
  `tbl_store_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_store_name` varchar(45) NOT NULL,
  PRIMARY KEY (`tbl_store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_store`
--

LOCK TABLES `tbl_store` WRITE;
/*!40000 ALTER TABLE `tbl_store` DISABLE KEYS */;
INSERT INTO `tbl_store` VALUES (1,'electronics'),(2,'vehicle');
/*!40000 ALTER TABLE `tbl_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_store_config`
--

DROP TABLE IF EXISTS `tbl_store_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_store_config` (
  `tbl_store_config_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_store_config_base_color` varchar(45) NOT NULL,
  `tbl_store_config_font_color` varchar(45) NOT NULL,
  `tbl_store_config_logo` varchar(300) NOT NULL,
  `tbl_store_config_isenable` int(11) NOT NULL,
  `tbl_store_config_domain` varchar(45) NOT NULL,
  `tbl_store_config_email` varchar(45) NOT NULL,
  `tbl_store_config_contact` varchar(45) NOT NULL,
  `fk_store_id` int(11) NOT NULL,
  PRIMARY KEY (`tbl_store_config_id`),
  KEY `fk_tbl_store_config_tbl_store1_idx` (`fk_store_id`),
  CONSTRAINT `fk_tbl_store_config_store_id` FOREIGN KEY (`fk_store_id`) REFERENCES `tbl_store` (`tbl_store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_store_config`
--

LOCK TABLES `tbl_store_config` WRITE;
/*!40000 ALTER TABLE `tbl_store_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_store_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sub_category`
--

DROP TABLE IF EXISTS `tbl_sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_sub_category` (
  `tbl_sub_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_sub_category_name` varchar(45) NOT NULL,
  `fk_base_cat_id` int(11) NOT NULL,
  PRIMARY KEY (`tbl_sub_category_id`),
  KEY `fk_tbl_base_category_id_idx` (`fk_base_cat_id`),
  CONSTRAINT `fk_tbl_sub_category_base_category_id` FOREIGN KEY (`fk_base_cat_id`) REFERENCES `tbl_base_category` (`tbl_base_category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sub_category`
--

LOCK TABLES `tbl_sub_category` WRITE;
/*!40000 ALTER TABLE `tbl_sub_category` DISABLE KEYS */;
INSERT INTO `tbl_sub_category` VALUES (1,'Samsung',1),(2,'Apple',1),(3,'Mercedes-Benz',2),(4,'toyota',3);
/*!40000 ALTER TABLE `tbl_sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sub_category_has_product`
--

DROP TABLE IF EXISTS `tbl_sub_category_has_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_sub_category_has_product` (
  `sub_category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`sub_category_id`,`product_id`),
  KEY `fk_tbl_sub_category_has_tbl_product_tbl_product1_idx` (`product_id`),
  KEY `fk_tbl_sub_category_has_tbl_product_tbl_sub_category1_idx` (`sub_category_id`),
  CONSTRAINT `fk_tbl_sub_category_has_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`tbl_product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_sub_category_has_product_sub_category_id` FOREIGN KEY (`sub_category_id`) REFERENCES `tbl_sub_category` (`tbl_sub_category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sub_category_has_product`
--

LOCK TABLES `tbl_sub_category_has_product` WRITE;
/*!40000 ALTER TABLE `tbl_sub_category_has_product` DISABLE KEYS */;
INSERT INTO `tbl_sub_category_has_product` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `tbl_sub_category_has_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sub_category_has_variants`
--

DROP TABLE IF EXISTS `tbl_sub_category_has_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_sub_category_has_variants` (
  `sub_category_id` int(11) NOT NULL,
  `variants_id` int(11) NOT NULL,
  PRIMARY KEY (`sub_category_id`,`variants_id`),
  KEY `fk_tbl_sub_category_has_tbl_variants_tbl_variants1_idx` (`variants_id`),
  KEY `fk_tbl_sub_category_has_tbl_variants_tbl_sub_category1_idx` (`sub_category_id`),
  CONSTRAINT `fk_tbl_sub_category_has_variants_sub_category_id` FOREIGN KEY (`sub_category_id`) REFERENCES `tbl_sub_category` (`tbl_sub_category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_sub_category_has_variants_variants_id` FOREIGN KEY (`variants_id`) REFERENCES `tbl_variants` (`tbl_variants_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sub_category_has_variants`
--

LOCK TABLES `tbl_sub_category_has_variants` WRITE;
/*!40000 ALTER TABLE `tbl_sub_category_has_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sub_category_has_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user` (
  `tbl_user_id` int(11) NOT NULL,
  `tbl_user_contact` varchar(45) DEFAULT NULL,
  `tbl_user_email` varchar(45) NOT NULL,
  `tbl_user_type` int(11) DEFAULT NULL,
  `tbl_user_status` int(11) DEFAULT NULL,
  `tbl_user_fname` varchar(45) NOT NULL,
  `tbl_user_lname` varchar(45) NOT NULL,
  PRIMARY KEY (`tbl_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (37,'0774351414','shiharimcshane@gmail.com',0,0,'Shihari','McShane'),(38,'7776339022','mcshane@gmail.com',0,0,'Githendra','mcshane');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user_address`
--

DROP TABLE IF EXISTS `tbl_user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user_address` (
  `tbl_user_address_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_user_address_isprimary` int(11) DEFAULT NULL,
  `tbl_user_address_zip` int(11) DEFAULT NULL,
  `tbl_user_address_city` varchar(45) DEFAULT NULL,
  `tbl_user_address_street` varchar(45) DEFAULT NULL,
  `fk_user_id` int(11) NOT NULL,
  PRIMARY KEY (`tbl_user_address_id`),
  KEY `fk_tbl_user_address_tbl_user1_idx` (`fk_user_id`),
  CONSTRAINT `fk_tbl_user_address_tbl_user_id` FOREIGN KEY (`fk_user_id`) REFERENCES `tbl_user` (`tbl_user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_address`
--

LOCK TABLES `tbl_user_address` WRITE;
/*!40000 ALTER TABLE `tbl_user_address` DISABLE KEYS */;
INSERT INTO `tbl_user_address` VALUES (15,1,20414,'Kandy','374/B Haloya, Hindagala ,Peradeniya',37);
/*!40000 ALTER TABLE `tbl_user_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_variant_data`
--

DROP TABLE IF EXISTS `tbl_variant_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_variant_data` (
  `tbl_variant_data_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_variant_data_key` varchar(45) NOT NULL,
  `tbl_variant_data_value` varchar(45) NOT NULL,
  `fk_variants_id` int(11) NOT NULL,
  PRIMARY KEY (`tbl_variant_data_id`),
  KEY `fk_tbl_variant_data_tbl_variants1_idx` (`fk_variants_id`),
  CONSTRAINT `fk_tbl_variant_data_variants_id` FOREIGN KEY (`fk_variants_id`) REFERENCES `tbl_variants` (`tbl_variants_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_variant_data`
--

LOCK TABLES `tbl_variant_data` WRITE;
/*!40000 ALTER TABLE `tbl_variant_data` DISABLE KEYS */;
INSERT INTO `tbl_variant_data` VALUES (1,'RD','red',1),(2,'GR','gray',1),(3,'WH','white',1),(4,'P','petrol',2),(5,'D','diesel',2),(6,'Auto','Automatic',3),(7,'Man','Manual',3),(8,'1.3L 4','1.3L 4',4),(9,'1.4L 4','1.4L 4',4),(10,'2.0L 4','2.0L 4',4),(11,'4.5L 8','4.5L 8',4),(12,'Automobiles','Automobiles',5),(13,'SUV','SUV',5),(14,'4WD','4WD',6),(15,'RWD','RWD',6);
/*!40000 ALTER TABLE `tbl_variant_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_variants`
--

DROP TABLE IF EXISTS `tbl_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_variants` (
  `tbl_variants_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_variants_name` varchar(45) NOT NULL,
  `tbl_variants_type` int(11) NOT NULL,
  PRIMARY KEY (`tbl_variants_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_variants`
--

LOCK TABLES `tbl_variants` WRITE;
/*!40000 ALTER TABLE `tbl_variants` DISABLE KEYS */;
INSERT INTO `tbl_variants` VALUES (1,'color',1),(2,'fuel',2),(3,'transmission',3),(4,'enginetype',4),(5,'vehicletype',5),(6,'drivetrain',6);
/*!40000 ALTER TABLE `tbl_variants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-25 12:51:51
