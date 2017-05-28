-- MySQL Script generated by MySQL Workbench
-- Thu May 18 21:14:42 2017
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
-- Table `cakephp`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cakephp`.`users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `surname` VARCHAR(100) NOT NULL,
  `created` DATETIME NULL,
  `modified` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `cakephp`.`rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cakephp`.`rooms` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cakephp`.`topics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cakephp`.`topics` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` INT UNSIGNED NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `teaser` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `created` DATETIME NULL,
  `modified` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_topics_users1_idx` (`author_id` ASC),
  CONSTRAINT `fk_topics_users1`
    FOREIGN KEY (`author_id`)
    REFERENCES `cakephp`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cakephp`.`presentations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cakephp`.`presentations` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `topic_id` INT UNSIGNED NOT NULL,
  `room_id` INT UNSIGNED NOT NULL,
  `date` DATETIME NOT NULL,
  `freeSpots` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_presentations_topics1_idx` (`topic_id` ASC),
  INDEX `fk_presentations_room1_idx` (`room_id` ASC),
  CONSTRAINT `fk_presentations_topics1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `cakephp`.`topics` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_presentations_room1`
    FOREIGN KEY (`room_id`)
    REFERENCES `cakephp`.`rooms` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cakephp`.`presentations_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cakephp`.`presentations_users` (
  `presentations_id` INT UNSIGNED NOT NULL,
  `users_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`presentations_id`, `users_id`),
  INDEX `fk_presentations_has_users_users1_idx` (`users_id` ASC),
  INDEX `fk_presentations_has_users_presentations1_idx` (`presentations_id` ASC),
  CONSTRAINT `fk_presentations_has_users_presentations1`
    FOREIGN KEY (`presentations_id`)
    REFERENCES `cakephp`.`presentations` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_presentations_has_users_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `cakephp`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `cakephp`.`users`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakephp`;
INSERT INTO `cakephp`.`users` (`id`, `username`, `password`, `type`, `name`, `surname`, `created`, `modified`) VALUES (1, 'dennis.westphal', '$2y$10$wPmpJHWxdD7NVXsvxuNaVeWxsia1wfInGYYyr4S1Sl71bHjRnH/.a', 'author', 'Dennis', 'Westphal', '2017-05-14 17:11:00', '2017-05-14 17:11:00');
INSERT INTO `cakephp`.`users` (`id`, `username`, `password`, `type`, `name`, `surname`, `created`, `modified`) VALUES (2, 'jacob.eberhardt', '$2y$10$T.cCIy4vt5SYmDHhZx2Mte1GJ8rYJim1oTcaNK.q3RpBrSo94ScJ2', 'author', 'Jacob', 'Eberhardt', '2017-05-14 17:11:00', '2017-05-14 17:11:00');

COMMIT;

-- -----------------------------------------------------
-- Data for table `cakephp`.`rooms`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakephp`;
INSERT INTO `cakephp`.`rooms` (`id`, `name`) VALUES (1, 'Hannover');
INSERT INTO `cakephp`.`rooms` (`id`, `name`) VALUES (2, 'Berlin');

COMMIT;


-- -----------------------------------------------------
-- Data for table `cakephp`.`topics`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakephp`;
INSERT INTO `cakephp`.`topics` (`id`, `author_id`, `title`, `teaser`, `description`, `created`, `modified`) VALUES (1, 1, 'Web applications with CakePHP', 'Introduction to the CakePHP framework', '<p>In this presentation, the author is going to give a brief overview on how to create web applications using the CakePHP 3.4 framework.</p>\n<p>Key components of this presentation include:</p>\n<ul>\n<li>Introduction to MVC</li>\n<li>Convention over configuration</li>\n<li>Structure of CakePHP</li>\n<li>Best practices</li>\n</ul>', '2017-05-14 17:12:00', '2017-05-14 17:12:00');
INSERT INTO `cakephp`.`topics` (`id`, `author_id`, `title`, `teaser`, `description`, `created`, `modified`) VALUES (2, 1, 'PHP basics', 'Basics of development in PHP, including introduction to OOP', ' ', '2017-05-14 16:15:00', '2017-05-14 16:15:00');
INSERT INTO `cakephp`.`topics` (`id`, `author_id`, `title`, `teaser`, `description`, `created`, `modified`) VALUES (3, 1, 'Mobile applications with Angular.js', 'Learn how to develop applications for mobile and desktop', ' ', '2017-05-14 14:15:00', '2017-05-14 14:15:00');
INSERT INTO `cakephp`.`topics` (`id`, `author_id`, `title`, `teaser`, `description`, `created`, `modified`) VALUES (4, 1, 'SCRUM: Agile development', 'Leverage the advantages of a modern development structure', ' ', '2017-05-14 18:15:00', '2017-05-14 18:15:00');
INSERT INTO `cakephp`.`topics` (`id`, `author_id`, `title`, `teaser`, `description`, `created`, `modified`) VALUES (5, 2, 'Java Enterprise Edition', 'Develop enterprise-grade applications with Java EE', ' ', '2017-05-14 12:15:00', '2017-05-14 12:15:00');

COMMIT;


-- -----------------------------------------------------
-- Data for table `cakephp`.`presentations`
-- -----------------------------------------------------
START TRANSACTION;
USE `cakephp`;
INSERT INTO `cakephp`.`presentations` (`id`, `topic_id`, `room_id`, `date`, `freeSpots`) VALUES (1, 1, 1, '2017-06-20 10:00:00', 8);
INSERT INTO `cakephp`.`presentations` (`id`, `topic_id`, `room_id`, `date`, `freeSpots`) VALUES (2, 1, 2, '2017-06-21 10:00:00', 8);
INSERT INTO `cakephp`.`presentations` (`id`, `topic_id`, `room_id`, `date`, `freeSpots`) VALUES (3, 1, 1, '2017-06-21 10:00:00', 8);

COMMIT;

