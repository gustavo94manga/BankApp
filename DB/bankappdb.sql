-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bankappdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bankappdb` ;

-- -----------------------------------------------------
-- Schema bankappdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bankappdb` DEFAULT CHARACTER SET utf8 ;
USE `bankappdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(64) NOT NULL,
  `enabled` TINYINT NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `last_login` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_detail` ;

CREATE TABLE IF NOT EXISTS `user_detail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_address` ;

CREATE TABLE IF NOT EXISTS `user_address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `zip_code` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `account` ;

CREATE TABLE IF NOT EXISTS `account` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `account_type` VARCHAR(45) NOT NULL,
  `account_number` INT NOT NULL,
  `balance` DOUBLE NOT NULL,
  `account_status` TINYINT NOT NULL,
  `opened_date` DATE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `account_number_UNIQUE` (`account_number` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `transaction` ;

CREATE TABLE IF NOT EXISTS `transaction` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `transaction_type` VARCHAR(45) NOT NULL,
  `transaction_amount` DOUBLE NOT NULL,
  `transaction_date` DATE NOT NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `loan` ;

CREATE TABLE IF NOT EXISTS `loan` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `loan_type` VARCHAR(45) NOT NULL,
  `loan_amount` DOUBLE NOT NULL,
  `outstanding_amount` DOUBLE NOT NULL,
  `interest_rate` DOUBLE NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `weather_api`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `weather_api` ;

CREATE TABLE IF NOT EXISTS `weather_api` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `weather_city` VARCHAR(45) NOT NULL,
  `weather_date` DATE NOT NULL,
  `temperature` INT NOT NULL,
  `humidity` INT NULL,
  `weather_status` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS admin;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'admin' IDENTIFIED BY 'admin';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'admin';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `bankappdb`;
INSERT INTO `user` (`id`, `email`, `username`, `password`, `enabled`, `phone`, `last_login`) VALUES (1, 'admin@java.com', 'admin', 'test', true, '123-456-7899', NULL);
INSERT INTO `user` (`id`, `email`, `username`, `password`, `enabled`, `phone`, `last_login`) VALUES (2, 'angel@java.com', 'angel', 'test', true, '222-123-4567', NULL);
INSERT INTO `user` (`id`, `email`, `username`, `password`, `enabled`, `phone`, `last_login`) VALUES (3, 'edwin@java.com', 'edwin', 'test', true, '111-832-5678', NULL);
INSERT INTO `user` (`id`, `email`, `username`, `password`, `enabled`, `phone`, `last_login`) VALUES (4, 'jerry@java.com', 'jerry', 'test', false, '911-123-4567', NULL);
INSERT INTO `user` (`id`, `email`, `username`, `password`, `enabled`, `phone`, `last_login`) VALUES (5, 'dom@java.com', 'dom', 'test', true, '321-456-7899', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_detail`
-- -----------------------------------------------------
START TRANSACTION;
USE `bankappdb`;
INSERT INTO `user_detail` (`id`, `first_name`, `last_name`, `date_of_birth`) VALUES (1, 'John', 'Doe', '19980101');
INSERT INTO `user_detail` (`id`, `first_name`, `last_name`, `date_of_birth`) VALUES (2, 'Angel', 'Garza', '19900101');
INSERT INTO `user_detail` (`id`, `first_name`, `last_name`, `date_of_birth`) VALUES (3, 'Edwin', 'Flatto', '19800101');
INSERT INTO `user_detail` (`id`, `first_name`, `last_name`, `date_of_birth`) VALUES (4, 'Jerry', 'Quintero', '19850101');
INSERT INTO `user_detail` (`id`, `first_name`, `last_name`, `date_of_birth`) VALUES (5, 'Dominic', 'Surina', '19950101');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_address`
-- -----------------------------------------------------
START TRANSACTION;
USE `bankappdb`;
INSERT INTO `user_address` (`id`, `address`, `city`, `state`, `zip_code`) VALUES (1, '123 Main St.', 'Houston', 'Tx', '77373');
INSERT INTO `user_address` (`id`, `address`, `city`, `state`, `zip_code`) VALUES (2, '456 Main St.', 'Houston', 'Tx', '77373');
INSERT INTO `user_address` (`id`, `address`, `city`, `state`, `zip_code`) VALUES (3, '789 Main St.', 'Tampa', 'Fl', '77068');
INSERT INTO `user_address` (`id`, `address`, `city`, `state`, `zip_code`) VALUES (4, '911 Main St.', 'El Paso', 'Tx', '77911');
INSERT INTO `user_address` (`id`, `address`, `city`, `state`, `zip_code`) VALUES (5, '135 Main St.', 'San Francisco', 'Ca', '77070');

COMMIT;


-- -----------------------------------------------------
-- Data for table `account`
-- -----------------------------------------------------
START TRANSACTION;
USE `bankappdb`;
INSERT INTO `account` (`id`, `account_type`, `account_number`, `balance`, `account_status`, `opened_date`) VALUES (1, 'Checking', 123456789, 50.00, true, '20230519');
INSERT INTO `account` (`id`, `account_type`, `account_number`, `balance`, `account_status`, `opened_date`) VALUES (2, 'Savings', 234567899, 25.00, true, '20230518');
INSERT INTO `account` (`id`, `account_type`, `account_number`, `balance`, `account_status`, `opened_date`) VALUES (3, 'Credit', 345678999, 10.00, true, '20230517');
INSERT INTO `account` (`id`, `account_type`, `account_number`, `balance`, `account_status`, `opened_date`) VALUES (4, 'Savings', 232425262, 1.00, false, '20230520');
INSERT INTO `account` (`id`, `account_type`, `account_number`, `balance`, `account_status`, `opened_date`) VALUES (5, 'Checking', 987654321, 2.00, true, '20230520');

COMMIT;


-- -----------------------------------------------------
-- Data for table `transaction`
-- -----------------------------------------------------
START TRANSACTION;
USE `bankappdb`;
INSERT INTO `transaction` (`id`, `transaction_type`, `transaction_amount`, `transaction_date`, `Description`) VALUES (1, 'Deposit', 1.00, '20230520', NULL);
INSERT INTO `transaction` (`id`, `transaction_type`, `transaction_amount`, `transaction_date`, `Description`) VALUES (2, 'Withdrawal', 15.00, '20230520', NULL);
INSERT INTO `transaction` (`id`, `transaction_type`, `transaction_amount`, `transaction_date`, `Description`) VALUES (3, 'Payment', 3.00, '20230519', NULL);
INSERT INTO `transaction` (`id`, `transaction_type`, `transaction_amount`, `transaction_date`, `Description`) VALUES (4, 'Payment', 8.00, '20230518', NULL);
INSERT INTO `transaction` (`id`, `transaction_type`, `transaction_amount`, `transaction_date`, `Description`) VALUES (5, 'Deposit', 2.00, '20230521', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `loan`
-- -----------------------------------------------------
START TRANSACTION;
USE `bankappdb`;
INSERT INTO `loan` (`id`, `loan_type`, `loan_amount`, `outstanding_amount`, `interest_rate`, `start_date`, `end_date`) VALUES (1, 'Home', 25000, 0.00, 2.50, '20230101', '20260101');
INSERT INTO `loan` (`id`, `loan_type`, `loan_amount`, `outstanding_amount`, `interest_rate`, `start_date`, `end_date`) VALUES (2, 'Auto', 5000, 0.00, 12.78, '20201212', '20230520');
INSERT INTO `loan` (`id`, `loan_type`, `loan_amount`, `outstanding_amount`, `interest_rate`, `start_date`, `end_date`) VALUES (3, 'Personal', 2000, 0.00, 8.50, '20201218', '20230519');

COMMIT;


-- -----------------------------------------------------
-- Data for table `weather_api`
-- -----------------------------------------------------
START TRANSACTION;
USE `bankappdb`;
INSERT INTO `weather_api` (`id`, `weather_city`, `weather_date`, `temperature`, `humidity`, `weather_status`) VALUES (1, 'Houston', '20230520', 95, 90, 'Sunny');
INSERT INTO `weather_api` (`id`, `weather_city`, `weather_date`, `temperature`, `humidity`, `weather_status`) VALUES (2, 'Denver', '20230521', 70, 40, 'Cloudy');
INSERT INTO `weather_api` (`id`, `weather_city`, `weather_date`, `temperature`, `humidity`, `weather_status`) VALUES (3, 'Dallas', '20230522', 80, 70, 'Rainy');

COMMIT;

