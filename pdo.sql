-- MySQL Script generated by MySQL Workbench
-- Sat Apr 29 21:59:39 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema cakephp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cakephp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cakephp` DEFAULT CHARACTER SET utf8 ;
USE `cakephp` ;

-- -----------------------------------------------------
-- Table `cakephp`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cakephp`.`cars` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner` VARCHAR(255) NOT NULL,
  `model` VARCHAR(255) NOT NULL,
  `horsePower` SMALLINT UNSIGNED NOT NULL,
  `color` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `cakephp`.`cars`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakephp`;
INSERT INTO `cakephp`.`cars` (`id`, `owner`, `model`, `horsePower`, `color`) VALUES (1, 'Dennis Westphal', 'Tesla Model S', 463, 'white');

COMMIT;
