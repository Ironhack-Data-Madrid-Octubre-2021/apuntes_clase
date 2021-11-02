-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_mysql` DEFAULT CHARACTER SET utf8 ;
USE `lab_mysql` ;

-- -----------------------------------------------------
-- Table `lab_mysql`.`salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`salespersons` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `staff_id` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`invoices` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `invoice_number` VARCHAR(45) NULL,
  `date` VARCHAR(45) NULL,
  `car` VARCHAR(45) NULL,
  `customer` VARCHAR(45) NULL,
  `sales_person` VARCHAR(45) NULL,
  `salespersons_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_invoices_salespersons_idx` (`salespersons_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_salespersons`
    FOREIGN KEY (`salespersons_id`)
    REFERENCES `lab_mysql`.`salespersons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`cars` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `vin` VARCHAR(45) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` VARCHAR(45) NULL,
  `color` VARCHAR(45) NULL,
  `invoices_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cars_invoices1_idx` (`invoices_id` ASC) VISIBLE,
  CONSTRAINT `fk_cars_invoices1`
    FOREIGN KEY (`invoices_id`)
    REFERENCES `lab_mysql`.`invoices` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`customers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `postal` INT NULL,
  `invoices_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_customers_invoices1_idx` (`invoices_id` ASC) VISIBLE,
  CONSTRAINT `fk_customers_invoices1`
    FOREIGN KEY (`invoices_id`)
    REFERENCES `lab_mysql`.`invoices` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
