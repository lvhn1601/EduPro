-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: testiter2
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
  `account_active` int DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'lvhn1601@gmail.com','0965749667','160103',1,'Le Vo Hoai Nam','https://scontent.fhan2-4.fna.fbcdn.net/v/t39.30808-6/384803560_1719438308573681_8764989730324148449_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=a2f6c7&_nc_ohc=GUFtDMm_EPIAX9cV1z5&_nc_ht=scontent.fhan2-4.fna&oh=00_AfCf7JGTupp4nWeWwbg_Muj_iXgu3uE-2yh4H2yeQIIQzQ&oe=652A377D','2003-01-16',1,1,'2023-09-25 21:01:46',1,'2023-10-10 10:59:37',NULL),(2,'huytqhe173113@fpt.edu.vn','0899996666','123456',1,'Tran Quoc Huy','https://scontent.fsgn3-1.fna.fbcdn.net/v/t39.30808-6/313395667_819945909222810_6462850333976685367_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=5614bc&_nc_ohc=bu94jUR3nUQAX-OSQZx&_nc_ht=scontent.fsgn3-1.fna&oh=00_AfBoiy5LyWnu3SaskvaOM41pA57CcKoBFOXmtLgAtL-1-g&oe=65166E35','2003-09-30',4,2,'2023-09-25 21:01:46',1,'2023-10-06 16:07:43',NULL),(3,'tungtshe171091@fpt.edu.vn','0966235606','123456',1,'Tran Son Tung','https://scontent.fsgn3-1.fna.fbcdn.net/v/t1.6435-9/176349868_478440390146912_3811129774924786794_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=174925&_nc_ohc=FcKsZcSCE-kAX_pwpcn&_nc_ht=scontent.fsgn3-1.fna&oh=00_AfBGmpqcfkUZR5GdK0xMUoUz5F-p8Nqbd3hzmlq1H-Hj6g&oe=6539013D','2003-01-01',3,3,'2023-09-25 21:01:46',1,'2023-10-06 16:07:37',NULL),(4,'khanhnvhe151005@fpt.edu.vn','0936923840','123456',1,'Nguyen Van Khanh','https://scontent.fsgn13-4.fna.fbcdn.net/v/t1.6435-9/143952258_808765253316220_1893741025100035406_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=174925&_nc_ohc=uJNwyv8YLd8AX_s7A58&_nc_ht=scontent.fsgn13-4.fna&oh=00_AfD26xOV0Wy1wynHHgm4lISWV8PNlE0jq8zyWWmtMdwBBg&oe=65391647','2001-08-30',3,4,'2023-09-25 21:01:46',1,'2023-09-29 16:50:49',NULL),(5,'duytnhe151382@fpt.edu.vn','0789381372','123456',2,'Tạ Ngọc Duy','https://scontent.fsgn13-2.fna.fbcdn.net/v/t39.30808-6/340655643_1510409089489500_6851084380965464129_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=a2f6c7&_nc_ohc=HqGB61hZLw8AX_CdOBu&_nc_ht=scontent.fsgn13-2.fna&oh=00_AfDFwPAJXyu__Bv93b70UdZnXwfHwbPS3V-eSoFMf4TYzw&oe=651767D9','2001-02-03',2,5,'2023-09-25 21:01:46',1,'2023-09-29 16:47:45',NULL),(6,'nguyenquoc@fpt.edu.vn','0912456789','123456',0,'Nguyễn Quốc','https://fastly.picsum.photos/id/22/4434/3729.jpg?hmac=fjZdkSMZJNFgsoDh8Qo5zdA_nSGUAWvKLyyqmEt2xs0','2003-07-16',3,3,'2023-09-25 21:41:51',1,'2023-09-26 00:33:20',NULL),(7,'hnam@gmail.com','0965749992','123456',1,'LeVo Hnam','https://fastly.picsum.photos/id/27/3264/1836.jpg?hmac=p3BVIgKKQpHhfGRRCbsi2MCAzw8mWBCayBsKxxtWO8g','2004-07-06',2,2,'2023-09-25 21:41:51',1,'2023-10-10 11:44:06',NULL),(8,'vidaquan@gmail.com','0865318215','123456',0,'Vi Daquan','https://fastly.picsum.photos/id/40/4106/2806.jpg?hmac=MY3ra98ut044LaWPEKwZowgydHZ_rZZUuOHrc3mL5mI','2003-12-05',4,2,'2023-09-25 21:41:51',1,'2023-09-25 22:07:55',NULL),(9,'manager@gmail.com','0459028795','123456',1,'Subject Manager 01','https://fastly.picsum.photos/id/39/3456/2304.jpg?hmac=cc_VPxzydwTUbGEtpsDeo2NxCkeYQrhTLqw4TFo-dIg','2005-01-30',2,1,'2023-09-25 21:41:51',1,'2023-10-14 23:46:04',NULL),(10,'nguynroanna@gmail.com','0927315554','123456',2,'Nguyễn Roanna','https://fastly.picsum.photos/id/45/4592/2576.jpg?hmac=Vc7_kMYufvy96FxocZ1Zx6DR1PNsNQXF4XUw1mZ2dlc','2002-03-18',3,2,'2023-09-25 21:41:51',1,'2023-09-29 16:47:45',NULL),(11,'nguynjasmine@gmail.com','0670388265','123456',1,'Nguyễn Jasmine','https://fastly.picsum.photos/id/48/5000/3333.jpg?hmac=y3_1VDNbhii0vM_FN6wxMlvK27vFefflbUSH06z98so','2004-08-08',3,3,'2023-09-25 21:41:51',2,'2023-09-25 21:48:25',NULL),(12,'nguynphoebe2722@gmail.com','0362204253','123456',2,'Nguyễn Phoebe','https://fastly.picsum.photos/id/54/3264/2176.jpg?hmac=blh020fMeJ5Ru0p-fmXUaOAeYnxpOPHnhJojpzPLN3g','2000-12-08',4,5,'2023-09-25 21:41:51',1,'2023-09-29 16:47:45',NULL),(13,'nguyncathleen@gmail.com','0614786589','123456',1,'Nguyễn Cathleen','https://fastly.picsum.photos/id/58/1280/853.jpg?hmac=YO3QnOm9TpyM5DqsJjoM4CHg8oIq4cMWLpd9ALoP908','2004-09-01',2,5,'2023-09-25 21:41:51',1,'2023-09-26 10:12:06',NULL),(14,'nguynjackson@gmail.com','0711159288','123456',1,'Nguyễn Jackson','https://fastly.picsum.photos/id/65/4912/3264.jpg?hmac=uq0IxYtPIqRKinGruj45KcPPzxDjQvErcxyS1tn7bG0','2001-02-19',2,2,'2023-09-25 21:41:51',1,'2023-09-26 10:12:07',NULL),(15,'khuzoe@gmail.com','0375590869','123456',1,'Khâu Zoe','https://fastly.picsum.photos/id/73/5000/3333.jpg?hmac=Tp-n4qzO5flXetGX76h2Ht1P6PHBQlabJuULUtj6ytw','2001-10-14',4,4,'2023-09-25 21:41:51',2,'2023-09-25 21:48:25',NULL),(16,'nguyneve2709@gmail.com','0514042611','123456',1,'Nguyễn Eve','https://fastly.picsum.photos/id/72/3000/2000.jpg?hmac=hPLN3NcJrehzDdebypIHkhh2RLnh89HwJ8QemMsRjzc','2001-01-25',3,2,'2023-09-25 21:41:51',2,'2023-09-25 21:48:25',NULL),(17,'nguynzia@gmail.com','0511335427','123456',2,'Nguyễn Zia','https://fastly.picsum.photos/id/80/3888/2592.jpg?hmac=zD95NwXZ7mGAMj-z4444Elf43I4HJvd7Afm2tloweLw','2002-06-11',2,3,'2023-09-25 21:41:51',1,'2023-09-29 16:47:45',NULL),(18,'ujasmine4970@gmail.com','0503743765','123456',1,'Đậu Jasmine','https://fastly.picsum.photos/id/84/1280/848.jpg?hmac=YFRYDI4UsfbeTzI8ZakNOR98wVU7a-9a2tGF542539s','2004-09-12',4,3,'2023-09-25 21:41:51',3,'2023-09-25 21:48:25',NULL),(19,'nmd1111@gmail.com','0658848446','123456',0,'Nguyễn Minh Đức','https://fastly.picsum.photos/id/88/1280/1707.jpg?hmac=NnkwPVDBTVxHkc4rALB_fyu-OHY2usdm7iRk5El7JC4','2003-02-14',3,2,'2023-09-25 21:41:51',1,'2023-09-26 01:02:45',NULL),(20,'nguynishmael@gmail.com','0382035793','123456',1,'Nguyễn Minh','https://fastly.picsum.photos/id/91/3504/2336.jpg?hmac=tK6z7RReLgUlCuf4flDKeg57o6CUAbgklgLsGL0UowU','1999-07-16',4,1,'2023-09-25 21:41:51',1,'2023-09-26 00:47:48',NULL),(21,'nhm1222@fpt.edu.vn','04561894561','123456',0,'Nguyễn Hoàng Minh','https://fastly.picsum.photos/id/96/4752/3168.jpg?hmac=KNXudB1q84CHl2opIFEY4ph12da5JD5GzKzH5SeuRVM','2001-08-19',4,2,'2023-09-25 21:41:51',1,'2023-09-26 01:25:30',NULL),(22,'nmq112@gmail.com','0945789123','123456',1,'Nguyễn Minh Quân','https://fastly.picsum.photos/id/103/2592/1936.jpg?hmac=aC1FT3vX9bCVMIT-KXjHLhP6vImAcsyGCH49vVkAjPQ','2000-07-19',3,4,'2023-09-25 21:41:51',1,'2023-09-26 00:56:36',NULL),(23,'nguynlee2311@gmail.com','0643532817','123456',2,'Nguyễn Lee','https://fastly.picsum.photos/id/113/4168/2464.jpg?hmac=p1FqJDS9KHL70UWqUjlYPhJKBdiNOI_CIH0Qo-74_fU','2005-06-05',4,3,'2023-09-25 21:41:51',1,'2023-09-29 16:47:45',NULL),(24,'nguynjelani@gmail.com','0218019582','123456',1,'Nguyễn Đức','https://fastly.picsum.photos/id/117/1544/1024.jpg?hmac=xFWtVUv1xkFVVidifC3drKerU_k_za4w28fv5etvxRc','1999-11-08',2,3,'2023-09-25 21:41:51',1,'2023-09-25 23:57:49',NULL),(25,'nguynherman2325@gmail.com','0194356881','123456',1,'Nguyễn Herman','https://fastly.picsum.photos/id/122/4147/2756.jpg?hmac=-B_1uAvYufznhjeA9xSSAJjqt07XrVzDWCf5VDNX0pQ','2004-02-05',2,3,'2023-09-25 21:41:51',4,'2023-09-25 21:48:25',NULL),(26,'nguynkessie8293@gmail.com','0753246340','123456',2,'Nguyễn Kessie','https://fastly.picsum.photos/id/142/4272/2848.jpg?hmac=z8IS_an6FQ8ijJOBd-wSVg1JTZbeIDG4TbjHwLQbs0I','2001-04-21',2,1,'2023-09-25 21:41:51',1,'2023-09-29 16:47:45',NULL),(27,'nguynlillian@gmail.com','0654653110','123456',1,'Nguyễn Lillian','https://fastly.picsum.photos/id/154/3264/2176.jpg?hmac=a4Q6dBKGy7G27ic7K1sEPr-KzMigvl-MQsZUEX9iFxM','2003-05-09',3,4,'2023-09-25 21:41:51',5,'2023-09-25 21:48:25',NULL),(28,'nguyncruz@gmail.com','0428162848','123456',2,'Nguyễn Cruz','https://fastly.picsum.photos/id/173/1200/737.jpg?hmac=ujJhJBX1oswhCjRKDEeHR3kHWi-wfK6Q6UhhHuJo9hY','2004-07-05',2,4,'2023-09-25 21:41:51',1,'2023-09-29 16:47:45',NULL),(29,'nguynjenette7199@gmail.com','0124257430','123456',1,'Nguyễn Jenette','https://fastly.picsum.photos/id/177/2515/1830.jpg?hmac=G8-2Q3-YPB2TreOK-4ofcmS-z5F6chIA0GHYAe5yzDY','2002-09-30',3,2,'2023-09-25 21:41:51',2,'2023-09-25 21:48:25',NULL),(30,'nguynhedley@gmail.com','0623566849','123456',1,'Nguyễn Hedley','https://fastly.picsum.photos/id/183/2316/1544.jpg?hmac=908ZBWKqGdL9kio38tCq2ViwMm3DjLUtkjU_6SWNa9k','2003-09-22',2,2,'2023-09-25 21:41:51',2,'2023-09-25 21:48:25',NULL),(31,'nhd@fpt.edu.vn','0912345678','1',1,'Nguyễn Huy Đức','https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg','2003-04-04',2,1,'2023-09-25 22:13:43',1,'2023-09-25 22:17:46',NULL),(32,'tad2337@gmail.com','0944555666','1',1,'Trần Anh Đức','https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg','2003-04-04',2,1,'2023-09-25 22:17:11',1,'2023-09-25 22:17:11',NULL),(33,'pttb@gmail.com',NULL,'1',1,'Phan Thi Thanh Binh','https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg','2003-04-09',3,1,'2023-09-25 22:20:51',1,'2023-09-25 22:20:51',NULL),(34,'quoctrung@gmail.com',NULL,'1',1,'Nguyen Quoc Trung','https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg','2003-01-01',2,1,'2023-09-26 00:35:02',1,'2023-09-26 00:35:02',NULL),(35,NULL,'0965712217','1',1,'Tran Minh Duc','https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg','2001-01-20',3,1,'2023-09-26 00:40:05',1,'2023-09-26 00:40:05',NULL),(36,'lvhm@gmail.com',NULL,'1',1,'Le Vo Hoang Minh','https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg','2004-01-20',2,1,'2023-09-26 00:57:39',1,'2023-09-26 00:57:39',NULL),(37,'lmqm@gmail.com',NULL,'1',0,'Le Nguyen Quoc Minh','https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg','2003-01-01',3,1,'2023-09-26 01:03:41',1,'2023-09-29 16:47:45',NULL),(38,NULL,'0965748882','1',0,'Lê Nguyễn Tường Vy','https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg','2001-01-01',3,1,'2023-09-26 01:26:38',1,'2023-09-29 16:47:45',NULL),(39,NULL,'0918478364','123456789',0,'Tran Thi Anh Duc',NULL,NULL,1,NULL,'2023-09-26 13:08:06',NULL,'2023-09-29 16:47:45',NULL),(40,'anhduc2337@gmail.com',NULL,'1',0,'adu','a',NULL,4,NULL,'2023-09-29 15:52:14',NULL,'2023-09-29 16:47:45',NULL),(41,'namlvh@fpt.edu.vn',NULL,'1',0,'Le Nam','https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg','2003-01-01',3,1,'2023-09-29 16:51:45',1,'2023-09-29 16:51:45',NULL),(42,'hnam1616@fpt.edu.vn',NULL,'1',0,'Nguyen Trung Quan','https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-photo-700-205577532.jpg','2003-01-01',4,1,'2023-10-06 16:49:40',1,'2023-10-06 16:50:36',NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer` (
  `answer_id` int NOT NULL AUTO_INCREMENT,
  `answer_detail` varchar(1000) NOT NULL,
  `answer_correct` bit(1) DEFAULT b'0',
  `answer_question_id` int NOT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `fk_answer_question1_idx` (`answer_question_id`),
  CONSTRAINT `fk_answer_question1` FOREIGN KEY (`answer_question_id`) REFERENCES `question` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment_class`
--

DROP TABLE IF EXISTS `assignment_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment_class` (
  `assignment_id` int NOT NULL,
  `class_id` int NOT NULL,
  `assignment_exprired` datetime DEFAULT NULL,
  PRIMARY KEY (`assignment_id`,`class_id`),
  KEY `fk_assignment_class_class1_idx` (`class_id`),
  KEY `fk_assignment_class_lesson1_idx` (`assignment_id`),
  CONSTRAINT `fk_assignment_class_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `fk_assignment_class_lesson1` FOREIGN KEY (`assignment_id`) REFERENCES `lesson` (`lesson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_class`
--

LOCK TABLES `assignment_class` WRITE;
/*!40000 ALTER TABLE `assignment_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignment_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chapter`
--

DROP TABLE IF EXISTS `chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapter` (
  `chapter_id` int NOT NULL AUTO_INCREMENT,
  `chapter_title` varchar(255) NOT NULL,
  `chapter_description` text,
  `chapter_status` bit(1) DEFAULT b'1',
  `chapter_subject_id` int unsigned NOT NULL,
  `chapter_display_order` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_by` int DEFAULT NULL,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`chapter_id`),
  KEY `fk_chapter_subject1_idx` (`chapter_subject_id`),
  CONSTRAINT `fk_chapter_subject1` FOREIGN KEY (`chapter_subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapter`
--

LOCK TABLES `chapter` WRITE;
/*!40000 ALTER TABLE `chapter` DISABLE KEYS */;
INSERT INTO `chapter` VALUES (1,'quiz results and take quizzes assigned to','lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere',_binary '',1,1,7,'2023-10-14 22:25:05',7,'2023-10-14 22:25:05'),(2,'the Quizzes category They can','iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi.',_binary '',1,2,7,'2023-10-14 22:25:05',7,'2023-10-14 22:25:05'),(3,'students only have access to the Results menu','arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut',_binary '',1,3,7,'2023-10-14 22:25:05',7,'2023-10-14 22:25:05'),(4,'students only have access to','odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi',_binary '',1,4,7,'2023-10-14 22:25:05',7,'2023-10-14 22:25:05'),(5,'and complete quizzes assigned','massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac',_binary '',1,5,7,'2023-10-14 22:25:05',7,'2023-10-14 22:25:05'),(6,'Organization accounts Administrators and Tutors','a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero',_binary '',2,1,9,'2023-10-14 22:26:49',9,'2023-10-14 22:26:49'),(7,'assigned to them students','tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit',_binary '',2,2,9,'2023-10-14 22:26:49',9,'2023-10-14 22:26:49'),(8,'access to the Results','imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla',_binary '',2,3,9,'2023-10-14 22:26:49',9,'2023-10-14 22:26:49'),(9,'quizzes assigned to them students only','justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus,',_binary '',2,4,9,'2023-10-14 22:26:49',9,'2023-10-14 22:26:49'),(10,'accounts Administrators and Tutors have access','ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel',_binary '',2,5,9,'2023-10-14 22:26:49',9,'2023-10-14 22:26:49'),(11,'with one correct answer, select','vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus',_binary '',8,1,9,'2023-10-14 22:29:44',9,'2023-10-14 22:29:44'),(12,'first answer is the correct','lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque',_binary '',8,2,9,'2023-10-14 22:29:44',9,'2023-10-14 22:29:44'),(13,'possible answers Select the correct','Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In',_binary '',8,3,9,'2023-10-14 22:29:44',9,'2023-10-14 22:29:44'),(14,'create a multiple-choice question with one','ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras',_binary '',8,4,9,'2023-10-14 22:29:44',9,'2023-10-14 22:29:44'),(15,'is the correct one When','sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor',_binary '',8,5,9,'2023-10-14 22:29:44',9,'2023-10-14 22:29:44'),(16,'It will turn green','arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris,',_binary '',8,6,9,'2023-10-14 22:29:44',9,'2023-10-14 22:29:44'),(17,'two additional options appear:','semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus',_binary '',8,7,9,'2023-10-14 22:29:44',9,'2023-10-14 22:29:44');
/*!40000 ALTER TABLE `chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(100) NOT NULL,
  `class_subject_id` int unsigned NOT NULL,
  `class_semester_id` int NOT NULL,
  `class_trainer_id` int NOT NULL,
  `class_status` bit(1) DEFAULT b'1',
  `class_start` date NOT NULL,
  `class_end` date NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_by` int DEFAULT NULL,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`class_id`),
  KEY `fk_class_subject1_idx` (`class_subject_id`),
  KEY `fk_class_setting2_idx` (`class_semester_id`),
  KEY `fk_class_account2_idx` (`class_trainer_id`),
  CONSTRAINT `fk_class_account2` FOREIGN KEY (`class_trainer_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `fk_class_setting2` FOREIGN KEY (`class_semester_id`) REFERENCES `setting` (`setting_id`),
  CONSTRAINT `fk_class_subject1` FOREIGN KEY (`class_subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_trainee`
--

DROP TABLE IF EXISTS `class_trainee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_trainee` (
  `class_id` int NOT NULL,
  `trainee_id` int NOT NULL,
  PRIMARY KEY (`class_id`,`trainee_id`),
  KEY `fk_class_trainee_account1_idx` (`trainee_id`),
  CONSTRAINT `fk_class_trainee_account1` FOREIGN KEY (`trainee_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `fk_class_trainee_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_trainee`
--

LOCK TABLES `class_trainee` WRITE;
/*!40000 ALTER TABLE `class_trainee` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_trainee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimension`
--

DROP TABLE IF EXISTS `dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimension` (
  `dimension_id` int NOT NULL AUTO_INCREMENT,
  `dimension_type` varchar(100) NOT NULL,
  `dimension_name` varchar(255) NOT NULL,
  `dimension_status` bit(1) DEFAULT b'1',
  `dimension_subject_id` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_by` int DEFAULT NULL,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dimension_id`),
  UNIQUE KEY `dimension_name_UNIQUE` (`dimension_name`),
  KEY `fk_dimension_subject1_idx` (`dimension_subject_id`),
  CONSTRAINT `fk_dimension_subject1` FOREIGN KEY (`dimension_subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimension`
--

LOCK TABLES `dimension` WRITE;
/*!40000 ALTER TABLE `dimension` DISABLE KEYS */;
INSERT INTO `dimension` VALUES (1,'Skill','Listening',_binary '',1,7,'2023-10-14 22:10:36',7,'2023-10-14 22:10:36'),(2,'Skill','Reading',_binary '',1,7,'2023-10-14 22:10:36',7,'2023-10-14 22:10:36'),(3,'Domain','General Japanese',_binary '',1,7,'2023-10-14 22:10:36',7,'2023-10-14 22:10:36'),(4,'Skill','Linked List',_binary '',2,9,'2023-10-14 22:10:36',9,'2023-10-14 22:10:36'),(5,'Skill','Tree',_binary '',2,9,'2023-10-14 22:10:36',9,'2023-10-14 22:10:36'),(6,'Skill','Graph',_binary '',2,9,'2023-10-14 22:10:36',9,'2023-10-14 22:10:36'),(7,'Tech Domain','Java Web',_binary '',8,9,'2023-10-14 22:10:36',9,'2023-10-14 22:10:36'),(8,'Skill','Jsp&Servlet',_binary '',8,9,'2023-10-14 22:10:36',9,'2023-10-14 22:10:36');
/*!40000 ALTER TABLE `dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_lesson`
--

DROP TABLE IF EXISTS `extra_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extra_lesson` (
  `class_id` int NOT NULL,
  `lesson_id` int NOT NULL,
  PRIMARY KEY (`class_id`,`lesson_id`),
  KEY `fk_extra_lesson_lesson1_idx` (`lesson_id`),
  CONSTRAINT `fk_extra_lesson_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `fk_extra_lesson_lesson1` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_lesson`
--

LOCK TABLES `extra_lesson` WRITE;
/*!40000 ALTER TABLE `extra_lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `extra_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson` (
  `lesson_id` int NOT NULL AUTO_INCREMENT,
  `lesson_type` varchar(100) DEFAULT 'Video',
  `lesson_title` varchar(255) DEFAULT NULL,
  `lesson_description` text NOT NULL,
  `lesson_video_link` varchar(1000) DEFAULT NULL,
  `lesson_display_order` int DEFAULT NULL,
  `lesson_status` bit(1) DEFAULT b'1',
  `lesson_chapter_id` int NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_by` int DEFAULT NULL,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`lesson_id`),
  KEY `fk_lesson_chapter1_idx` (`lesson_chapter_id`),
  CONSTRAINT `fk_lesson_chapter1` FOREIGN KEY (`lesson_chapter_id`) REFERENCES `chapter` (`chapter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (1,'Video','vestibulum massa rutrum magna. Cras convallis','ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci','https://youtube.com/fr?search=1',1,_binary '',1,7,'2023-10-14 23:01:19',7,'2023-10-14 23:01:19'),(2,'Video','tempor bibendum. Donec felis','netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer','https://youtube.com/group/9?q=11',2,_binary '',1,7,'2023-10-14 23:01:19',7,'2023-10-14 23:01:19'),(3,'Video','ut, pharetra sed, hendrerit','magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor','https://youtube.com/en-us?k=0',3,_binary '',1,7,'2023-10-14 23:01:19',7,'2023-10-14 23:01:19'),(4,'Video','augue ut lacus. Nulla','sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel','https://youtube.com/user/110?client=g',4,_binary '',1,7,'2023-10-14 23:01:19',7,'2023-10-14 23:01:19'),(5,'Video','sed, hendrerit a, arcu. Sed et','sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque','https://youtube.com/sub?g=1',5,_binary '',1,7,'2023-10-14 23:01:19',7,'2023-10-14 23:01:19'),(6,'Video','diam nunc, ullamcorper eu, euismod','faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis,','https://youtube.com/en-ca?str=se',1,_binary '',2,7,'2023-10-14 23:02:14',7,'2023-10-14 23:02:14'),(7,'Video','nulla at sem molestie','amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et','https://youtube.com/en-ca?ab=441&aad=2',2,_binary '',2,7,'2023-10-14 23:02:14',7,'2023-10-14 23:02:14'),(8,'Video','tellus justo sit amet nulla.','tellus eu augue porttitor interdum. Sed auctor odio a purus.','https://youtube.com/one?search=1&q=de',1,_binary '',3,7,'2023-10-14 23:03:46',7,'2023-10-14 23:03:46'),(9,'Video','purus mauris a nunc. In at','dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes,','https://youtube.com/sub?gi=100',2,_binary '',3,7,'2023-10-14 23:03:46',7,'2023-10-14 23:03:46'),(10,'Video','torquent per conubia nostra, per','mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod','https://youtube.com/user/110?search=1&q=de',1,_binary '',4,7,'2023-10-14 23:04:11',7,'2023-10-14 23:04:11'),(11,'Video','nonummy. Fusce fermentum fermentum arcu. Vestibulum','quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla.','https://youtube.com/en-ca?q=0',1,_binary '',6,9,'2023-10-14 23:08:04',9,'2023-10-14 23:08:04'),(12,'Video','sagittis semper. Nam tempor diam dictum','Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum purus, accumsan','https://youtube.com/sub?page=1&offset=1',2,_binary '',6,9,'2023-10-14 23:08:04',9,'2023-10-14 23:08:04'),(13,'Quiz','Lesson 22: Test Quiz','nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt.','https://youtube.com/user/110?q=0',3,_binary '',6,9,'2023-10-14 23:08:04',9,'2023-10-18 00:20:16'),(14,'Video','Lesson 23: Test Something','Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus','https://youtube.com/group/9?ab=441&aad=2',1,_binary '',7,9,'2023-10-14 23:08:31',9,'2023-10-18 00:18:53'),(15,'Video','erat nonummy ultricies ornare, elit elit','diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit','https://youtube.com/en-ca?str=se',2,_binary '',7,9,'2023-10-14 23:08:31',9,'2023-10-14 23:08:31'),(16,'Video','ad litora torquent per','Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna.','https://youtube.com/user/110?q=0',1,_binary '',8,9,'2023-10-14 23:08:55',9,'2023-10-14 23:08:55'),(17,'Video','cursus et, eros. Proin ultrices.','sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante,','https://youtube.com/site?client=g',2,_binary '',8,9,'2023-10-14 23:08:55',9,'2023-10-14 23:08:55'),(18,'Video','id enim. Curabitur massa.','natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer','https://youtube.com/sub?q=11',3,_binary '',8,9,'2023-10-14 23:08:55',9,'2023-10-14 23:08:55'),(19,'Video','nunc. Quisque ornare tortor at','venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia','https://youtube.com/en-ca?g=1',1,_binary '',9,9,'2023-10-14 23:09:24',9,'2023-10-14 23:09:24'),(20,'Video','dolor elit, pellentesque a, facilisis','nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt,','https://youtube.com/fr?str=se',1,_binary '',11,9,'2023-10-14 23:10:10',9,'2023-10-14 23:10:10'),(21,'Video','nec, eleifend non, dapibus rutrum, justo.','sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque','https://youtube.com/sub?q=0',2,_binary '',11,9,'2023-10-14 23:10:10',9,'2023-10-14 23:10:10'),(22,'Video','dolor elit, pellentesque a, facilisis','nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt,','https://youtube.com/fr?str=se',1,_binary '',12,9,'2023-10-14 23:10:54',9,'2023-10-14 23:10:54'),(23,'Video','Integer tincidunt aliquam arcu. Aliquam','dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper','https://youtube.com/sub?g=1',1,_binary '',13,9,'2023-10-14 23:11:11',9,'2023-10-14 23:11:11'),(24,'Video','risus a ultricies adipiscing, enim','diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer','https://youtube.com/en-us?p=8',2,_binary '',13,9,'2023-10-14 23:11:11',9,'2023-10-14 23:11:11'),(25,'Video','tortor at risus. Nunc ac','risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean','https://youtube.com/sub?search=1&q=de',1,_binary '',14,9,'2023-10-14 23:11:28',9,'2023-10-14 23:11:28'),(26,'Video','facilisis, magna tellus faucibus','tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium','https://youtube.com/user/110?g=1',1,_binary '',15,9,'2023-10-14 23:12:36',9,'2023-10-14 23:12:36'),(27,'Video','fermentum metus. Aenean sed pede','Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat','https://youtube.com/settings?q=test',2,_binary '',15,9,'2023-10-14 23:12:36',9,'2023-10-14 23:12:36'),(28,'Video','enim. Nunc ut erat. Sed','egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a','https://youtube.com/sub/cars?gi=100',1,_binary '',16,9,'2023-10-14 23:12:36',9,'2023-10-14 23:12:36'),(29,'Video','a, enim. Suspendisse aliquet, sem','quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor.','https://youtube.com/sub?q=11',1,_binary '',17,9,'2023-10-14 23:12:36',9,'2023-10-14 23:12:36'),(30,'Video','bibendum sed, est. Nunc laoreet lectus','Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem.','https://youtube.com/fr?str=se',2,_binary '',17,9,'2023-10-14 23:12:36',9,'2023-10-14 23:12:36'),(31,'Video','Test Lesson 1','','youtube.com/test1',NULL,_binary '',7,9,'2023-10-17 22:30:28',9,'2023-10-17 22:30:28'),(32,'Quiz','Test Lesson 2','','',NULL,_binary '',15,9,'2023-10-17 22:55:38',9,'2023-10-17 22:55:38');
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `question_detail` varchar(1000) NOT NULL,
  `question_status` bit(1) DEFAULT b'1',
  `question_lesson_id` int NOT NULL,
  `question_chapter_id` int NOT NULL,
  `question_subject_id` int unsigned NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_by` int DEFAULT NULL,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`question_id`),
  KEY `fk_question_lesson1_idx` (`question_lesson_id`),
  KEY `fk_question_chapter1_idx` (`question_chapter_id`),
  KEY `fk_question_subject1_idx` (`question_subject_id`),
  CONSTRAINT `fk_question_chapter1` FOREIGN KEY (`question_chapter_id`) REFERENCES `chapter` (`chapter_id`),
  CONSTRAINT `fk_question_lesson1` FOREIGN KEY (`question_lesson_id`) REFERENCES `lesson` (`lesson_id`),
  CONSTRAINT `fk_question_subject1` FOREIGN KEY (`question_subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'or one who avoids a pain that produces no resultant pleasure? On the other hand, we',_binary '',4,1,1,7,'2023-10-14 23:29:12',7,'2023-10-14 23:29:12'),(2,'except to obtain some advantage from it? But who has any right to find fault',_binary '',1,1,1,7,'2023-10-14 23:29:12',7,'2023-10-14 23:29:12'),(3,'explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or',_binary '',4,1,1,7,'2023-10-14 23:29:12',7,'2023-10-14 23:29:12'),(4,'to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will',_binary '',5,1,1,7,'2023-10-14 23:29:12',7,'2023-10-14 23:29:12'),(5,'trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But',_binary '',2,1,1,7,'2023-10-14 23:29:12',7,'2023-10-14 23:29:12'),(6,'or avoids pleasure itself, because it is pleasure, but because those',_binary '',7,2,1,7,'2023-10-14 23:29:12',7,'2023-10-14 23:29:12'),(7,'pain, but because occasionally circumstances occur in which toil and pain can procure him some',_binary '',7,2,1,7,'2023-10-14 23:29:12',7,'2023-10-14 23:29:12'),(8,'it is pleasure, but because those who do not know how to pursue pleasure rationally encounter',_binary '',7,2,1,7,'2023-10-14 23:29:12',7,'2023-10-14 23:29:12'),(9,'will give you a complete account of the system, and expound the actual teachings of the',_binary '',9,3,1,7,'2023-10-14 23:29:12',7,'2023-10-14 23:29:12'),(10,'that produces no resultant pleasure? On the other hand, we',_binary '',8,3,1,7,'2023-10-14 23:29:12',7,'2023-10-14 23:29:12'),(11,'because it is pleasure, but because those who do not know how',_binary '',10,4,1,7,'2023-10-14 23:29:12',7,'2023-10-14 23:29:12'),(12,'To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from',_binary '',10,4,1,7,'2023-10-14 23:29:12',7,'2023-10-14 23:29:12'),(13,'who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances',_binary '',13,6,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(14,'it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely',_binary '',12,6,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(15,'but because occasionally circumstances occur in which toil and pain can',_binary '',13,6,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(16,'truth, the master-builder of human happiness. No one rejects, dislikes, or avoids',_binary '',12,6,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(17,'painful. Nor again is there anyone who loves or pursues or desires',_binary '',12,6,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(18,'occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example,',_binary '',14,7,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(19,'him some great pleasure. To take a trivial example, which',_binary '',14,7,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(20,'it is pain, but because occasionally circumstances occur in which toil and pain',_binary '',14,7,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(21,'of us ever undertakes laborious physical exercise, except to obtain some',_binary '',17,8,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(22,'or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally',_binary '',18,8,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(23,'one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how',_binary '',17,8,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(24,'right to find fault with a man who chooses to enjoy a pleasure that',_binary '',17,8,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(25,'how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete',_binary '',17,8,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(26,'encounter consequences that are extremely painful. Nor again is there anyone who loves or',_binary '',21,11,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(27,'occasionally circumstances occur in which toil and pain can',_binary '',21,11,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(28,'fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one',_binary '',20,11,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(29,'which toil and pain can procure him some great pleasure. To take a trivial',_binary '',22,12,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(30,'no annoying consequences, or one who avoids a pain',_binary '',22,12,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(31,'or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in',_binary '',24,13,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(32,'encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to',_binary '',24,13,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(33,'undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right',_binary '',23,13,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(34,'advantage from it? But who has any right',_binary '',24,13,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(35,'anyone who loves or pursues or desires to obtain pain of itself, because it',_binary '',26,15,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(36,'human happiness. No one rejects, dislikes, or avoids pleasure itself, because',_binary '',26,15,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(37,'teachings of the great explorer of the truth, the master-builder of human',_binary '',27,15,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(38,'it? But who has any right to find fault with a',_binary '',26,15,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12'),(39,'physical exercise, except to obtain some advantage from it? But who has any right',_binary '',26,15,1,9,'2023-10-14 23:29:12',9,'2023-10-14 23:29:12');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_dimension`
--

DROP TABLE IF EXISTS `question_dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_dimension` (
  `question_id` int NOT NULL,
  `dimension_id` int NOT NULL,
  PRIMARY KEY (`question_id`,`dimension_id`),
  KEY `fk_question_dimension_dimension1_idx` (`dimension_id`),
  CONSTRAINT `fk_question_dimension_dimension1` FOREIGN KEY (`dimension_id`) REFERENCES `dimension` (`dimension_id`),
  CONSTRAINT `fk_question_dimension_question1` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_dimension`
--

LOCK TABLES `question_dimension` WRITE;
/*!40000 ALTER TABLE `question_dimension` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz` (
  `quiz_id` int NOT NULL AUTO_INCREMENT,
  `quiz_title` varchar(255) NOT NULL,
  `quiz_type` bit(1) DEFAULT b'0',
  `quiz_subject_id` int unsigned NOT NULL,
  `quiz_chapter_id` int NOT NULL,
  `quiz_status` bit(1) DEFAULT b'1',
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_by` int DEFAULT NULL,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`quiz_id`),
  KEY `fk_quiz_subject1_idx` (`quiz_subject_id`),
  KEY `fk_quiz_chapter1_idx` (`quiz_chapter_id`),
  CONSTRAINT `fk_quiz_chapter1` FOREIGN KEY (`quiz_chapter_id`) REFERENCES `chapter` (`chapter_id`),
  CONSTRAINT `fk_quiz_subject1` FOREIGN KEY (`quiz_subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES (1,'CSD Quiz 001',_binary '',2,8,_binary '',9,'2023-10-15 00:05:49',9,'2023-10-17 12:01:07'),(2,'PRJ301 General Quiz - Quiz 002',_binary '\0',8,15,_binary '',9,'2023-10-17 11:55:17',9,'2023-10-17 15:15:10'),(3,'Quiz Test 003',_binary '',2,9,_binary '',9,'2023-10-18 02:00:20',9,'2023-10-18 02:00:44');
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_config`
--

DROP TABLE IF EXISTS `quiz_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_config` (
  `config_id` int NOT NULL AUTO_INCREMENT,
  `config_dimension_id` int NOT NULL,
  `config_num_of_question` int DEFAULT '1',
  `config_chapter_id` int NOT NULL,
  `config_quiz_id` int NOT NULL,
  PRIMARY KEY (`config_id`),
  KEY `fk_quiz_config_dimension1_idx` (`config_dimension_id`),
  KEY `fk_quiz_config_chapter1_idx` (`config_chapter_id`),
  KEY `fk_quiz_config_quiz1_idx` (`config_quiz_id`),
  CONSTRAINT `fk_quiz_config_chapter1` FOREIGN KEY (`config_chapter_id`) REFERENCES `chapter` (`chapter_id`),
  CONSTRAINT `fk_quiz_config_dimension1` FOREIGN KEY (`config_dimension_id`) REFERENCES `dimension` (`dimension_id`),
  CONSTRAINT `fk_quiz_config_quiz1` FOREIGN KEY (`config_quiz_id`) REFERENCES `quiz` (`quiz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_config`
--

LOCK TABLES `quiz_config` WRITE;
/*!40000 ALTER TABLE `quiz_config` DISABLE KEYS */;
INSERT INTO `quiz_config` VALUES (1,5,10,6,1),(4,4,5,9,1),(5,5,10,8,3),(6,4,10,10,3);
/*!40000 ALTER TABLE `quiz_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_lesson`
--

DROP TABLE IF EXISTS `quiz_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_lesson` (
  `lesson_id` int NOT NULL,
  `quiz_id` int NOT NULL,
  `quizlesson_duration` int DEFAULT NULL,
  `quizlesson_max_attempt` int DEFAULT NULL,
  `quizlesson_pass_value` int DEFAULT '0',
  PRIMARY KEY (`lesson_id`,`quiz_id`),
  KEY `fk_quiz_lesson_quiz1_idx` (`quiz_id`),
  CONSTRAINT `fk_quiz_lesson_lesson1` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`),
  CONSTRAINT `fk_quiz_lesson_quiz1` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_lesson`
--

LOCK TABLES `quiz_lesson` WRITE;
/*!40000 ALTER TABLE `quiz_lesson` DISABLE KEYS */;
INSERT INTO `quiz_lesson` VALUES (32,2,60,1,90);
/*!40000 ALTER TABLE `quiz_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_question`
--

DROP TABLE IF EXISTS `quiz_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_question` (
  `quiz_id` int NOT NULL,
  `question_id` int NOT NULL,
  PRIMARY KEY (`quiz_id`,`question_id`),
  KEY `fk_quiz_question_question1_idx` (`question_id`),
  CONSTRAINT `fk_quiz_question_question1` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`),
  CONSTRAINT `fk_quiz_question_quiz1` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_question`
--

LOCK TABLES `quiz_question` WRITE;
/*!40000 ALTER TABLE `quiz_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_question` ENABLE KEYS */;
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
  `setting_display_order` int DEFAULT NULL,
  `setting_status` bit(1) DEFAULT b'1',
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_by` int DEFAULT NULL,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,1,'Admin',4,_binary '',0,'2023-09-25 20:45:05',1,'2023-10-10 10:54:45'),(2,1,'Manager',3,_binary '',0,'2023-09-25 20:45:05',0,'2023-10-10 10:39:08'),(3,1,'Teacher',2,_binary '',0,'2023-09-25 20:45:05',0,'2023-10-10 10:39:08'),(4,1,'Student',1,_binary '',0,'2023-09-25 20:45:05',0,'2023-09-25 20:45:05'),(5,2,'SPRING-2023',1,_binary '',1,'2023-09-25 21:18:49',1,'2023-09-25 21:18:49'),(6,3,'gmail.com',1,_binary '',1,'2023-09-25 21:18:49',1,'2023-09-25 21:18:49'),(7,3,'fpt.edu.vn',1,_binary '',1,'2023-09-25 21:18:49',1,'2023-09-25 21:19:16'),(8,2,'SPRING-2022',1,_binary '',1,'2023-09-25 22:05:41',1,'2023-09-29 16:51:00'),(9,2,'SUMMER-2022',1,_binary '',1,'2023-09-25 22:05:51',1,'2023-09-29 16:51:02'),(10,2,'FALL-2022',1,_binary '\0',1,'2023-09-25 22:05:58',1,'2023-09-25 22:06:45'),(11,2,'SUMMER-2023',1,_binary '\0',1,'2023-09-25 22:06:18',1,'2023-09-25 22:06:44'),(12,2,'FALL-2023',1,_binary '',1,'2023-09-25 22:06:29',1,'2023-09-25 22:06:29'),(13,3,'ms.edu.vn',1,_binary '\0',1,'2023-09-25 22:07:00',1,'2023-09-28 15:56:52'),(14,2,'SPRING-2024',1,_binary '\0',1,'2023-09-25 22:07:09',1,'2023-09-25 22:07:28'),(15,3,'neu.edu.vn',1,_binary '\0',1,'2023-09-25 22:07:41',1,'2023-09-28 15:56:57'),(16,3,'vl.edu.vn',1,_binary '\0',1,'2023-09-28 16:01:57',1,'2023-09-29 16:51:07');
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
INSERT INTO `subject` VALUES (1,'Elementary Japanese 1-A1.1','JPD113',7,_binary '',1,'2023-09-25 22:03:24',7,'2023-10-10 11:21:02'),(2,'Data Structures and Algorithms','CSD201',9,_binary '',2,'2023-09-25 22:03:24',2,'2023-09-25 22:03:24'),(3,'Introduction to Databases','DBI202',7,_binary '',4,'2023-09-25 22:03:24',1,'2023-09-29 16:50:55'),(4,'OOP with Java Lab','LAB211',13,_binary '\0',5,'2023-09-25 22:03:24',1,'2023-10-16 13:12:03'),(5,'Statistics and Probability','MAS291',14,_binary '',2,'2023-09-25 22:03:24',2,'2023-09-25 22:03:24'),(6,'Elementary Japanese 1-A1.2','JPD123',17,_binary '\0',1,'2023-09-25 22:03:24',1,'2023-09-25 22:03:59'),(7,'Internet of Things','IOT102',7,_binary '',1,'2023-09-25 22:03:24',1,'2023-09-25 22:03:24'),(8,'Java Web Application Development','PRJ301',9,_binary '',2,'2023-09-25 22:03:24',1,'2023-10-16 13:12:02'),(9,'Application development project','SWP391',20,_binary '',1,'2023-09-25 22:03:24',1,'2023-09-25 22:03:24'),(10,'Software Requirement','SWR302',24,_binary '\0',2,'2023-09-25 22:03:24',1,'2023-09-25 22:04:03'),(11,'Software Testing','SWT301',22,_binary '',4,'2023-09-25 22:03:24',4,'2023-09-25 22:03:24'),(12,'Basic Cross-Platform Application Programming With .NET','PRN211',22,_binary '\0',3,'2023-09-25 22:03:24',1,'2023-09-25 22:04:05'),(13,'SW Architecture and Design','SWD392',13,_binary '',3,'2023-09-25 22:03:24',3,'2023-09-25 22:03:24'),(14,'Mobile Programming','PRM392',13,_binary '\0',3,'2023-09-25 22:03:24',1,'2023-09-25 22:04:04'),(15,'Experiential Entrepreneurship 2','EXE201',14,_binary '',2,'2023-09-25 22:03:24',2,'2023-09-25 22:03:24');
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

-- Dump completed on 2023-10-18  2:13:02
