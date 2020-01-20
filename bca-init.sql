-- MySQL Script generated by MySQL Workbench
-- Mon Jan 20 16:52:09 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bca-db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bca-db` ;

-- -----------------------------------------------------
-- Schema bca-db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bca-db` DEFAULT CHARACTER SET utf8 ;
USE `bca-db` ;

-- -----------------------------------------------------
-- Table `bca-db`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bca-db`.`Users` ;

CREATE TABLE IF NOT EXISTS `bca-db`.`Users` (
  `idUsers` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(64) NOT NULL,
  `lastName` VARCHAR(64) NOT NULL,
  `email` VARCHAR(64) NOT NULL,
  `password` VARCHAR(256) NOT NULL,
  `roles` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bca-db`.`Projects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bca-db`.`Projects` ;

CREATE TABLE IF NOT EXISTS `bca-db`.`Projects` (
  `idProjects` INT NOT NULL AUTO_INCREMENT,
  `projectName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProjects`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bca-db`.`Resources`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bca-db`.`Resources` ;

CREATE TABLE IF NOT EXISTS `bca-db`.`Resources` (
  `idResources` INT NOT NULL,
  `resourceCode` VARCHAR(45) NOT NULL,
  `resourceName` VARCHAR(45) NOT NULL,
  `Projects_idProjects` INT NOT NULL,
  PRIMARY KEY (`idResources`),
  INDEX `fk_Resources_Projects_idx` (`Projects_idProjects` ASC),
  CONSTRAINT `fk_Resources_Projects`
    FOREIGN KEY (`Projects_idProjects`)
    REFERENCES `bca-db`.`Projects` (`idProjects`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bca-db`.`Columns`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bca-db`.`Columns` ;

CREATE TABLE IF NOT EXISTS `bca-db`.`Columns` (
  `idColums` INT NOT NULL AUTO_INCREMENT,
  `columnName` VARCHAR(45) NOT NULL,
  `columnType` VARCHAR(45) NOT NULL,
  `columnFormula` VARCHAR(45) NULL,
  `Projects_idProjects` INT NOT NULL,
  PRIMARY KEY (`idColums`),
  INDEX `fk_Columns_Projects1_idx` (`Projects_idProjects` ASC),
  CONSTRAINT `fk_Columns_Projects1`
    FOREIGN KEY (`Projects_idProjects`)
    REFERENCES `bca-db`.`Projects` (`idProjects`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bca-db`.`ColumnValue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bca-db`.`ColumnValue` ;

CREATE TABLE IF NOT EXISTS `bca-db`.`ColumnValue` (
  `idColumnValue` INT NOT NULL AUTO_INCREMENT,
  `columnValue` VARCHAR(45) NULL,
  `Resources_idResources` INT NOT NULL,
  `Projects_idProjects` INT NOT NULL,
  `Columns_idColums` INT NOT NULL,
  PRIMARY KEY (`idColumnValue`),
  INDEX `fk_ColumnValue_Resources1_idx` (`Resources_idResources` ASC),
  INDEX `fk_ColumnValue_Projects1_idx` (`Projects_idProjects` ASC),
  INDEX `fk_ColumnValue_Columns1_idx` (`Columns_idColums` ASC),
  CONSTRAINT `fk_ColumnValue_Resources1`
    FOREIGN KEY (`Resources_idResources`)
    REFERENCES `bca-db`.`Resources` (`idResources`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ColumnValue_Projects1`
    FOREIGN KEY (`Projects_idProjects`)
    REFERENCES `bca-db`.`Projects` (`idProjects`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ColumnValue_Columns1`
    FOREIGN KEY (`Columns_idColums`)
    REFERENCES `bca-db`.`Columns` (`idColums`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
