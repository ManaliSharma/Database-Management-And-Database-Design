-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: 127.0.0.1    Database: Hospital_Management
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `bill_medicine`
--

DROP TABLE IF EXISTS `bill_medicine`;
/*!50001 DROP VIEW IF EXISTS `bill_medicine`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `bill_medicine` AS SELECT 
 1 AS `Medicine_Name`,
 1 AS `Quantity`,
 1 AS `Price`,
 1 AS `Medicine_ID`,
 1 AS `Bill`,
 1 AS `Bill_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Bill_table`
--

DROP TABLE IF EXISTS `Bill_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Bill_table` (
  `Bill_ID` int(11) NOT NULL,
  `Bill` int(11) DEFAULT NULL,
  `Patient_table_Patient_ID` int(11) NOT NULL,
  PRIMARY KEY (`Bill_ID`),
  KEY `fk_Bill_table_Patient_table` (`Patient_table_Patient_ID`),
  CONSTRAINT `fk_Bill_table_Patient_table` FOREIGN KEY (`Patient_table_Patient_ID`) REFERENCES `patient_table` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bill_table`
--

LOCK TABLES `Bill_table` WRITE;
/*!40000 ALTER TABLE `Bill_table` DISABLE KEYS */;
INSERT INTO `Bill_table` VALUES (332,1000,1001),(334,1080,1019),(342,900,1011),(345,2456,1008),(347,450,1009),(348,3456,1005),(349,5,1016),(351,750,1019),(353,9000,1001),(356,7,1014),(358,600,1017),(359,8000,1011),(367,90,1004),(370,5540,1004),(378,4,1016),(379,800,1005);
/*!40000 ALTER TABLE `Bill_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Diagnosis_table`
--

DROP TABLE IF EXISTS `Diagnosis_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Diagnosis_table` (
  `Diagnosis_ID` int(11) NOT NULL,
  PRIMARY KEY (`Diagnosis_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Diagnosis_table`
--

LOCK TABLES `Diagnosis_table` WRITE;
/*!40000 ALTER TABLE `Diagnosis_table` DISABLE KEYS */;
INSERT INTO `Diagnosis_table` VALUES (2000),(3000),(3001),(3002),(3010),(3012),(3100),(3101),(3102),(3103),(3450),(4501),(4503),(5000),(5010),(5646),(5900),(6543),(6700),(7800),(7896),(8001),(9000),(89090),(89092);
/*!40000 ALTER TABLE `Diagnosis_table` ENABLE KEYS */;
UNLOCK TABLES;
--
-- WARNING: old server version. The following dump may be incomplete.
--
DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `DiagnosisAdd` AFTER INSERT ON `Diagnosis_table` FOR EACH ROW BEGIN

DECLARE newPatient_table_Patient_ID INT;
DECLARE newDoctor_table_Doctor_ID INT;
DECLARE newDiagnosis_ID INT;
SET @newDiagnosis_ID=NEW.Diagnosis_ID;
SET @newPatient_table_Patient_ID=1067;
SET @newDoctor_table_Doctor_ID=43;
IF EXISTS (SELECT * FROM Diagnosis_table WHERE Diagnosis_ID=@newDiagnosis_ID)
THEN
INSERT INTO  OrderServices_table VALUES (@newDiagnosis_ID, @newPatient_table_Patient_ID,@newDoctor_table_Doctor_ID);

END IF;
END */;;
DELIMITER ;

--
-- Table structure for table `Diagnosis_table_has_Patient_table`
--

DROP TABLE IF EXISTS `Diagnosis_table_has_Patient_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Diagnosis_table_has_Patient_table` (
  `Diagnosis_table_Diagnosis_ID` int(11) NOT NULL,
  `Patient_table_Patient_ID` int(11) NOT NULL,
  `Patient_table_Doctor_table_Doctor_ID` int(11) NOT NULL,
  PRIMARY KEY (`Diagnosis_table_Diagnosis_ID`),
  KEY `fk_Diagnosis_table_has_Patient_table_Patient_table` (`Patient_table_Patient_ID`),
  CONSTRAINT `fk_Diagnosis_table_has_Patient_table_Diagnosis_table` FOREIGN KEY (`Diagnosis_table_Diagnosis_ID`) REFERENCES `diagnosis_table` (`diagnosis_id`),
  CONSTRAINT `fk_Diagnosis_table_has_Patient_table_Patient_table` FOREIGN KEY (`Patient_table_Patient_ID`) REFERENCES `patient_table` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Diagnosis_table_has_Patient_table`
--

LOCK TABLES `Diagnosis_table_has_Patient_table` WRITE;
/*!40000 ALTER TABLE `Diagnosis_table_has_Patient_table` DISABLE KEYS */;
INSERT INTO `Diagnosis_table_has_Patient_table` VALUES (2000,1016,24),(3101,1067,43),(3102,1067,43),(4503,1001,22),(5010,1003,30),(5900,1067,43),(6543,1008,26),(7800,1014,28),(7896,1011,32),(8001,1005,31);
/*!40000 ALTER TABLE `Diagnosis_table_has_Patient_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `doctor_diagnosis_patient`
--

DROP TABLE IF EXISTS `doctor_diagnosis_patient`;
/*!50001 DROP VIEW IF EXISTS `doctor_diagnosis_patient`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `doctor_diagnosis_patient` AS SELECT 
 1 AS `Patient_table_Patient_ID`,
 1 AS `Doctor_table_Doctor_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Doctor_table`
--

DROP TABLE IF EXISTS `Doctor_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Doctor_table` (
  `Doctor_ID` int(11) NOT NULL,
  `Doctor_Name` varchar(45) DEFAULT NULL,
  `Doctor_Qualification` varchar(45) DEFAULT NULL,
  `Patient_table_Patient_ID` int(11) NOT NULL,
  PRIMARY KEY (`Doctor_ID`),
  KEY `fk_Doctor_table_Patient_table` (`Patient_table_Patient_ID`),
  CONSTRAINT `fk_Doctor_table_Patient_table` FOREIGN KEY (`Patient_table_Patient_ID`) REFERENCES `mydb`.`patient_table` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor_table`
--

LOCK TABLES `Doctor_table` WRITE;
/*!40000 ALTER TABLE `Doctor_table` DISABLE KEYS */;
INSERT INTO `Doctor_table` VALUES (22,'Manju Sharma','PAED',1001),(23,'Anil Ambani','GYN',1020),(24,'Jaavena Hussain','CARD',1016),(25,'Akshay Pareek','PHY',1012),(26,'Sonam Kapoor','SUR',1008),(27,'Dhanush Kotak','PHY',1006),(28,'Yash Bhargav','ORTH',1014),(29,'Shefali Sharma','DEN',1015),(30,'Richa Sharma','DEN',1003),(31,'Jay Malhotra','SUR',1005),(32,'Humaid Bhavan','PSY',1011);
/*!40000 ALTER TABLE `Doctor_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor_table_has_Diagnosis_table`
--

DROP TABLE IF EXISTS `Doctor_table_has_Diagnosis_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Doctor_table_has_Diagnosis_table` (
  `Doctor_table_Doctor_ID` int(11) NOT NULL,
  `Diagnosis_table_Diagnosis_ID` int(11) NOT NULL,
  KEY `fk_Doctor_table_has_Diagnosis_table_Doctor_table` (`Doctor_table_Doctor_ID`),
  KEY `fk_Doctor_table_has_Diagnosis_table_Diagnosis_table` (`Diagnosis_table_Diagnosis_ID`),
  CONSTRAINT `fk_Doctor_table_has_Diagnosis_table_Diagnosis_table` FOREIGN KEY (`Diagnosis_table_Diagnosis_ID`) REFERENCES `diagnosis_table` (`diagnosis_id`),
  CONSTRAINT `fk_Doctor_table_has_Diagnosis_table_Doctor_table` FOREIGN KEY (`Doctor_table_Doctor_ID`) REFERENCES `doctor_table` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor_table_has_Diagnosis_table`
--

LOCK TABLES `Doctor_table_has_Diagnosis_table` WRITE;
/*!40000 ALTER TABLE `Doctor_table_has_Diagnosis_table` DISABLE KEYS */;
INSERT INTO `Doctor_table_has_Diagnosis_table` VALUES (22,4503),(32,6700),(32,7800),(30,8001),(25,9000),(27,7896),(23,3450),(23,5000),(24,5001),(32,5646),(22,6543),(26,4501),(22,4503),(32,6700),(32,7800),(30,8001),(25,9000),(27,7896),(23,3450),(23,5000),(24,5001),(32,5646),(22,6543),(26,4501);
/*!40000 ALTER TABLE `Doctor_table_has_Diagnosis_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HospitalStaff_table`
--

DROP TABLE IF EXISTS `HospitalStaff_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `HospitalStaff_table` (
  `HS_ID` int(11) NOT NULL,
  `HS_Name` varchar(45) DEFAULT NULL,
  `Room_table_Room_ID` int(11) NOT NULL,
  PRIMARY KEY (`HS_ID`),
  KEY `fk_HospitalStaff_table_Room_table` (`Room_table_Room_ID`),
  CONSTRAINT `fk_HospitalStaff_table_Room_table` FOREIGN KEY (`Room_table_Room_ID`) REFERENCES `room_table` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HospitalStaff_table`
--

LOCK TABLES `HospitalStaff_table` WRITE;
/*!40000 ALTER TABLE `HospitalStaff_table` DISABLE KEYS */;
INSERT INTO `HospitalStaff_table` VALUES (5001,'SUSHMITA JOSHI',202),(5002,'MAYANK DAVE',201),(5003,'SHEFALI SHAH',203),(5004,'DIKSHA BHARGAV',204),(5005,'KIRAN DODEJA',205),(5006,'ADITYA SHARMA',202),(5007,'RUSHABH SINGH',207);
/*!40000 ALTER TABLE `HospitalStaff_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderServices_table`
--

DROP TABLE IF EXISTS `OrderServices_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `OrderServices_table` (
  `order_ID` int(11) NOT NULL,
  `Patient_table_Patient_ID` int(11) NOT NULL,
  `Doctor_table_Doctor_ID` int(11) NOT NULL,
  PRIMARY KEY (`order_ID`),
  KEY `fk_OrderServices_table_Patient_table` (`Patient_table_Patient_ID`),
  KEY `fk_OrderServices_table_Doctor_table` (`Doctor_table_Doctor_ID`),
  CONSTRAINT `fk_OrderServices_table_Doctor_table` FOREIGN KEY (`Doctor_table_Doctor_ID`) REFERENCES `doctor_table` (`doctor_id`),
  CONSTRAINT `fk_OrderServices_table_Patient_table` FOREIGN KEY (`Patient_table_Patient_ID`) REFERENCES `patient_table` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderServices_table`
--

LOCK TABLES `OrderServices_table` WRITE;
/*!40000 ALTER TABLE `OrderServices_table` DISABLE KEYS */;
INSERT INTO `OrderServices_table` VALUES (3103,1067,43),(4001,1005,22),(4002,1017,32),(4003,1001,24),(4004,1016,26),(4005,1004,28),(4006,1012,30),(4007,1013,31),(4008,1009,22),(4009,1005,30),(4010,1010,26),(5900,1067,43),(89090,1067,43),(89092,1067,43);
/*!40000 ALTER TABLE `OrderServices_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `patient_gender`
--

DROP TABLE IF EXISTS `patient_gender`;
/*!50001 DROP VIEW IF EXISTS `patient_gender`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `patient_gender` AS SELECT 
 1 AS `Patient_ID`,
 1 AS `Patient_Name`,
 1 AS `Gender`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Patient_table`
--

DROP TABLE IF EXISTS `Patient_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Patient_table` (
  `Patient_ID` int(11) NOT NULL,
  `Patient_Name` varchar(45) DEFAULT NULL,
  `Gender` varchar(45) DEFAULT NULL,
  `Date_Admitted` date DEFAULT NULL,
  `Date_Released` date DEFAULT NULL,
  `Receptionist_table_Receptionist_ID` int(11) NOT NULL,
  PRIMARY KEY (`Patient_ID`),
  KEY `fk_Patient_table_Receptionist_table` (`Receptionist_table_Receptionist_ID`),
  KEY `INDEX_Patient` (`Patient_ID`),
  CONSTRAINT `fk_Patient_table_Receptionist_table` FOREIGN KEY (`Receptionist_table_Receptionist_ID`) REFERENCES `receptionist_table` (`receptionist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient_table`
--

LOCK TABLES `Patient_table` WRITE;
/*!40000 ALTER TABLE `Patient_table` DISABLE KEYS */;
INSERT INTO `Patient_table` VALUES (1001,'Prachi Agarwal','F','2018-10-18','2018-10-20',2),(1002,'Dhanush Chandra','M','2018-10-19','2018-10-21',4),(1004,'Jyoti Goyal','F','2018-10-21','2018-10-21',6),(1005,'Harshad Maheshwari','M','2018-10-19','2018-10-19',8),(1006,'Vishal Shetty','M','2018-10-24','2018-10-25',1),(1007,'Ajay Sharma','M','2018-10-23','2018-10-24',7),(1008,'Frida Pinto','F','2018-10-20','2018-10-20',4),(1009,'Huma Qureshi','F','2018-10-17','2018-10-17',9),(1010,'Siddharth Malhotra','M','2018-10-19','2018-10-23',5),(1011,'Niyant Dave','M','2018-10-23','2018-10-23',3),(1012,'Hardik Sharma','M','2018-10-27','2018-10-29',1),(1013,'Aanchal Agrawal','F','2018-10-26','2018-10-28',2),(1014,'Siddhi Upadhaya','F','2018-10-25','2018-10-27',5),(1015,'Heta Shah','F','2018-10-23','2018-10-23',5),(1016,'Shashank Chahar','M','2018-10-22','2018-10-23',2),(1017,'Arjun Chandra','M','2018-10-28','2018-10-29',7),(1018,'Vinay Jain','M','2018-10-25','2018-12-31',9),(1019,'Palak Patel','F','2018-10-22','2018-12-31',1),(1020,'Riya Rajput','F','2018-10-26','2018-12-31',3),(1048,'VARUN DHAWAN','M','2018-12-11','2018-12-11',2),(2000,'ARV','M','2018-10-12','2018-12-31',2);
/*!40000 ALTER TABLE `Patient_table` ENABLE KEYS */;
UNLOCK TABLES;
--
-- WARNING: old server version. The following dump may be incomplete.
--
DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `roomAvailabilty` AFTER INSERT ON `Patient_table` FOR EACH ROW BEGIN
IF EXISTS (SELECT * FROM Patient_table WHERE Date_Admitted = (CAST(CURDATE() AS DATE)))
THEN
UPDATE Room_table SET Room_table.Patient_table_Patient_ID = NEW.Patient_ID, Room_Status = 'OCCUPIED' WHERE Room_Status = 'VACANT' LIMIT 1;
END IF;
END */;;
DELIMITER ;
--
-- WARNING: old server version. The following dump may be incomplete.
--
DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `removePatient` AFTER DELETE ON `Patient_table` FOR EACH ROW BEGIN

DECLARE newPatient_ID INT;
DECLARE newRoom_ID INT;

SET @newPatient_ID= OLD.Patient_ID;
SET @newRoom_ID = (SELECT Room_ID FROM Room_table WHERE Room_table.Patient_table_Patient_ID = @newPatient_ID);

UPDATE Room_table SET Room_table.Room_Status = 'VACANT',
Patient_table_Patient_ID = null WHERE Room_ID= @newRoom_ID;

DELETE FROM Pharmacy_Medicine_table WHERE Pharmacy_Medicine_table.Patient_table_Patient_ID = @newPatient_ID;

DELETE FROM Bill_table WHERE Bill_table.Patient_table_Patient_ID = @newPatient_ID;

end */;;
DELIMITER ;
--
-- WARNING: old server version. The following dump may be incomplete.
--
DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `Trigger_removePatient` AFTER DELETE ON `Patient_table` FOR EACH ROW BEGIN

DECLARE newPatient_ID INT;
DECLARE newRoom_ID INT;

SET @newPatient_ID= OLD.Patient_ID;
SET @newRoom_ID = (SELECT Room_ID FROM Room_table WHERE Room_table.Patient_table_Patient_ID = @newPatient_ID);

UPDATE Room_table 
SET Room_table.Room_Status = 'VACANT',
Patient_table_Patient_ID = null 
WHERE Room_ID= @newRoom_ID;

DELETE 
FROM Pharmacy_Medicine_table 
WHERE Pharmacy_Medicine_table.Patient_table_Patient_ID = @newPatient_ID;

DELETE 
FROM Bill_table 
WHERE Bill_table.Patient_table_Patient_ID = @newPatient_ID;

END */;;
DELIMITER ;

--
-- Table structure for table `Patient_Type_table`
--

DROP TABLE IF EXISTS `Patient_Type_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Patient_Type_table` (
  `Patient_Type` varchar(10) NOT NULL,
  `Patient_table_Patient_ID` int(11) NOT NULL,
  `Patient_Type_ID` int(11) NOT NULL,
  PRIMARY KEY (`Patient_Type_ID`,`Patient_Type`),
  KEY `fk_Patient_Type_table_Patient_table` (`Patient_table_Patient_ID`),
  CONSTRAINT `fk_Patient_Type_table_Patient_table` FOREIGN KEY (`Patient_table_Patient_ID`) REFERENCES `patient_table` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient_Type_table`
--

LOCK TABLES `Patient_Type_table` WRITE;
/*!40000 ALTER TABLE `Patient_Type_table` DISABLE KEYS */;
INSERT INTO `Patient_Type_table` VALUES ('IN',1002,350),('OUT',1002,356),('IN',1003,345),('OUT',1007,346),('OUT',1007,349),('OUT',1008,353),('OUT',1015,354),('OUT',1016,351),('IN',1017,348),('IN',1019,355),('IN',1020,347),('IN',1020,352);
/*!40000 ALTER TABLE `Patient_Type_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pharmacy_Medicine_table`
--

DROP TABLE IF EXISTS `Pharmacy_Medicine_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Pharmacy_Medicine_table` (
  `Medicine_Name` varchar(45) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Medicine_ID` int(11) NOT NULL,
  `Patient_table_Patient_ID` int(11) NOT NULL,
  PRIMARY KEY (`Medicine_ID`,`Patient_table_Patient_ID`),
  KEY `fk_Pharmacy_Medicine_table_Patient_table` (`Patient_table_Patient_ID`),
  CONSTRAINT `fk_Pharmacy_Medicine_table_Patient_table` FOREIGN KEY (`Patient_table_Patient_ID`) REFERENCES `patient_table` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pharmacy_Medicine_table`
--

LOCK TABLES `Pharmacy_Medicine_table` WRITE;
/*!40000 ALTER TABLE `Pharmacy_Medicine_table` DISABLE KEYS */;
INSERT INTO `Pharmacy_Medicine_table` VALUES ('AMD',2,240,8001,1002),('AMD',5,340,8001,1005),('BHH',5,500,8004,1012),('AJK',4,300,8010,1005),('BJH',1,100,8030,1017),('HGY',5,500,8045,1013),('CHJ',7,50,8050,1009),('JJJ',3,50,8066,1015),('CGH',6,300,8067,1002),('CGH',6,300,8067,1010),('GHU',4,300,8076,1006),('GHU',2,150,8076,1011),('FGY',1,30,8090,1017);
/*!40000 ALTER TABLE `Pharmacy_Medicine_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `qualification`
--

DROP TABLE IF EXISTS `qualification`;
/*!50001 DROP VIEW IF EXISTS `qualification`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `qualification` AS SELECT 
 1 AS `Doctor_ID`,
 1 AS `Doctor_Name`,
 1 AS `Doctor_Qualification`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Receptionist_table`
--

DROP TABLE IF EXISTS `Receptionist_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Receptionist_table` (
  `Receptionist_ID` int(11) NOT NULL,
  `Receptionist_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Receptionist_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Receptionist_table`
--

LOCK TABLES `Receptionist_table` WRITE;
/*!40000 ALTER TABLE `Receptionist_table` DISABLE KEYS */;
INSERT INTO `Receptionist_table` VALUES (1,'MANALI SHARMA'),(2,'ADITYA AGRAWAL'),(3,'RUSHABH BHAVSAR'),(4,'VIRAJ JANI'),(5,'RUSHABH NISHER'),(6,'ARV POONIA'),(7,'JAY SHAH'),(8,'TARUN MALHOTRA'),(9,'HARDIK SHAH'),(10,'JIGAR HARSH');
/*!40000 ALTER TABLE `Receptionist_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room_table`
--

DROP TABLE IF EXISTS `Room_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Room_table` (
  `Room_ID` int(11) NOT NULL,
  `Room_type` varchar(45) DEFAULT NULL,
  `Room_Status` varchar(45) DEFAULT NULL,
  `Patient_table_Patient_ID` int(11) NOT NULL,
  PRIMARY KEY (`Room_ID`),
  KEY `fk_Room_table_Patient_table` (`Patient_table_Patient_ID`),
  CONSTRAINT `fk_Room_table_Patient_table` FOREIGN KEY (`Patient_table_Patient_ID`) REFERENCES `patient_table` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room_table`
--

LOCK TABLES `Room_table` WRITE;
/*!40000 ALTER TABLE `Room_table` DISABLE KEYS */;
INSERT INTO `Room_table` VALUES (201,'ICU','OCCUPIED',1002),(202,'SDU','OCCUPIED',1048),(203,'ICU','OCCUPIED',1011),(204,'ICU','OCCUPIED',1001),(205,'SDU','OCCUPIED',1016),(206,'ICU','OCCUPIED',1007);
/*!40000 ALTER TABLE `Room_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `room_view`
--

DROP TABLE IF EXISTS `room_view`;
/*!50001 DROP VIEW IF EXISTS `room_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `room_view` AS SELECT 
 1 AS `Room_table_Room_ID`,
 1 AS `HS_ID`,
 1 AS `HS_Name`,
 1 AS `Room_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Treatment_service_table`
--

DROP TABLE IF EXISTS `Treatment_service_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Treatment_service_table` (
  `treatment_ID` int(11) NOT NULL,
  PRIMARY KEY (`treatment_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Treatment_service_table`
--

LOCK TABLES `Treatment_service_table` WRITE;
/*!40000 ALTER TABLE `Treatment_service_table` DISABLE KEYS */;
INSERT INTO `Treatment_service_table` VALUES (90),(91),(92),(93),(94),(95),(96),(97),(98),(99),(100);
/*!40000 ALTER TABLE `Treatment_service_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Treatment_service_table_has_OrderServices_table`
--

DROP TABLE IF EXISTS `Treatment_service_table_has_OrderServices_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Treatment_service_table_has_OrderServices_table` (
  `Treatment_service_table_treatment_ID` int(11) NOT NULL,
  `OrderServices_table_order_ID` int(11) NOT NULL,
  PRIMARY KEY (`Treatment_service_table_treatment_ID`,`OrderServices_table_order_ID`),
  KEY `fk_Treatment_service_table_has_OrderServices_table_OrderServi` (`OrderServices_table_order_ID`),
  CONSTRAINT `fk_Treatment_service_table_has_OrderServices_table_OrderServi` FOREIGN KEY (`OrderServices_table_order_ID`) REFERENCES `mydb`.`orderservices_table` (`order_id`),
  CONSTRAINT `fk_Treatment_service_table_has_OrderServices_table_Treatment_` FOREIGN KEY (`Treatment_service_table_treatment_ID`) REFERENCES `mydb`.`treatment_service_table` (`treatment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Treatment_service_table_has_OrderServices_table`
--

LOCK TABLES `Treatment_service_table_has_OrderServices_table` WRITE;
/*!40000 ALTER TABLE `Treatment_service_table_has_OrderServices_table` DISABLE KEYS */;
INSERT INTO `Treatment_service_table_has_OrderServices_table` VALUES (91,4001),(96,4002),(90,4004),(97,4005),(93,4008),(95,4010);
/*!40000 ALTER TABLE `Treatment_service_table_has_OrderServices_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Hospital_Management'
--

--
-- Dumping routines for database 'Hospital_Management'
--
/*!50003 DROP PROCEDURE IF EXISTS `GENERATE_BILL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GENERATE_BILL`(IN Patient_ID INT)
BEGIN

DECLARE Date_Released date;
DECLARE Quantity int;
DECLARE Price int;

SELECT Patient_table.Date_Released 
INTO @Date_Released 
FROM Patient_table 
WHERE Patient_table.Patient_ID=Patient_ID;

IF (@Date_Released IS NULL)
THEN

UPDATE Patient_table 
SET Patient_table.Date_Released= (cast(CURDATE() as Date))
WHERE Patient_table.Patient_ID= Patient_ID;

SELECT Quantity INTO @Quantity
FROM Pharmacy_Medicine_table
WHERE Pharmacy_Medicine_table.Patient_table_Patient_ID=Patient_ID;

SELECT Price INTO @Price
FROM Pharmacy_Medicine_table
WHERE Pharmacy_Medicine_table.Patient_table_Patient_ID=Patient_ID;

INSERT INTO Bill_table Values (Price,Quantity);

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Patient_Released_Free` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Patient_Released_Free`(IN Patient_ID INT)
BEGIN
DECLARE Date_Released DATE;

SELECT Patient_table.Date_Released 
INTO @Date_Released 
FROM Patient_table 
WHERE Patient_table.Patient_ID=Patient_ID ;

IF (@Date_Released IS NULL)
THEN

UPDATE Patient_table SET Patient_table.Date_Released= ('2018-12-31')
WHERE Patient_table.Patient_ID=Patient_ID;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `bill_medicine`
--

/*!50001 DROP VIEW IF EXISTS `bill_medicine`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bill_medicine` AS select `pharmacy_medicine_table`.`Medicine_Name` AS `Medicine_Name`,`pharmacy_medicine_table`.`Quantity` AS `Quantity`,`pharmacy_medicine_table`.`Price` AS `Price`,`pharmacy_medicine_table`.`Medicine_ID` AS `Medicine_ID`,`bill_table`.`Bill` AS `Bill`,`bill_table`.`Bill_ID` AS `Bill_ID` from (`bill_table` join `pharmacy_medicine_table` on((`pharmacy_medicine_table`.`Patient_table_Patient_ID` = `bill_table`.`Patient_table_Patient_ID`))) where (`bill_table`.`Bill` > 3000) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `doctor_diagnosis_patient`
--

/*!50001 DROP VIEW IF EXISTS `doctor_diagnosis_patient`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `doctor_diagnosis_patient` AS select `diagnosis_table_has_patient_table`.`Patient_table_Patient_ID` AS `Patient_table_Patient_ID`,`doctor_table_has_diagnosis_table`.`Doctor_table_Doctor_ID` AS `Doctor_table_Doctor_ID` from (`diagnosis_table_has_patient_table` join `doctor_table_has_diagnosis_table` on((`doctor_table_has_diagnosis_table`.`Doctor_table_Doctor_ID` = `diagnosis_table_has_patient_table`.`Patient_table_Doctor_table_Doctor_ID`))) group by `diagnosis_table_has_patient_table`.`Patient_table_Patient_ID`,`doctor_table_has_diagnosis_table`.`Doctor_table_Doctor_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patient_gender`
--

/*!50001 DROP VIEW IF EXISTS `patient_gender`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_gender` AS select `patient_table`.`Patient_ID` AS `Patient_ID`,`patient_table`.`Patient_Name` AS `Patient_Name`,`patient_table`.`Gender` AS `Gender` from `patient_table` where (`patient_table`.`Gender` = 'M') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `qualification`
--

/*!50001 DROP VIEW IF EXISTS `qualification`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `qualification` AS select `doctor_table`.`Doctor_ID` AS `Doctor_ID`,`doctor_table`.`Doctor_Name` AS `Doctor_Name`,`doctor_table`.`Doctor_Qualification` AS `Doctor_Qualification` from `doctor_table` where (`doctor_table`.`Doctor_Qualification` = 'GYN') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `room_view`
--

/*!50001 DROP VIEW IF EXISTS `room_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `room_view` AS select `hospitalstaff_table`.`Room_table_Room_ID` AS `Room_table_Room_ID`,`hospitalstaff_table`.`HS_ID` AS `HS_ID`,`hospitalstaff_table`.`HS_Name` AS `HS_Name`,`room_table`.`Room_type` AS `Room_type` from (`room_table` left join `hospitalstaff_table` on((`hospitalstaff_table`.`Room_table_Room_ID` = `room_table`.`Room_ID`))) where ((`room_table`.`Room_type` = 'ICU') and (`room_table`.`Room_Status` = 'OCCUPIED')) */;
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

-- Dump completed on 2018-12-13  7:13:14
