drop database cub;
create database cub;
use cub;
-- MySQL Script generated by MySQL Workbench
-- Mon Mar 18 23:40:07 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cub
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cub
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cub` ;
USE `cub` ;

-- -----------------------------------------------------
-- Table `cub`.`advisers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cub`.`advisers` (
  `id_adviser` INT(11) NOT NULL AUTO_INCREMENT,
  `adviser_username` VARCHAR(16) NOT NULL,
  `adviser_password` VARCHAR(60) NOT NULL,
  `adviser_role` VARCHAR(100) NOT NULL,
  `adviser_name` VARCHAR(100) NOT NULL,
  `adviser_lastname` VARCHAR(100) NOT NULL,
  `adviser_rut` VARCHAR(100) NOT NULL,
  `adviser_email` VARCHAR(100) NOT NULL,
  `adviser_phone` VARCHAR(30) NOT NULL,
  `registeredAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `adviser_birthday` DATE NOT NULL,
  PRIMARY KEY (`id_adviser`));


-- -----------------------------------------------------
-- Table `cub`.`damages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cub`.`damages` (
  `id_damage` INT(11) NOT NULL AUTO_INCREMENT,
  `damage_name` VARCHAR(150) NOT NULL,
  `damage_description` TEXT NULL DEFAULT NULL,
  `damage_unit` VARCHAR(40) NOT NULL,
  `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_damage`));


-- -----------------------------------------------------
-- Table `cub`.`repairs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cub`.`repairs` (
  `id_repair` INT(11) NOT NULL AUTO_INCREMENT,
  `repair_name` VARCHAR(150) NOT NULL,
  `repair_unit` VARCHAR(150) NOT NULL,
  `repair_price` DECIMAL(19,2) NOT NULL,
  `repair_description` TEXT NULL DEFAULT NULL,
  `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_repair`));


-- -----------------------------------------------------
-- Table `cub`.`sectors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cub`.`sectors` (
  `id_sector` INT(11) NOT NULL AUTO_INCREMENT,
  `sector_name` VARCHAR(150) NOT NULL,
  `sector_description` TEXT NULL DEFAULT NULL,
  `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sector`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cub`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cub`.`clients` (
  `id_client` INT(11) NOT NULL AUTO_INCREMENT,
  `client_name` VARCHAR(100) NOT NULL,
  `client_lastname` VARCHAR(100) NOT NULL,
  `client_rut` VARCHAR(100) NOT NULL,
  `client_birthday` DATE NOT NULL,
  `client_address` VARCHAR(100) NOT NULL,
  `client_phone` VARCHAR(100) NOT NULL,
  `client_email` VARCHAR(100) NOT NULL,
  `registeredAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_client`));


-- -----------------------------------------------------
-- Table `cub`.`incidents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cub`.`incidents` (
  `id_incident` INT(11) NOT NULL AUTO_INCREMENT,
  `incident_code` VARCHAR(120) NOT NULL,
  `incident_date` DATE NOT NULL,
  `incident_description` TEXT NOT NULL,
  `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_incident`));


-- -----------------------------------------------------
-- Table `cub`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cub`.`status` (
  `id_status` INT(11) NOT NULL,
  `status_name` VARCHAR(40) NOT NULL,
  `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_status`));


-- -----------------------------------------------------
-- Table `cub`.`cases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cub`.`cases` (
  `id_case` INT(11) NOT NULL AUTO_INCREMENT,
  `id_status` INT(11) NOT NULL,
  `id_adviser` INT(11) NOT NULL,
  `id_client` INT(11) NOT NULL,
  `id_incident` INT(11) NOT NULL,
  `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `case_date` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id_case`),
  INDEX `fk_cases_status1_idx` (`id_status` ASC) VISIBLE,
  INDEX `fk_cases_advisers1_idx` (`id_adviser` ASC) VISIBLE,
  INDEX `fk_cases_clients1_idx` (`id_client` ASC) VISIBLE,
  INDEX `fk_cases_incidents1_idx` (`id_incident` ASC) VISIBLE,
  CONSTRAINT `fk_cases_status1`
    FOREIGN KEY (`id_status`)
    REFERENCES `cub`.`status` (`id_status`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cases_advisers1`
    FOREIGN KEY (`id_adviser`)
    REFERENCES `cub`.`advisers` (`id_adviser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cases_clients1`
    FOREIGN KEY (`id_client`)
    REFERENCES `cub`.`clients` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cases_incidents1`
    FOREIGN KEY (`id_incident`)
    REFERENCES `cub`.`incidents` (`id_incident`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cub`.`damages_repairs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cub`.`damages_repairs` (
  `id_damage_repair` INT(11) NOT NULL AUTO_INCREMENT,
  `id_damage` INT(11) NOT NULL,
  `id_repair` INT(11) NOT NULL,
  INDEX `fk_damages_has_repairs_repairs1_idx` (`id_repair` ASC) VISIBLE,
  INDEX `fk_damages_has_repairs_damages1_idx` (`id_damage` ASC) VISIBLE,
  PRIMARY KEY (`id_damage_repair`),
  CONSTRAINT `fk_damages_has_repairs_damages1`
    FOREIGN KEY (`id_damage`)
    REFERENCES `cub`.`damages` (`id_damage`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_damages_has_repairs_repairs1`
    FOREIGN KEY (`id_repair`)
    REFERENCES `cub`.`repairs` (`id_repair`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `cub`.`c_d_s`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cub`.`c_d_s` (
  `id_c_d_s` INT NOT NULL AUTO_INCREMENT,
  `id_damage` INT(11) NOT NULL,
  `id_sector` INT(11) NOT NULL,
  `id_case` INT(11) NOT NULL,
  INDEX `fk_cases_has_damages_damages1_idx` (`id_damage` ASC) VISIBLE,
  PRIMARY KEY (`id_c_d_s`),
  INDEX `fk_c_d_sectors1_idx` (`id_sector` ASC) VISIBLE,
  INDEX `fk_c_d_cases1_idx` (`id_case` ASC) VISIBLE,
  CONSTRAINT `fk_cases_has_damages_damages1`
    FOREIGN KEY (`id_damage`)
    REFERENCES `cub`.`damages` (`id_damage`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_c_d_sectors1`
    FOREIGN KEY (`id_sector`)
    REFERENCES `cub`.`sectors` (`id_sector`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_c_d_cases1`
    FOREIGN KEY (`id_case`)
    REFERENCES `cub`.`cases` (`id_case`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cub`.`dimentions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cub`.`dimentions` (
  `id_dimention` INT NOT NULL AUTO_INCREMENT,
  `damage_size` DECIMAL(19,2) NOT NULL,
  `sector_w_size` DECIMAL(19,2) NOT NULL,
  `sector_l_size` DECIMAL(19,2) NOT NULL,
  `sector_h_size` DECIMAL(19,2) NOT NULL,
  `id_sector` INT(11) NOT NULL,
  `id_case` INT NOT NULL,
  PRIMARY KEY (`id_dimention`),
  INDEX `fk_dimentions_sectors1_idx` (`id_sector` ASC) VISIBLE,
  INDEX `fk_dimentions_cases1_idx` (`id_case` ASC) VISIBLE,
  CONSTRAINT `fk_dimentions_sectors1`
    FOREIGN KEY (`id_sector`)
    REFERENCES `cub`.`sectors` (`id_sector`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dimentions_cases1`
    FOREIGN KEY (`id_case`)
    REFERENCES `cub`.`cases` (`id_case`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cub`.`d_c_d_s`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cub`.`d_c_d_s` (
  `id_d_c_d_s` INT NOT NULL AUTO_INCREMENT,
  `id_c_d_s` INT NOT NULL,
  `size` DECIMAL(10) NOT NULL,
  PRIMARY KEY (`id_d_c_d_s`),
  INDEX `fk_d_c_d_s_c_d_s1_idx` (`id_c_d_s` ASC) VISIBLE,
  CONSTRAINT `fk_d_c_d_s_c_d_s1`
    FOREIGN KEY (`id_c_d_s`)
    REFERENCES `cub`.`c_d_s` (`id_c_d_s`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cub`.`damage_images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cub`.`damage_images` (
  `id_damage_images` INT NOT NULL AUTO_INCREMENT,
  `image1` VARCHAR(200) NOT NULL,
  `image2` VARCHAR(200) NULL,
  `image3` VARCHAR(200) NULL,
  `id_d_c_d_s` INT NOT NULL,
  UNIQUE INDEX `id_damage_images_UNIQUE` (`id_damage_images` ASC) VISIBLE,
  PRIMARY KEY (`id_damage_images`),
  INDEX `fk_damage_images_d_c_d_s1_idx` (`id_d_c_d_s` ASC) VISIBLE,
  CONSTRAINT `fk_damage_images_d_c_d_s1`
    FOREIGN KEY (`id_d_c_d_s`)
    REFERENCES `cub`.`d_c_d_s` (`id_d_c_d_s`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

