-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: eduprodb
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `account_email` varchar(255) DEFAULT NULL,
  `account_phone` varchar(12) DEFAULT NULL,
  `account_password` varchar(255) DEFAULT NULL,
  `account_active` bit(1) DEFAULT b'1',
  `account_name` varchar(255) DEFAULT NULL,
  `account_avatar_url` varchar(1000) DEFAULT NULL,
  `account_dob` date DEFAULT NULL,
  `account_role_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_by` int DEFAULT NULL,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `account_oauth` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `account_email` (`account_email`),
  UNIQUE KEY `account_phone` (`account_phone`),
  KEY `account_role_id` (`account_role_id`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`account_role_id`) REFERENCES `setting` (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'lvhn1601@gmail.com','0965749667','160103',_binary '','Le Vo Hoai Nam','https://scontent.fsgn3-1.fna.fbcdn.net/v/t39.30808-6/348242045_244438061510963_4257613910207276971_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=a2f6c7&_nc_ohc=_gJWJT4sWDsAX_0u1mz&_nc_ht=scontent.fsgn3-1.fna&oh=00_AfCK7e1XWx7sr0wyiQdTQ-mNTFEuW6ZcXYvMTQeGGBOjFA&oe=65175382','2003-01-16',1,1,'2023-09-25 21:01:46',1,'2023-09-25 21:07:38',NULL),(2,'huytqhe173113@fpt.edu.vn','0899996666','123456',_binary '','Tran Quoc Huy','https://scontent.fsgn3-1.fna.fbcdn.net/v/t39.30808-6/313395667_819945909222810_6462850333976685367_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=5614bc&_nc_ohc=bu94jUR3nUQAX-OSQZx&_nc_ht=scontent.fsgn3-1.fna&oh=00_AfBoiy5LyWnu3SaskvaOM41pA57CcKoBFOXmtLgAtL-1-g&oe=65166E35','2003-09-30',1,2,'2023-09-25 21:01:46',2,'2023-09-25 21:07:38',NULL),(3,'tungtshe171091@fpt.edu.vn','0966235606','123456',_binary '','Tran Son Tung','https://scontent.fsgn3-1.fna.fbcdn.net/v/t1.6435-9/176349868_478440390146912_3811129774924786794_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=174925&_nc_ohc=FcKsZcSCE-kAX_pwpcn&_nc_ht=scontent.fsgn3-1.fna&oh=00_AfBGmpqcfkUZR5GdK0xMUoUz5F-p8Nqbd3hzmlq1H-Hj6g&oe=6539013D','2003-01-01',1,3,'2023-09-25 21:01:46',3,'2023-09-25 21:07:38',NULL),(4,'khanhnvhe151005@fpt.edu.vn','0936923840','123456',_binary '','Nguyen Van Khanh','https://scontent.fsgn13-4.fna.fbcdn.net/v/t1.6435-9/143952258_808765253316220_1893741025100035406_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=174925&_nc_ohc=uJNwyv8YLd8AX_s7A58&_nc_ht=scontent.fsgn13-4.fna&oh=00_AfD26xOV0Wy1wynHHgm4lISWV8PNlE0jq8zyWWmtMdwBBg&oe=65391647','2001-08-30',1,4,'2023-09-25 21:01:46',4,'2023-09-25 21:07:38',NULL),(5,'duytnhe151382@fpt.edu.vn','0789381372','123456',_binary '','Ta Ngoc Duy','https://scontent.fsgn13-2.fna.fbcdn.net/v/t39.30808-6/340655643_1510409089489500_6851084380965464129_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=a2f6c7&_nc_ohc=HqGB61hZLw8AX_CdOBu&_nc_ht=scontent.fsgn13-2.fna&oh=00_AfDFwPAJXyu__Bv93b70UdZnXwfHwbPS3V-eSoFMf4TYzw&oe=651767D9','2001-02-03',1,5,'2023-09-25 21:01:46',1,'2023-09-25 22:07:57',NULL),(6,'nguyngiselle6872@gmail.com','0320695248','123456',_binary '\0','Nguyễn Giselle','https://fastly.picsum.photos/id/22/4434/3729.jpg?hmac=fjZdkSMZJNFgsoDh8Qo5zdA_nSGUAWvKLyyqmEt2xs0','2003-07-16',3,3,'2023-09-25 21:41:51',1,'2023-09-25 22:07:56',NULL),(7,'nguynrudyard4170@gmail.com','0380741576','123456',_binary '','Nguyễn Rudyard','https://fastly.picsum.photos/id/27/3264/1836.jpg?hmac=p3BVIgKKQpHhfGRRCbsi2MCAzw8mWBCayBsKxxtWO8g','2004-07-06',2,2,'2023-09-25 21:41:51',4,'2023-09-25 21:48:25',NULL),(8,'vidaquan@gmail.com','0865318215','123456',_binary '\0','Vi Daquan','https://fastly.picsum.photos/id/40/4106/2806.jpg?hmac=MY3ra98ut044LaWPEKwZowgydHZ_rZZUuOHrc3mL5mI','2003-12-05',4,2,'2023-09-25 21:41:51',1,'2023-09-25 22:07:55',NULL),(9,'lnhidona8920@gmail.com','0459028795','123456',_binary '','Lãnh Idona','https://fastly.picsum.photos/id/39/3456/2304.jpg?hmac=cc_VPxzydwTUbGEtpsDeo2NxCkeYQrhTLqw4TFo-dIg','2005-01-30',2,1,'2023-09-25 21:41:51',2,'2023-09-25 21:48:25',NULL),(10,'nguynroanna@gmail.com','0927315554','123456',_binary '\0','Nguyễn Roanna','https://fastly.picsum.photos/id/45/4592/2576.jpg?hmac=Vc7_kMYufvy96FxocZ1Zx6DR1PNsNQXF4XUw1mZ2dlc','2002-03-18',3,2,'2023-09-25 21:41:51',1,'2023-09-25 22:08:01',NULL),(11,'nguynjasmine@gmail.com','0670388265','123456',_binary '','Nguyễn Jasmine','https://fastly.picsum.photos/id/48/5000/3333.jpg?hmac=y3_1VDNbhii0vM_FN6wxMlvK27vFefflbUSH06z98so','2004-08-08',3,3,'2023-09-25 21:41:51',2,'2023-09-25 21:48:25',NULL),(12,'nguynphoebe2722@gmail.com','0362204253','123456',_binary '\0','Nguyễn Phoebe','https://fastly.picsum.photos/id/54/3264/2176.jpg?hmac=blh020fMeJ5Ru0p-fmXUaOAeYnxpOPHnhJojpzPLN3g','2000-12-08',4,5,'2023-09-25 21:41:51',1,'2023-09-25 22:08:01',NULL),(13,'nguyncathleen@gmail.com','0614786589','123456',_binary '\0','Nguyễn Cathleen','https://fastly.picsum.photos/id/58/1280/853.jpg?hmac=YO3QnOm9TpyM5DqsJjoM4CHg8oIq4cMWLpd9ALoP908','2004-09-01',2,5,'2023-09-25 21:41:51',1,'2023-09-25 22:08:02',NULL),(14,'nguynjackson@gmail.com','0711159288','123456',_binary '\0','Nguyễn Jackson','https://fastly.picsum.photos/id/65/4912/3264.jpg?hmac=uq0IxYtPIqRKinGruj45KcPPzxDjQvErcxyS1tn7bG0','2001-02-19',2,2,'2023-09-25 21:41:51',1,'2023-09-25 22:08:02',NULL),(15,'khuzoe@gmail.com','0375590869','123456',_binary '','Khâu Zoe','https://fastly.picsum.photos/id/73/5000/3333.jpg?hmac=Tp-n4qzO5flXetGX76h2Ht1P6PHBQlabJuULUtj6ytw','2001-10-14',4,4,'2023-09-25 21:41:51',2,'2023-09-25 21:48:25',NULL),(16,'nguyneve2709@gmail.com','0514042611','123456',_binary '','Nguyễn Eve','https://fastly.picsum.photos/id/72/3000/2000.jpg?hmac=hPLN3NcJrehzDdebypIHkhh2RLnh89HwJ8QemMsRjzc','2001-01-25',3,2,'2023-09-25 21:41:51',2,'2023-09-25 21:48:25',NULL),(17,'nguynzia@gmail.com','0511335427','123456',_binary '\0','Nguyễn Zia','https://fastly.picsum.photos/id/80/3888/2592.jpg?hmac=zD95NwXZ7mGAMj-z4444Elf43I4HJvd7Afm2tloweLw','2002-06-11',2,3,'2023-09-25 21:41:51',1,'2023-09-25 22:08:08',NULL),(18,'ujasmine4970@gmail.com','0503743765','123456',_binary '','Đậu Jasmine','https://fastly.picsum.photos/id/84/1280/848.jpg?hmac=YFRYDI4UsfbeTzI8ZakNOR98wVU7a-9a2tGF542539s','2004-09-12',4,3,'2023-09-25 21:41:51',3,'2023-09-25 21:48:25',NULL),(19,'nguyncharles7110@gmail.com','0231418726','123456',_binary '\0','Nguyễn Charles','https://fastly.picsum.photos/id/88/1280/1707.jpg?hmac=NnkwPVDBTVxHkc4rALB_fyu-OHY2usdm7iRk5El7JC4','2003-02-14',4,2,'2023-09-25 21:41:51',1,'2023-09-25 22:08:05',NULL),(20,'nguynishmael@gmail.com','0382035793','123456',_binary '\0','Nguyễn Ishmael','https://fastly.picsum.photos/id/91/3504/2336.jpg?hmac=tK6z7RReLgUlCuf4flDKeg57o6CUAbgklgLsGL0UowU','1999-07-16',2,1,'2023-09-25 21:41:51',1,'2023-09-25 22:08:07',NULL),(21,'nguynhelen5398@gmail.com','0555387314','123456',_binary '','Nguyễn Helen','https://fastly.picsum.photos/id/96/4752/3168.jpg?hmac=KNXudB1q84CHl2opIFEY4ph12da5JD5GzKzH5SeuRVM','2001-08-19',3,2,'2023-09-25 21:41:51',4,'2023-09-25 21:48:25',NULL),(22,'nguynmark@gmail.com','0933666196','123456',_binary '\0','Nguyễn Mark','https://fastly.picsum.photos/id/103/2592/1936.jpg?hmac=aC1FT3vX9bCVMIT-KXjHLhP6vImAcsyGCH49vVkAjPQ','2000-07-19',2,4,'2023-09-25 21:41:51',1,'2023-09-25 22:08:06',NULL),(23,'nguynlee2311@gmail.com','0643532817','123456',_binary '','Nguyễn Lee','https://fastly.picsum.photos/id/113/4168/2464.jpg?hmac=p1FqJDS9KHL70UWqUjlYPhJKBdiNOI_CIH0Qo-74_fU','2005-06-05',4,3,'2023-09-25 21:41:51',3,'2023-09-25 21:48:25',NULL),(24,'nguynjelani@gmail.com','0218019582','123456',_binary '','Nguyễn Jelani','https://fastly.picsum.photos/id/117/1544/1024.jpg?hmac=xFWtVUv1xkFVVidifC3drKerU_k_za4w28fv5etvxRc','1999-11-08',2,3,'2023-09-25 21:41:51',5,'2023-09-25 21:48:25',NULL),(25,'nguynherman2325@gmail.com','0194356881','123456',_binary '','Nguyễn Herman','https://fastly.picsum.photos/id/122/4147/2756.jpg?hmac=-B_1uAvYufznhjeA9xSSAJjqt07XrVzDWCf5VDNX0pQ','2004-02-05',2,3,'2023-09-25 21:41:51',4,'2023-09-25 21:48:25',NULL),(26,'nguynkessie8293@gmail.com','0753246340','123456',_binary '\0','Nguyễn Kessie','https://fastly.picsum.photos/id/142/4272/2848.jpg?hmac=z8IS_an6FQ8ijJOBd-wSVg1JTZbeIDG4TbjHwLQbs0I','2001-04-21',2,1,'2023-09-25 21:41:51',1,'2023-09-25 22:08:13',NULL),(27,'nguynlillian@gmail.com','0654653110','123456',_binary '','Nguyễn Lillian','https://fastly.picsum.photos/id/154/3264/2176.jpg?hmac=a4Q6dBKGy7G27ic7K1sEPr-KzMigvl-MQsZUEX9iFxM','2003-05-09',3,4,'2023-09-25 21:41:51',5,'2023-09-25 21:48:25',NULL),(28,'nguyncruz@gmail.com','0428162848','123456',_binary '\0','Nguyễn Cruz','https://fastly.picsum.photos/id/173/1200/737.jpg?hmac=ujJhJBX1oswhCjRKDEeHR3kHWi-wfK6Q6UhhHuJo9hY','2004-07-05',2,4,'2023-09-25 21:41:51',1,'2023-09-25 22:08:12',NULL),(29,'nguynjenette7199@gmail.com','0124257430','123456',_binary '','Nguyễn Jenette','https://fastly.picsum.photos/id/177/2515/1830.jpg?hmac=G8-2Q3-YPB2TreOK-4ofcmS-z5F6chIA0GHYAe5yzDY','2002-09-30',3,2,'2023-09-25 21:41:51',2,'2023-09-25 21:48:25',NULL),(30,'nguynhedley@gmail.com','0623566849','123456',_binary '','Nguyễn Hedley','https://fastly.picsum.photos/id/183/2316/1544.jpg?hmac=908ZBWKqGdL9kio38tCq2ViwMm3DjLUtkjU_6SWNa9k','2003-09-22',2,2,'2023-09-25 21:41:51',2,'2023-09-25 21:48:25',NULL),(31,'nhd@fpt.edu.vn','0912345678','1',_binary '','Nguyễn Huy Đức','https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg','2003-04-04',2,1,'2023-09-25 22:13:43',1,'2023-09-25 22:17:46',NULL),(32,'tad2337@gmail.com','0944555666','1',_binary '','Trần Anh Đức','https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg','2003-04-04',2,1,'2023-09-25 22:17:11',1,'2023-09-25 22:17:11',NULL),(33,'pttb@gmail.com',NULL,'1',_binary '','Phan Thi Thanh Binh','https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg','2003-04-09',3,1,'2023-09-25 22:20:51',1,'2023-09-25 22:20:51',NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `setting_key` int NOT NULL,
  `setting_title` varchar(255) NOT NULL,
  `setting_status` bit(1) DEFAULT b'1',
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_by` int DEFAULT NULL,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,1,'Admin',_binary '',0,'2023-09-25 20:45:05',0,'2023-09-25 20:45:05'),(2,1,'Manager',_binary '',0,'2023-09-25 20:45:05',0,'2023-09-25 20:45:05'),(3,1,'Teacher',_binary '',0,'2023-09-25 20:45:05',0,'2023-09-25 20:45:05'),(4,1,'Student',_binary '',0,'2023-09-25 20:45:05',0,'2023-09-25 20:45:05'),(5,2,'SPRING-2023',_binary '',1,'2023-09-25 21:18:49',1,'2023-09-25 21:18:49'),(6,3,'gmail.com',_binary '',1,'2023-09-25 21:18:49',1,'2023-09-25 21:18:49'),(7,3,'fpt.edu.vn',_binary '',1,'2023-09-25 21:18:49',1,'2023-09-25 21:19:16'),(8,2,'SPRING-2022',_binary '\0',1,'2023-09-25 22:05:41',1,'2023-09-25 22:06:46'),(9,2,'SUMMER-2022',_binary '\0',1,'2023-09-25 22:05:51',1,'2023-09-25 22:06:44'),(10,2,'FALL-2022',_binary '\0',1,'2023-09-25 22:05:58',1,'2023-09-25 22:06:45'),(11,2,'SUMMER-2023',_binary '\0',1,'2023-09-25 22:06:18',1,'2023-09-25 22:06:44'),(12,2,'FALL-2023',_binary '',1,'2023-09-25 22:06:29',1,'2023-09-25 22:06:29'),(13,3,'hust.edu.vn',_binary '\0',1,'2023-09-25 22:07:00',1,'2023-09-25 22:07:45'),(14,2,'SPRING-2024',_binary '\0',1,'2023-09-25 22:07:09',1,'2023-09-25 22:07:28'),(15,3,'neu.edu.vn',_binary '\0',1,'2023-09-25 22:07:41',1,'2023-09-25 22:07:45');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `subject_id` int unsigned NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(255) DEFAULT NULL,
  `subject_code` varchar(8) DEFAULT NULL,
  `subject_manager_id` int DEFAULT NULL,
  `subject_status` bit(1) DEFAULT b'1',
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_by` int DEFAULT NULL,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`subject_id`),
  KEY `subject_manager_id` (`subject_manager_id`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`subject_manager_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'Elementary Japanese 1-A1.1','JPD113',7,_binary '',1,'2023-09-25 22:03:24',1,'2023-09-25 22:03:24'),(2,'Data Structures and Algorithms','CSD201',9,_binary '',2,'2023-09-25 22:03:24',2,'2023-09-25 22:03:24'),(3,'Introduction to Databases','DBI202',7,_binary '\0',4,'2023-09-25 22:03:24',1,'2023-09-25 22:04:00'),(4,'OOP with Java Lab','LAB211',13,_binary '',5,'2023-09-25 22:03:24',5,'2023-09-25 22:03:24'),(5,'Statistics and Probability','MAS291',14,_binary '',2,'2023-09-25 22:03:24',2,'2023-09-25 22:03:24'),(6,'Elementary Japanese 1-A1.2','JPD123',17,_binary '\0',1,'2023-09-25 22:03:24',1,'2023-09-25 22:03:59'),(7,'Internet of Things','IOT102',7,_binary '',1,'2023-09-25 22:03:24',1,'2023-09-25 22:03:24'),(8,'Java Web Application Development','PRJ301',9,_binary '\0',2,'2023-09-25 22:03:24',1,'2023-09-25 22:04:01'),(9,'Application development project','SWP391',20,_binary '',1,'2023-09-25 22:03:24',1,'2023-09-25 22:03:24'),(10,'Software Requirement','SWR302',24,_binary '\0',2,'2023-09-25 22:03:24',1,'2023-09-25 22:04:03'),(11,'Software Testing','SWT301',22,_binary '',4,'2023-09-25 22:03:24',4,'2023-09-25 22:03:24'),(12,'Basic Cross-Platform Application Programming With .NET','PRN211',22,_binary '\0',3,'2023-09-25 22:03:24',1,'2023-09-25 22:04:05'),(13,'SW Architecture and Design','SWD392',13,_binary '',3,'2023-09-25 22:03:24',3,'2023-09-25 22:03:24'),(14,'Mobile Programming','PRM392',13,_binary '\0',3,'2023-09-25 22:03:24',1,'2023-09-25 22:04:04'),(15,'Experiential Entrepreneurship 2','EXE201',14,_binary '',2,'2023-09-25 22:03:24',2,'2023-09-25 22:03:24');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-25 22:24:21
