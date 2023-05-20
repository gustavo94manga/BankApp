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
  `user_address_id` INT NOT NULL,
  `user_detail_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_user_user_address_idx` (`user_address_id` ASC),
  INDEX `fk_user_user_detail1_idx` (`user_detail_id` ASC),
  CONSTRAINT `fk_user_user_address`
    FOREIGN KEY (`user_address_id`)
    REFERENCES `user_address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_user_detail1`
    FOREIGN KEY (`user_detail_id`)
    REFERENCES `user_detail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `account_number_UNIQUE` (`account_number` ASC),
  INDEX `fk_account_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_account_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transaction_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `transaction_type` ;

CREATE TABLE IF NOT EXISTS `transaction_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `payment` DOUBLE NULL,
  `deposit` DOUBLE NULL,
  `withdrawal` DOUBLE NULL,
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
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_loan_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_loan_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `transaction` ;

CREATE TABLE IF NOT EXISTS `transaction` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `transaction_amount` DOUBLE NOT NULL,
  `transaction_date` DATETIME NOT NULL,
  `description` VARCHAR(45) NULL,
  `transaction_type_id` INT NOT NULL,
  `loan_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_transaction_transaction_type1_idx` (`transaction_type_id` ASC),
  INDEX `fk_transaction_loan1_idx` (`loan_id` ASC),
  CONSTRAINT `fk_transaction_transaction_type1`
    FOREIGN KEY (`transaction_type_id`)
    REFERENCES `transaction_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_loan1`
    FOREIGN KEY (`loan_id`)
    REFERENCES `loan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_has_transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_transaction` ;

CREATE TABLE IF NOT EXISTS `user_has_transaction` (
  `user_id` INT NOT NULL,
  `transaction_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `transaction_id`),
  INDEX `fk_user_has_transaction_transaction1_idx` (`transaction_id` ASC),
  INDEX `fk_user_has_transaction_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_transaction_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_transaction_transaction1`
    FOREIGN KEY (`transaction_id`)
    REFERENCES `transaction` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transaction_has_account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `transaction_has_account` ;

CREATE TABLE IF NOT EXISTS `transaction_has_account` (
  `transaction_id` INT NOT NULL,
  `account_id` INT NOT NULL,
  PRIMARY KEY (`transaction_id`, `account_id`),
  INDEX `fk_transaction_has_account_account1_idx` (`account_id` ASC),
  INDEX `fk_transaction_has_account_transaction1_idx` (`transaction_id` ASC),
  CONSTRAINT `fk_transaction_has_account_transaction1`
    FOREIGN KEY (`transaction_id`)
    REFERENCES `transaction` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_has_account_account1`
    FOREIGN KEY (`account_id`)
    REFERENCES `account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank_address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bank_address` ;

CREATE TABLE IF NOT EXISTS `bank_address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `zip_code` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bank` ;

CREATE TABLE IF NOT EXISTS `bank` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `bank_address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bank_bank_address1_idx` (`bank_address_id` ASC),
  CONSTRAINT `fk_bank_bank_address1`
    FOREIGN KEY (`bank_address_id`)
    REFERENCES `bank_address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employee` ;

CREATE TABLE IF NOT EXISTS `employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `employee_number` INT NOT NULL,
  `bank_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_employees_bank1_idx` (`bank_id` ASC),
  CONSTRAINT `fk_employees_bank1`
    FOREIGN KEY (`bank_id`)
    REFERENCES `bank` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_has_bank`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_bank` ;

CREATE TABLE IF NOT EXISTS `user_has_bank` (
  `user_id` INT NOT NULL,
  `bank_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `bank_id`),
  INDEX `fk_user_has_bank_bank1_idx` (`bank_id` ASC),
  INDEX `fk_user_has_bank_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_bank_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_bank_bank1`
    FOREIGN KEY (`bank_id`)
    REFERENCES `bank` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `bankappdb`;
INSERT INTO `user` (`id`, `email`, `username`, `password`, `enabled`, `phone`, `last_login`, `user_address_id`, `user_detail_id`) VALUES (1, 'admin@java.com', 'admin', 'test', true, '123-456-7899', NULL, 1, 1);
INSERT INTO `user` (`id`, `email`, `username`, `password`, `enabled`, `phone`, `last_login`, `user_address_id`, `user_detail_id`) VALUES (2, 'angel@java.com', 'angel', 'test', true, '222-123-4567', NULL, 2, 2);
INSERT INTO `user` (`id`, `email`, `username`, `password`, `enabled`, `phone`, `last_login`, `user_address_id`, `user_detail_id`) VALUES (3, 'edwin@java.com', 'edwin', 'test', true, '111-832-5678', NULL, 3, 3);
INSERT INTO `user` (`id`, `email`, `username`, `password`, `enabled`, `phone`, `last_login`, `user_address_id`, `user_detail_id`) VALUES (4, 'jerry@java.com', 'jerry', 'test', false, '911-123-4567', NULL, 4, 4);
INSERT INTO `user` (`id`, `email`, `username`, `password`, `enabled`, `phone`, `last_login`, `user_address_id`, `user_detail_id`) VALUES (5, 'dom@java.com', 'dom', 'test', true, '321-456-7899', NULL, 5, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `account`
-- -----------------------------------------------------
START TRANSACTION;
USE `bankappdb`;
INSERT INTO `account` (`id`, `account_type`, `account_number`, `balance`, `account_status`, `opened_date`, `user_id`) VALUES (1, 'Checking', 123456789, 50.00, true, '20230519', 1);
INSERT INTO `account` (`id`, `account_type`, `account_number`, `balance`, `account_status`, `opened_date`, `user_id`) VALUES (2, 'Savings', 234567899, 25.00, true, '20230518', 2);
INSERT INTO `account` (`id`, `account_type`, `account_number`, `balance`, `account_status`, `opened_date`, `user_id`) VALUES (3, 'Credit', 345678999, 10.00, true, '20230517', 3);
INSERT INTO `account` (`id`, `account_type`, `account_number`, `balance`, `account_status`, `opened_date`, `user_id`) VALUES (4, 'Savings', 232425262, 1.00, false, '20230520', 4);
INSERT INTO `account` (`id`, `account_type`, `account_number`, `balance`, `account_status`, `opened_date`, `user_id`) VALUES (5, 'Checking', 987654321, 2.00, true, '20230520', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `transaction_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `bankappdb`;
INSERT INTO `transaction_type` (`id`, `payment`, `deposit`, `withdrawal`) VALUES (1, 10.00, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `loan`
-- -----------------------------------------------------
START TRANSACTION;
USE `bankappdb`;
INSERT INTO `loan` (`id`, `loan_type`, `loan_amount`, `outstanding_amount`, `interest_rate`, `start_date`, `end_date`, `user_id`) VALUES (1, 'Home', 25000, 0.00, 2.50, '20230101', '20260101', 1);
INSERT INTO `loan` (`id`, `loan_type`, `loan_amount`, `outstanding_amount`, `interest_rate`, `start_date`, `end_date`, `user_id`) VALUES (2, 'Auto', 5000, 0.00, 12.78, '20201212', '20230520', 2);
INSERT INTO `loan` (`id`, `loan_type`, `loan_amount`, `outstanding_amount`, `interest_rate`, `start_date`, `end_date`, `user_id`) VALUES (3, 'Personal', 2000, 0.00, 8.50, '20201218', '20230519', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `transaction`
-- -----------------------------------------------------
START TRANSACTION;
USE `bankappdb`;
INSERT INTO `transaction` (`id`, `transaction_amount`, `transaction_date`, `description`, `transaction_type_id`, `loan_id`) VALUES (1, 1.00, '20230520', NULL, 1, 1);
INSERT INTO `transaction` (`id`, `transaction_amount`, `transaction_date`, `description`, `transaction_type_id`, `loan_id`) VALUES (2, 15.00, '20230520', NULL, 1, 2);
INSERT INTO `transaction` (`id`, `transaction_amount`, `transaction_date`, `description`, `transaction_type_id`, `loan_id`) VALUES (3, 3.00, '20230519', NULL, 1, 3);
INSERT INTO `transaction` (`id`, `transaction_amount`, `transaction_date`, `description`, `transaction_type_id`, `loan_id`) VALUES (4, 8.00, '20230518', NULL, 1, 2);
INSERT INTO `transaction` (`id`, `transaction_amount`, `transaction_date`, `description`, `transaction_type_id`, `loan_id`) VALUES (5, 2.00, '20230521', NULL, 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_has_transaction`
-- -----------------------------------------------------
START TRANSACTION;
USE `bankappdb`;
INSERT INTO `user_has_transaction` (`user_id`, `transaction_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `transaction_has_account`
-- -----------------------------------------------------
START TRANSACTION;
USE `bankappdb`;
INSERT INTO `transaction_has_account` (`transaction_id`, `account_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `bank_address`
-- -----------------------------------------------------
START TRANSACTION;
USE `bankappdb`;
INSERT INTO `bank_address` (`id`, `address`, `city`, `state`, `zip_code`) VALUES (1, '999 Main St.', 'Miami', 'Fl', '33160');

COMMIT;


-- -----------------------------------------------------
-- Data for table `bank`
-- -----------------------------------------------------
START TRANSACTION;
USE `bankappdb`;
INSERT INTO `bank` (`id`, `name`, `bank_address_id`) VALUES (1, 'Chase', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `bankappdb`;
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `role`, `employee_number`, `bank_id`) VALUES (1, 'Edwin', 'Flatto', 'Manager', 12345, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_has_bank`
-- -----------------------------------------------------
START TRANSACTION;
USE `bankappdb`;
INSERT INTO `user_has_bank` (`user_id`, `bank_id`) VALUES (1, 1);

COMMIT;

