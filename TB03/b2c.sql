-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema b2cdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema b2cdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `b2cdb` DEFAULT CHARACTER SET utf8 ;
USE `b2cdb` ;

-- -----------------------------------------------------
-- Table `b2cdb`.`tipoinmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b2cdb`.`tipoinmueble` (
  `idTipoInmueble` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(20) NULL DEFAULT NULL,
  `eliminado` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`idTipoInmueble`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `b2cdb`.`tipotransaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b2cdb`.`tipotransaccion` (
  `idtipotransaccion` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(12) NULL DEFAULT NULL,
  `eliminado` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`idtipotransaccion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `b2cdb`.`tipousuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b2cdb`.`tipousuario` (
  `idTipoUsuario` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(20) NULL DEFAULT NULL,
  `eliminado` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`idTipoUsuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `b2cdb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b2cdb`.`usuario` (
  `idUsuario` INT(11) NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(50) NULL DEFAULT NULL,
  `password` VARCHAR(50) NULL DEFAULT NULL,
  `nombre` VARCHAR(200) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `ruc` VARCHAR(12) NULL DEFAULT NULL,
  `direccion` VARCHAR(200) NULL DEFAULT NULL,
  `web` VARCHAR(200) NULL DEFAULT NULL,
  `telefono` VARCHAR(12) NULL DEFAULT NULL,
  `idTipoUsuario` INT(11) NOT NULL,
  `eliminado` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `fk_usuario_tipousuario1_idx` (`idTipoUsuario` ASC),
  CONSTRAINT `fk_usuario_tipousuario1`
    FOREIGN KEY (`idTipoUsuario`)
    REFERENCES `b2cdb`.`tipousuario` (`idTipoUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `b2cdb`.`inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b2cdb`.`inmueble` (
  `idInmueble` INT(11) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(200) NULL DEFAULT NULL,
  `direccion` VARCHAR(200) NULL DEFAULT NULL,
  `distrito` VARCHAR(100) NULL DEFAULT NULL,
  `latitud` DECIMAL(10,2) NULL DEFAULT NULL,
  `longitud` DECIMAL(10,2) NULL DEFAULT NULL,
  `descripcion` VARCHAR(500) NULL DEFAULT NULL,
  `precio` DECIMAL(10,2) NULL DEFAULT NULL,
  `idUsuario` INT(11) NOT NULL,
  `idTipoTransaccion` INT(11) NOT NULL,
  `cantidadFavoritos` BIGINT(20) NULL DEFAULT NULL,
  `fechaCreacion` DATETIME NULL DEFAULT NULL,
  `eliminado` BIT(1) NULL DEFAULT NULL,
  `idTipoInmueble` INT(11) NOT NULL,
  PRIMARY KEY (`idInmueble`),
  INDEX `fk_inmueble_usuario_idx` (`idUsuario` ASC),
  INDEX `fk_inmueble_tipotransaccion1_idx` (`idTipoTransaccion` ASC),
  INDEX `fk_inmueble_tipoinmueble1_idx` (`idTipoInmueble` ASC),
  CONSTRAINT `fk_inmueble_tipoinmueble1`
    FOREIGN KEY (`idTipoInmueble`)
    REFERENCES `b2cdb`.`tipoinmueble` (`idTipoInmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inmueble_tipotransaccion1`
    FOREIGN KEY (`idTipoTransaccion`)
    REFERENCES `b2cdb`.`tipotransaccion` (`idtipotransaccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inmueble_usuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `b2cdb`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `b2cdb`.`favoritos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b2cdb`.`favoritos` (
  `idFavoritos` INT(11) NOT NULL AUTO_INCREMENT,
  `idInmueble` INT(11) NOT NULL,
  `idUsuario` INT(11) NOT NULL,
  `fechaCreacion` DATETIME NULL DEFAULT NULL,
  `eliminado` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`idFavoritos`),
  INDEX `fk_inmueble_has_usuario_usuario1_idx` (`idUsuario` ASC),
  INDEX `fk_inmueble_has_usuario_inmueble1_idx` (`idInmueble` ASC),
  CONSTRAINT `fk_inmueble_has_usuario_inmueble1`
    FOREIGN KEY (`idInmueble`)
    REFERENCES `b2cdb`.`inmueble` (`idInmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inmueble_has_usuario_usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `b2cdb`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `b2cdb`.`imagen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b2cdb`.`imagen` (
  `idImagen` INT(11) NOT NULL AUTO_INCREMENT,
  `imgBlob` LONGBLOB NULL DEFAULT NULL,
  `idInmueble` INT(11) NOT NULL,
  `eliminado` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`idImagen`),
  INDEX `fk_imagen_inmueble1_idx` (`idInmueble` ASC),
  CONSTRAINT `fk_imagen_inmueble1`
    FOREIGN KEY (`idInmueble`)
    REFERENCES `b2cdb`.`inmueble` (`idInmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
