-- MariaDB dump 10.19  Distrib 10.4.22-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: progetto_ufficiale
-- ------------------------------------------------------
-- Server version	10.4.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abbonamenti`
--

DROP TABLE IF EXISTS `abbonamenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abbonamenti` (
  `IdAbb` int(11) NOT NULL AUTO_INCREMENT,
  `Cliente` smallint(6) DEFAULT NULL,
  `Tipo` varchar(25) NOT NULL CHECK (`Tipo` in ('giornaliero','mensile','trimestrale','annuale','corso')),
  `DataIni` date NOT NULL,
  `DataSca` date NOT NULL,
  `Dip` varchar(16) DEFAULT NULL,
  `Transaz` int(11) NOT NULL,
  `Prezzo` smallint(6) NOT NULL,
  `Stato` char(7) NOT NULL DEFAULT 'valido' CHECK (`Stato` in ('valido','scaduto')),
  PRIMARY KEY (`IdAbb`),
  UNIQUE KEY `Transaz` (`Transaz`),
  KEY `Cliente` (`Cliente`),
  KEY `Dip` (`Dip`),
  CONSTRAINT `abbonamenti_ibfk_1` FOREIGN KEY (`Cliente`) REFERENCES `clienti` (`CodCli`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `abbonamenti_ibfk_2` FOREIGN KEY (`Dip`) REFERENCES `segretaria` (`CFDip`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `abbonamenti_ibfk_3` FOREIGN KEY (`Transaz`) REFERENCES `transazioni` (`IdTrans`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abbonamenti`
--

LOCK TABLES `abbonamenti` WRITE;
/*!40000 ALTER TABLE `abbonamenti` DISABLE KEYS */;
INSERT INTO `abbonamenti` VALUES (3,4,'giornaliero','2022-01-13','2022-01-14','ASDFGHJKLASDCCBM',1,7,'scaduto'),(5,7,'corso','2022-01-09','2022-02-09','ASDFGHJKLASDCCBM',3,40,'valido'),(6,8,'corso','2022-01-12','2022-02-12','ASDFGHJKLASDCCBM',4,40,'valido'),(12,10,'mensile','2022-01-14','2022-02-14','ASDFGHJKLASDCCBM',17,40,'valido');
/*!40000 ALTER TABLE `abbonamenti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clienti`
--

DROP TABLE IF EXISTS `clienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clienti` (
  `CodCli` smallint(6) NOT NULL AUTO_INCREMENT,
  `Cognome` varchar(25) NOT NULL,
  `Nome` varchar(25) NOT NULL,
  `CFCli` char(16) NOT NULL,
  `CertMedico` tinyint(1) DEFAULT NULL,
  `TipoCli` varchar(11) DEFAULT NULL CHECK (`TipoCli` in ('sala pesi','corso')),
  PRIMARY KEY (`CodCli`),
  UNIQUE KEY `Cognome` (`Cognome`,`Nome`,`CFCli`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienti`
--

LOCK TABLES `clienti` WRITE;
/*!40000 ALTER TABLE `clienti` DISABLE KEYS */;
INSERT INTO `clienti` VALUES (4,'Rossi','Valentino','AQDERFGHIJKLTYUI',1,'Sala pesi'),(7,'Azzurri','Luca','APOIUYTAEGHMERFG',1,'Corso'),(8,'Grigi','Marta','APOIUYTAEGHMROKH',1,'Corso'),(10,'Giallo','Arianna','EHNIUYTQWEHMROKH',1,'Sala pesi'),(11,'Marrone','Luca','ASDFGHJKLASDCCBM',0,'Sala pesi'),(12,'Viola','Giorgia','ASDFGHJKLASDCCBM',0,'Corso');
/*!40000 ALTER TABLE `clienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composizione`
--

DROP TABLE IF EXISTS `composizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composizione` (
  `NomeEs` varchar(25) NOT NULL,
  `IdScheda` smallint(6) NOT NULL,
  PRIMARY KEY (`NomeEs`,`IdScheda`),
  KEY `IdScheda` (`IdScheda`),
  CONSTRAINT `composizione_ibfk_1` FOREIGN KEY (`NomeEs`) REFERENCES `esercizio` (`NomeEs`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `composizione_ibfk_2` FOREIGN KEY (`IdScheda`) REFERENCES `schedatecnica` (`IdScheda`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composizione`
--

LOCK TABLES `composizione` WRITE;
/*!40000 ALTER TABLE `composizione` DISABLE KEYS */;
INSERT INTO `composizione` VALUES ('Leg press',8),('Piegamenti',8);
/*!40000 ALTER TABLE `composizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corso`
--

DROP TABLE IF EXISTS `corso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corso` (
  `NomeCo` varchar(25) NOT NULL,
  PRIMARY KEY (`NomeCo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corso`
--

LOCK TABLES `corso` WRITE;
/*!40000 ALTER TABLE `corso` DISABLE KEYS */;
/*!40000 ALTER TABLE `corso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dipendenti`
--

DROP TABLE IF EXISTS `dipendenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dipendenti` (
  `CFDip` varchar(16) NOT NULL,
  `Cognome` varchar(25) NOT NULL,
  `Nome` varchar(25) NOT NULL,
  `Stipendio` float(6,2) DEFAULT 0.00,
  `DataN` date NOT NULL,
  PRIMARY KEY (`CFDip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dipendenti`
--

LOCK TABLES `dipendenti` WRITE;
/*!40000 ALTER TABLE `dipendenti` DISABLE KEYS */;
INSERT INTO `dipendenti` VALUES ('ASDFGHJKLASDCCBM','Neri','Carla',1035.44,'1983-10-09'),('ASDFGHJKLASDCFVG','Verdi','Giuseppe',1025.74,'1993-11-09'),('ASDFGHJKLASTNCPI','Rosso','Mario',1050.71,'1976-05-23');
/*!40000 ALTER TABLE `dipendenti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esercizio`
--

DROP TABLE IF EXISTS `esercizio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esercizio` (
  `NomeEs` varchar(25) NOT NULL,
  PRIMARY KEY (`NomeEs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esercizio`
--

LOCK TABLES `esercizio` WRITE;
/*!40000 ALTER TABLE `esercizio` DISABLE KEYS */;
INSERT INTO `esercizio` VALUES ('Lat machine'),('Leg press'),('Panca piana'),('Piegamenti');
/*!40000 ALTER TABLE `esercizio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istruttore`
--

DROP TABLE IF EXISTS `istruttore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `istruttore` (
  `CFDip` varchar(16) NOT NULL,
  `NomeCo` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`CFDip`),
  KEY `NomeCo` (`NomeCo`),
  CONSTRAINT `istruttore_ibfk_1` FOREIGN KEY (`CFDip`) REFERENCES `dipendenti` (`CFDip`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `istruttore_ibfk_2` FOREIGN KEY (`NomeCo`) REFERENCES `corso` (`NomeCo`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istruttore`
--

LOCK TABLES `istruttore` WRITE;
/*!40000 ALTER TABLE `istruttore` DISABLE KEYS */;
INSERT INTO `istruttore` VALUES ('ASDFGHJKLASTNCPI',NULL);
/*!40000 ALTER TABLE `istruttore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personaltrainer`
--

DROP TABLE IF EXISTS `personaltrainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personaltrainer` (
  `CFDip` varchar(16) NOT NULL,
  PRIMARY KEY (`CFDip`),
  CONSTRAINT `personaltrainer_ibfk_1` FOREIGN KEY (`CFDip`) REFERENCES `dipendenti` (`CFDip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaltrainer`
--

LOCK TABLES `personaltrainer` WRITE;
/*!40000 ALTER TABLE `personaltrainer` DISABLE KEYS */;
INSERT INTO `personaltrainer` VALUES ('ASDFGHJKLASDCFVG');
/*!40000 ALTER TABLE `personaltrainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prenotazioni`
--

DROP TABLE IF EXISTS `prenotazioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prenotazioni` (
  `IdPre` int(11) NOT NULL AUTO_INCREMENT,
  `Cliente` smallint(6) NOT NULL,
  `Dip` varchar(16) DEFAULT NULL,
  `Data` date NOT NULL,
  `OraIn` time NOT NULL CHECK (`OraIn` in ('08:00:00','09:30:00','11:00:00','12:30:00','14:00:00','15:30:00','17:00:00','18:30:00','20:00:00','21:30:00')),
  `OraFin` time NOT NULL CHECK (`OraFin` = `OraIn` + interval 90 minute),
  `Tipo` varchar(9) NOT NULL CHECK (`Tipo` in ('Sala pesi','Corso')),
  PRIMARY KEY (`IdPre`),
  KEY `Cliente` (`Cliente`),
  KEY `Dip` (`Dip`),
  CONSTRAINT `prenotazioni_ibfk_1` FOREIGN KEY (`Cliente`) REFERENCES `clienti` (`CodCli`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prenotazioni_ibfk_2` FOREIGN KEY (`Dip`) REFERENCES `segretaria` (`CFDip`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prenotazioni`
--

LOCK TABLES `prenotazioni` WRITE;
/*!40000 ALTER TABLE `prenotazioni` DISABLE KEYS */;
INSERT INTO `prenotazioni` VALUES (3,4,'ASDFGHJKLASDCCBM','2022-01-14','11:00:00','12:30:00','Sala pesi');
/*!40000 ALTER TABLE `prenotazioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedatecnica`
--

DROP TABLE IF EXISTS `schedatecnica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedatecnica` (
  `IdScheda` smallint(6) NOT NULL AUTO_INCREMENT,
  `Data` date NOT NULL,
  `Peso` float(4,1) NOT NULL CHECK (`Peso` > 0),
  `Altezza` smallint(6) NOT NULL CHECK (`Altezza` > 0),
  `Grasso` smallint(6) NOT NULL CHECK (`Grasso` > 0),
  `Muscolo` smallint(6) NOT NULL CHECK (`Muscolo` > 0),
  `Dip` varchar(16) DEFAULT NULL,
  `Cliente` smallint(6) NOT NULL,
  PRIMARY KEY (`IdScheda`),
  KEY `Dip` (`Dip`),
  KEY `Cliente` (`Cliente`),
  CONSTRAINT `schedatecnica_ibfk_1` FOREIGN KEY (`Dip`) REFERENCES `personaltrainer` (`CFDip`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `schedatecnica_ibfk_2` FOREIGN KEY (`Cliente`) REFERENCES `clienti` (`CodCli`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedatecnica`
--

LOCK TABLES `schedatecnica` WRITE;
/*!40000 ALTER TABLE `schedatecnica` DISABLE KEYS */;
INSERT INTO `schedatecnica` VALUES (8,'2022-01-14',85.4,177,12,55,'ASDFGHJKLASDCFVG',10);
/*!40000 ALTER TABLE `schedatecnica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segretaria`
--

DROP TABLE IF EXISTS `segretaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `segretaria` (
  `CFDip` varchar(16) NOT NULL,
  PRIMARY KEY (`CFDip`),
  CONSTRAINT `segretaria_ibfk_1` FOREIGN KEY (`CFDip`) REFERENCES `dipendenti` (`CFDip`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segretaria`
--

LOCK TABLES `segretaria` WRITE;
/*!40000 ALTER TABLE `segretaria` DISABLE KEYS */;
INSERT INTO `segretaria` VALUES ('ASDFGHJKLASDCCBM');
/*!40000 ALTER TABLE `segretaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefono` (
  `Num` varchar(10) NOT NULL,
  `Cliente` smallint(6) NOT NULL,
  PRIMARY KEY (`Num`),
  KEY `Cliente` (`Cliente`),
  CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`Cliente`) REFERENCES `clienti` (`CodCli`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
INSERT INTO `telefono` VALUES ('1234567891',4),('1234567892',4),('2123456789',7);
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transazioni`
--

DROP TABLE IF EXISTS `transazioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transazioni` (
  `IdTrans` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` char(7) NOT NULL CHECK (`Tipo` in ('entrata','uscita')),
  `Causale` varchar(100) DEFAULT NULL,
  `ImportoUsc` float(6,2) DEFAULT 0.00,
  `ImportoEnt` smallint(6) DEFAULT 0,
  `Data` date NOT NULL,
  `Dipendente` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`IdTrans`),
  KEY `Dipendente` (`Dipendente`),
  CONSTRAINT `transazioni_ibfk_1` FOREIGN KEY (`Dipendente`) REFERENCES `segretaria` (`CFDip`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transazioni`
--

LOCK TABLES `transazioni` WRITE;
/*!40000 ALTER TABLE `transazioni` DISABLE KEYS */;
INSERT INTO `transazioni` VALUES (1,'entrata','Pagamento abbonamento giornaliero',0.00,7,'2022-01-13','ASDFGHJKLASDCCBM'),(2,'entrata','Pagamento abbonamento corso',0.00,40,'2022-01-12','ASDFGHJKLASDCCBM'),(3,'entrata','Pagamento abbonamento corso',0.00,40,'2022-01-09','ASDFGHJKLASDCCBM'),(4,'entrata','Pagamento abbonamento mensile',0.00,40,'2022-01-12','ASDFGHJKLASDCCBM'),(5,'entrata','Pagamento abbonamento mensile',0.00,40,'2022-01-13','ASDFGHJKLASDCCBM'),(7,'uscita','Pagamento stipendio',1035.44,0,'2022-01-05','ASDFGHJKLASDCCBM'),(9,'uscita','Pagamento stipendio',1027.43,0,'2022-01-05','ASDFGHJKLASDCCBM'),(14,'entrata','Pagamento abbonamento mensile',0.00,40,'2022-01-14','ASDFGHJKLASDCCBM'),(15,'entrata','Pagamento abbonamento mensile',0.00,40,'2021-12-12','ASDFGHJKLASDCCBM'),(16,'entrata','Pagamento abbonamento mensile',0.00,40,'2021-11-12','ASDFGHJKLASDCCBM'),(17,'entrata','Pagamento abbonamento mensile',0.00,40,'2022-01-14','ASDFGHJKLASDCCBM');
/*!40000 ALTER TABLE `transazioni` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-14 19:58:40
