CREATE DATABASE  IF NOT EXISTS `b2cdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `b2cdb`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: b2cdb
-- ------------------------------------------------------
-- Server version	5.6.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favoritos` (
  `idFavoritos` int(11) NOT NULL,
  `idInmueble` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idFavoritos`),
  KEY `fk_inmueble_has_usuario_usuario1_idx` (`idUsuario`),
  KEY `fk_inmueble_has_usuario_inmueble1_idx` (`idInmueble`),
  CONSTRAINT `fk_inmueble_has_usuario_inmueble1` FOREIGN KEY (`idInmueble`) REFERENCES `inmueble` (`idInmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inmueble_has_usuario_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagen`
--

DROP TABLE IF EXISTS `imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagen` (
  `idImagen` int(11) NOT NULL,
  `ruta` varchar(200) DEFAULT NULL,
  `idInmueble` int(11) NOT NULL,
  PRIMARY KEY (`idImagen`),
  KEY `fk_imagen_inmueble1_idx` (`idInmueble`),
  CONSTRAINT `fk_imagen_inmueble1` FOREIGN KEY (`idInmueble`) REFERENCES `inmueble` (`idInmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagen`
--

LOCK TABLES `imagen` WRITE;
/*!40000 ALTER TABLE `imagen` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inmueble`
--

DROP TABLE IF EXISTS `inmueble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inmueble` (
  `idInmueble` int(11) NOT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `distrito` varchar(100) DEFAULT NULL,
  `latitud` decimal(10,0) DEFAULT NULL,
  `longitud` decimal(10,0) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL,
  `idTipoTransaccion` int(11) NOT NULL,
  `cantidadFavoritos` bigint(20) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `eliminado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idInmueble`),
  KEY `fk_inmueble_usuario_idx` (`idUsuario`),
  KEY `fk_inmueble_tipotransaccion1_idx` (`idTipoTransaccion`),
  CONSTRAINT `fk_inmueble_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inmueble_tipotransaccion1` FOREIGN KEY (`idTipoTransaccion`) REFERENCES `tipotransaccion` (`idtipotransaccion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inmueble`
--

LOCK TABLES `inmueble` WRITE;
/*!40000 ALTER TABLE `inmueble` DISABLE KEYS */;
/*!40000 ALTER TABLE `inmueble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoinmueble`
--

DROP TABLE IF EXISTS `tipoinmueble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoinmueble` (
  `idTipoInmueble` int(11) NOT NULL,
  `descripcion` varchar(20) DEFAULT NULL,
  `idInmueble` int(11) NOT NULL,
  PRIMARY KEY (`idTipoInmueble`),
  KEY `fk_tipoinmueble_inmueble1_idx` (`idInmueble`),
  CONSTRAINT `fk_tipoinmueble_inmueble1` FOREIGN KEY (`idInmueble`) REFERENCES `inmueble` (`idInmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoinmueble`
--

LOCK TABLES `tipoinmueble` WRITE;
/*!40000 ALTER TABLE `tipoinmueble` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoinmueble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipotransaccion`
--

DROP TABLE IF EXISTS `tipotransaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipotransaccion` (
  `idtipotransaccion` int(11) NOT NULL,
  `descripcion` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`idtipotransaccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipotransaccion`
--

LOCK TABLES `tipotransaccion` WRITE;
/*!40000 ALTER TABLE `tipotransaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipotransaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipousuario` (
  `idTipoUsuario` int(11) NOT NULL,
  `descripcion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idTipoUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `ruc` varchar(12) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `web` varchar(200) DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `idTipoUsuario` int(11) NOT NULL,
  `eliminado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_usuario_tipousuario1_idx` (`idTipoUsuario`),
  CONSTRAINT `fk_usuario_tipousuario1` FOREIGN KEY (`idTipoUsuario`) REFERENCES `tipousuario` (`idTipoUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-21 14:32:01
