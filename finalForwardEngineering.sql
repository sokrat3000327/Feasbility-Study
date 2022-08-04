-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema clothesFactory
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `clothesFactory` ;

-- -----------------------------------------------------
-- Schema clothesFactory
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clothesFactory` DEFAULT CHARACTER SET utf8 ;
USE `clothesFactory` ;

-- -----------------------------------------------------
-- Table `clothesFactory`.`Department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`Department` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`Department` (
  `number` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `Dphone` CHAR(15) NOT NULL,
  PRIMARY KEY (`number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`employee` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`employee` (
  `phone` VARCHAR(11) NOT NULL,
  `ssn` CHAR(15) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `type` VARCHAR(15) NOT NULL,
  `Birthdate` DATE NOT NULL,
  `Department_number` INT NOT NULL,
  `TypeOfEmployee` VARCHAR(45) NOT NULL,
  `salary` DOUBLE NULL,
  PRIMARY KEY (`ssn`),
  INDEX `fk_employee_Department1_idx` (`Department_number` ASC),
  CONSTRAINT `fk_employee_Department1`
    FOREIGN KEY (`Department_number`)
    REFERENCES `clothesFactory`.`Department` (`number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`SalesRepresentative`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`SalesRepresentative` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`SalesRepresentative` (
  `employee_ssn` CHAR(15) NOT NULL,
  PRIMARY KEY (`employee_ssn`),
  CONSTRAINT `fk_Sales Representative_employee1`
    FOREIGN KEY (`employee_ssn`)
    REFERENCES `clothesFactory`.`employee` (`ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`Call center`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`Call center` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`Call center` (
  `employee_ssn` CHAR(15) NOT NULL,
  PRIMARY KEY (`employee_ssn`),
  CONSTRAINT `fk_Call center_employee1`
    FOREIGN KEY (`employee_ssn`)
    REFERENCES `clothesFactory`.`employee` (`ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`Website`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`Website` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`Website` (
  `name` VARCHAR(45) NOT NULL,
  `ipaddresse` VARCHAR(45) NOT NULL,
  `programmingLanguage` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ipaddresse`),
  UNIQUE INDEX `ipaddresse_UNIQUE` (`ipaddresse` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`Marketing_Representative`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`Marketing_Representative` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`Marketing_Representative` (
  `employee_ssn` CHAR(15) NOT NULL,
  `Website_ipaddresse` VARCHAR(45) NULL,
  PRIMARY KEY (`employee_ssn`),
  INDEX `fk_Marketing_Representative_Website1_idx` (`Website_ipaddresse` ASC),
  UNIQUE INDEX `Website_ipaddresse_UNIQUE` (`Website_ipaddresse` ASC),
  CONSTRAINT `fk_Marketing_Representative_employee1`
    FOREIGN KEY (`employee_ssn`)
    REFERENCES `clothesFactory`.`employee` (`ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Marketing_Representative_Website1`
    FOREIGN KEY (`Website_ipaddresse`)
    REFERENCES `clothesFactory`.`Website` (`ipaddresse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`ExportDepartment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`ExportDepartment` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`ExportDepartment` (
  `Department_number` INT NOT NULL,
  PRIMARY KEY (`Department_number`),
  CONSTRAINT `fk_ExportDepartment_Department1`
    FOREIGN KEY (`Department_number`)
    REFERENCES `clothesFactory`.`Department` (`number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`MaintainceDepartment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`MaintainceDepartment` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`MaintainceDepartment` (
  `Department_number` INT NOT NULL,
  PRIMARY KEY (`Department_number`),
  CONSTRAINT `fk_MaintainceDepartment_Department1`
    FOREIGN KEY (`Department_number`)
    REFERENCES `clothesFactory`.`Department` (`number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`ClothingManufactoringDepartment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`ClothingManufactoringDepartment` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`ClothingManufactoringDepartment` (
  `Department_number` INT NOT NULL,
  PRIMARY KEY (`Department_number`),
  CONSTRAINT `fk_ClothingManufactoringDepartment_Department1`
    FOREIGN KEY (`Department_number`)
    REFERENCES `clothesFactory`.`Department` (`number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`Tailor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`Tailor` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`Tailor` (
  `employee_ssn` CHAR(15) NOT NULL,
  PRIMARY KEY (`employee_ssn`),
  CONSTRAINT `fk_Tailor_employee1`
    FOREIGN KEY (`employee_ssn`)
    REFERENCES `clothesFactory`.`employee` (`ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`Factory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`Factory` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`Factory` (
  `name` VARCHAR(45) NOT NULL,
  `owner` VARCHAR(45) NOT NULL,
  `cost` INT NOT NULL,
  `space` VARCHAR(15) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`Branches`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`Branches` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`Branches` (
  `addresse` VARCHAR(45) NOT NULL,
  `number` INT NOT NULL,
  `Factory_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Factory_name`, `number`),
  INDEX `fk_Branches_Factory1_idx` (`Factory_name` ASC),
  CONSTRAINT `fk_Branches_Factory1`
    FOREIGN KEY (`Factory_name`)
    REFERENCES `clothesFactory`.`Factory` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`Feasibility Study`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`Feasibility Study` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`Feasibility Study` (
  `Branches_Factory_name` VARCHAR(45) NOT NULL,
  `Branches_number` INT NOT NULL,
  `feasibilityID` INT NOT NULL,
  PRIMARY KEY (`Branches_Factory_name`, `Branches_number`, `feasibilityID`),
  INDEX `fk_Feasibility Study_Branches1_idx` (`Branches_Factory_name` ASC, `Branches_number` ASC),
  CONSTRAINT `fk_Feasibility Study_Branches1`
    FOREIGN KEY (`Branches_Factory_name` , `Branches_number`)
    REFERENCES `clothesFactory`.`Branches` (`Factory_name` , `number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`MarketingStudy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`MarketingStudy` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`MarketingStudy` (
  `StudyID` INT NOT NULL,
  `Feasibility Study_Branches_Factory_name` VARCHAR(45) NULL,
  `Feasibility Study_Branches_number` INT NULL,
  `Feasibility Study_feasibilityID` INT NULL,
  PRIMARY KEY (`StudyID`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`),
  INDEX `fk_MarketingStudy_Feasibility Study1_idx` (`Feasibility Study_Branches_Factory_name` ASC, `Feasibility Study_Branches_number` ASC, `Feasibility Study_feasibilityID` ASC),
  CONSTRAINT `fk_MarketingStudy_Feasibility Study1`
    FOREIGN KEY (`Feasibility Study_Branches_Factory_name` , `Feasibility Study_Branches_number` , `Feasibility Study_feasibilityID`)
    REFERENCES `clothesFactory`.`Feasibility Study` (`Branches_Factory_name` , `Branches_number` , `feasibilityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`Product` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`Product` (
  `id` INT NOT NULL,
  `price` VARCHAR(10) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `quantity` INT NOT NULL,
  `Tailor_employee_ssn` CHAR(15) NULL,
  `MarketingStudy_StudyID` INT NULL,
  `MarketingStudy_Feasibility Study_Branches_Factory_name` VARCHAR(45) NULL,
  `MarketingStudy_Feasibility Study_Branches_number` INT NULL,
  `MarketingStudy_Feasibility Study_feasibilityID` INT NULL,
  PRIMARY KEY (`id`, `MarketingStudy_StudyID`, `MarketingStudy_Feasibility Study_Branches_Factory_name`, `MarketingStudy_Feasibility Study_Branches_number`, `MarketingStudy_Feasibility Study_feasibilityID`),
  INDEX `fk_Product_Tailor1_idx` (`Tailor_employee_ssn` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `Tailor_employee_ssn_UNIQUE` (`Tailor_employee_ssn` ASC),
  INDEX `fk_Product_MarketingStudy1_idx` (`MarketingStudy_StudyID` ASC, `MarketingStudy_Feasibility Study_Branches_Factory_name` ASC, `MarketingStudy_Feasibility Study_Branches_number` ASC, `MarketingStudy_Feasibility Study_feasibilityID` ASC),
  CONSTRAINT `fk_Product_Tailor1`
    FOREIGN KEY (`Tailor_employee_ssn`)
    REFERENCES `clothesFactory`.`Tailor` (`employee_ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_MarketingStudy1`
    FOREIGN KEY (`MarketingStudy_StudyID` , `MarketingStudy_Feasibility Study_Branches_Factory_name` , `MarketingStudy_Feasibility Study_Branches_number` , `MarketingStudy_Feasibility Study_feasibilityID`)
    REFERENCES `clothesFactory`.`MarketingStudy` (`StudyID` , `Feasibility Study_Branches_Factory_name` , `Feasibility Study_Branches_number` , `Feasibility Study_feasibilityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`Shops`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`Shops` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`Shops` (
  `Number` INT NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `Owner` VARCHAR(45) NOT NULL,
  `MarketingStudy_StudyID` INT NOT NULL,
  `MarketingStudy_Feasibility Study_Branches_Factory_name` VARCHAR(45) NOT NULL,
  `MarketingStudy_Feasibility Study_Branches_number` INT NOT NULL,
  `MarketingStudy_Feasibility Study_feasibilityID` INT NOT NULL,
  PRIMARY KEY (`Number`, `MarketingStudy_StudyID`, `MarketingStudy_Feasibility Study_Branches_Factory_name`, `MarketingStudy_Feasibility Study_Branches_number`, `MarketingStudy_Feasibility Study_feasibilityID`),
  INDEX `fk_Shops_MarketingStudy1_idx` (`MarketingStudy_StudyID` ASC, `MarketingStudy_Feasibility Study_Branches_Factory_name` ASC, `MarketingStudy_Feasibility Study_Branches_number` ASC, `MarketingStudy_Feasibility Study_feasibilityID` ASC),
  CONSTRAINT `fk_Shops_MarketingStudy1`
    FOREIGN KEY (`MarketingStudy_StudyID` , `MarketingStudy_Feasibility Study_Branches_Factory_name` , `MarketingStudy_Feasibility Study_Branches_number` , `MarketingStudy_Feasibility Study_feasibilityID`)
    REFERENCES `clothesFactory`.`MarketingStudy` (`StudyID` , `Feasibility Study_Branches_Factory_name` , `Feasibility Study_Branches_number` , `Feasibility Study_feasibilityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`Machines`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`Machines` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`Machines` (
  `id` INT NOT NULL,
  `type` VARCHAR(50) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `timeofwork` VARCHAR(20) NOT NULL,
  `cost` VARCHAR(10) NOT NULL,
  `number` INT NOT NULL,
  `MaintainceDepartment_Department_number` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Machines_MaintainceDepartment1_idx` (`MaintainceDepartment_Department_number` ASC),
  CONSTRAINT `fk_Machines_MaintainceDepartment1`
    FOREIGN KEY (`MaintainceDepartment_Department_number`)
    REFERENCES `clothesFactory`.`MaintainceDepartment` (`Department_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`needsOfShop`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`needsOfShop` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`needsOfShop` (
  `needs` VARCHAR(45) NOT NULL,
  `Shops_Number` INT NOT NULL,
  PRIMARY KEY (`needs`, `Shops_Number`),
  INDEX `fk_needsOfShop_Shops1_idx` (`Shops_Number` ASC),
  UNIQUE INDEX `needs_UNIQUE` (`needs` ASC),
  UNIQUE INDEX `Shops_Number_UNIQUE` (`Shops_Number` ASC),
  CONSTRAINT `fk_needsOfShop_Shops1`
    FOREIGN KEY (`Shops_Number`)
    REFERENCES `clothesFactory`.`Shops` (`Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`FinancialStudy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`FinancialStudy` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`FinancialStudy` (
  `funding resources` VARCHAR(45) NOT NULL,
  `theCurrentCapital` INT NOT NULL,
  `investmentsCosts` INT NOT NULL,
  `WagesAndSalaries` INT NOT NULL,
  `FactoryRent` INT NOT NULL,
  `electrictyBill` INT NOT NULL,
  `AdverstingExpenses` INT NOT NULL,
  `ReularMaintainceWork` INT NOT NULL,
  `StudyID` INT NOT NULL,
  `Feasibility Study_Branches_Factory_name` VARCHAR(45) NULL,
  `Feasibility Study_Branches_number` INT NULL,
  `Feasibility Study_feasibilityID` INT NULL,
  PRIMARY KEY (`StudyID`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`),
  INDEX `fk_FinancialStudy_Feasibility Study1_idx` (`Feasibility Study_Branches_Factory_name` ASC, `Feasibility Study_Branches_number` ASC, `Feasibility Study_feasibilityID` ASC),
  CONSTRAINT `fk_FinancialStudy_Feasibility Study1`
    FOREIGN KEY (`Feasibility Study_Branches_Factory_name` , `Feasibility Study_Branches_number` , `Feasibility Study_feasibilityID`)
    REFERENCES `clothesFactory`.`Feasibility Study` (`Branches_Factory_name` , `Branches_number` , `feasibilityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`clients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`clients` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`clients` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `phone` CHAR(11) NOT NULL,
  `addresse` VARCHAR(45) NOT NULL,
  `Website_ipaddresse` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_clients_Website1_idx` (`Website_ipaddresse` ASC),
  CONSTRAINT `fk_clients_Website1`
    FOREIGN KEY (`Website_ipaddresse`)
    REFERENCES `clothesFactory`.`Website` (`ipaddresse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`DealWith`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`DealWith` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`DealWith` (
  `SalesRepresentative_employee_ssn` CHAR(15) NOT NULL,
  `clients_id` INT NOT NULL,
  PRIMARY KEY (`SalesRepresentative_employee_ssn`, `clients_id`),
  INDEX `fk_Sales Representative_has_clients_clients1_idx` (`clients_id` ASC),
  INDEX `fk_Sales Representative_has_clients_Sales Representative1_idx` (`SalesRepresentative_employee_ssn` ASC),
  CONSTRAINT `fk_Sales Representative_has_clients_Sales Representative1`
    FOREIGN KEY (`SalesRepresentative_employee_ssn`)
    REFERENCES `clothesFactory`.`SalesRepresentative` (`employee_ssn`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Sales Representative_has_clients_clients1`
    FOREIGN KEY (`clients_id`)
    REFERENCES `clothesFactory`.`clients` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`CommunicateWith`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`CommunicateWith` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`CommunicateWith` (
  `clients_id` INT NOT NULL,
  `Call center_employee_ssn` CHAR(15) NOT NULL,
  PRIMARY KEY (`clients_id`, `Call center_employee_ssn`),
  INDEX `fk_clients_has_Call center_Call center1_idx` (`Call center_employee_ssn` ASC),
  INDEX `fk_clients_has_Call center_clients1_idx` (`clients_id` ASC),
  CONSTRAINT `fk_clients_has_Call center_clients1`
    FOREIGN KEY (`clients_id`)
    REFERENCES `clothesFactory`.`clients` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_clients_has_Call center_Call center1`
    FOREIGN KEY (`Call center_employee_ssn`)
    REFERENCES `clothesFactory`.`Call center` (`employee_ssn`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`Produce`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`Produce` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`Produce` (
  `Product_id` INT NOT NULL,
  `ClothingManufactoringDepartment_Department_number` INT NOT NULL,
  `Date` DATE NOT NULL,
  PRIMARY KEY (`Product_id`, `ClothingManufactoringDepartment_Department_number`),
  INDEX `fk_Product_has_ClothingManufactoringDepartment_ClothingManu_idx` (`ClothingManufactoringDepartment_Department_number` ASC),
  INDEX `fk_Product_has_ClothingManufactoringDepartment_Product1_idx` (`Product_id` ASC),
  CONSTRAINT `fk_Product_has_ClothingManufactoringDepartment_Product1`
    FOREIGN KEY (`Product_id`)
    REFERENCES `clothesFactory`.`Product` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Product_has_ClothingManufactoringDepartment_ClothingManufa1`
    FOREIGN KEY (`ClothingManufactoringDepartment_Department_number`)
    REFERENCES `clothesFactory`.`ClothingManufactoringDepartment` (`Department_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`Exports`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`Exports` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`Exports` (
  `noOfProductExported` INT NOT NULL,
  `noOfProductSold` INT NOT NULL,
  `ExportDepartment_Department_number` INT NOT NULL,
  `Shops_Number` INT NOT NULL,
  `Product_id` INT NOT NULL,
  PRIMARY KEY (`Shops_Number`, `Product_id`),
  INDEX `fk_Exports_Shops1_idx` (`Shops_Number` ASC),
  INDEX `fk_Exports_Product1_idx` (`Product_id` ASC),
  CONSTRAINT `fk_Exports_ExportDepartment1`
    FOREIGN KEY (`ExportDepartment_Department_number`)
    REFERENCES `clothesFactory`.`ExportDepartment` (`Department_number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Exports_Shops1`
    FOREIGN KEY (`Shops_Number`)
    REFERENCES `clothesFactory`.`Shops` (`Number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Exports_Product1`
    FOREIGN KEY (`Product_id`)
    REFERENCES `clothesFactory`.`Product` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`TechnicalStudy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`TechnicalStudy` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`TechnicalStudy` (
  `TypeOfNeededEmployees` VARCHAR(45) NOT NULL,
  `Number` INT NOT NULL,
  `StudyID` INT NOT NULL,
  `Feasibility Study_Branches_Factory_name` VARCHAR(45) NULL,
  `Feasibility Study_Branches_number` INT NULL,
  `Feasibility Study_feasibilityID` INT NULL,
  PRIMARY KEY (`StudyID`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`),
  INDEX `fk_TechnicalStudy_Feasibility Study1_idx` (`Feasibility Study_Branches_Factory_name` ASC, `Feasibility Study_Branches_number` ASC, `Feasibility Study_feasibilityID` ASC),
  CONSTRAINT `fk_TechnicalStudy_Feasibility Study1`
    FOREIGN KEY (`Feasibility Study_Branches_Factory_name` , `Feasibility Study_Branches_number` , `Feasibility Study_feasibilityID`)
    REFERENCES `clothesFactory`.`Feasibility Study` (`Branches_Factory_name` , `Branches_number` , `feasibilityID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`TechnicalStudy_has_Machines`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`TechnicalStudy_has_Machines` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`TechnicalStudy_has_Machines` (
  `TechnicalStudy_StudyID` INT NULL,
  `TechnicalStudy_Feasibility Study_Branches_Factory_name` VARCHAR(45) NULL,
  `TechnicalStudy_Feasibility Study_Branches_number` INT NULL,
  `TechnicalStudy_Feasibility Study_feasibilityID` INT NULL,
  `Machines_id` INT NOT NULL,
  PRIMARY KEY (`TechnicalStudy_StudyID`, `TechnicalStudy_Feasibility Study_Branches_Factory_name`, `TechnicalStudy_Feasibility Study_Branches_number`, `TechnicalStudy_Feasibility Study_feasibilityID`, `Machines_id`),
  INDEX `fk_TechnicalStudy_has_Machines_Machines1_idx` (`Machines_id` ASC),
  INDEX `fk_TechnicalStudy_has_Machines_TechnicalStudy1_idx` (`TechnicalStudy_StudyID` ASC, `TechnicalStudy_Feasibility Study_Branches_Factory_name` ASC, `TechnicalStudy_Feasibility Study_Branches_number` ASC, `TechnicalStudy_Feasibility Study_feasibilityID` ASC),
  CONSTRAINT `fk_TechnicalStudy_has_Machines_TechnicalStudy1`
    FOREIGN KEY (`TechnicalStudy_StudyID` , `TechnicalStudy_Feasibility Study_Branches_Factory_name` , `TechnicalStudy_Feasibility Study_Branches_number` , `TechnicalStudy_Feasibility Study_feasibilityID`)
    REFERENCES `clothesFactory`.`TechnicalStudy` (`StudyID` , `Feasibility Study_Branches_Factory_name` , `Feasibility Study_Branches_number` , `Feasibility Study_feasibilityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TechnicalStudy_has_Machines_Machines1`
    FOREIGN KEY (`Machines_id`)
    REFERENCES `clothesFactory`.`Machines` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothesFactory`.`FeasiblityStudyType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clothesFactory`.`FeasiblityStudyType` ;

CREATE TABLE IF NOT EXISTS `clothesFactory`.`FeasiblityStudyType` (
  `Type` VARCHAR(20) NOT NULL,
  `Feasibility Study_Branches_Factory_name` VARCHAR(45) NOT NULL,
  `Feasibility Study_Branches_number` INT NOT NULL,
  `Feasibility Study_feasibilityID` INT NOT NULL,
  PRIMARY KEY (`Type`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`),
  INDEX `fk_FeasiblityStudyType_Feasibility Study1_idx` (`Feasibility Study_Branches_Factory_name` ASC, `Feasibility Study_Branches_number` ASC, `Feasibility Study_feasibilityID` ASC),
  CONSTRAINT `fk_FeasiblityStudyType_Feasibility Study1`
    FOREIGN KEY (`Feasibility Study_Branches_Factory_name` , `Feasibility Study_Branches_number` , `Feasibility Study_feasibilityID`)
    REFERENCES `clothesFactory`.`Feasibility Study` (`Branches_Factory_name` , `Branches_number` , `feasibilityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`Department`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`Department` (`number`, `name`, `Dphone`) VALUES (1, 'ExportDepartment ', '0132783489');
INSERT INTO `clothesFactory`.`Department` (`number`, `name`, `Dphone`) VALUES (2, 'StatisticsDepartment', '0132547864');
INSERT INTO `clothesFactory`.`Department` (`number`, `name`, `Dphone`) VALUES (3, 'MaintainceDepartment', '0134464415');
INSERT INTO `clothesFactory`.`Department` (`number`, `name`, `Dphone`) VALUES (4, 'ClothingManufacto ringDepatment', '0136454652');
INSERT INTO `clothesFactory`.`Department` (`number`, `name`, `Dphone`) VALUES (5, 'HrDepartment', '01226587578');
INSERT INTO `clothesFactory`.`Department` (`number`, `name`, `Dphone`) VALUES (6, 'CleaningDepartment', '0156847576');
INSERT INTO `clothesFactory`.`Department` (`number`, `name`, `Dphone`) VALUES (7, 'SecutityDepartment', '0156847577');
INSERT INTO `clothesFactory`.`Department` (`number`, `name`, `Dphone`) VALUES (8, 'AverstingDepartment', '0156847555');

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`employee` (`phone`, `ssn`, `name`, `address`, `type`, `Birthdate`, `Department_number`, `TypeOfEmployee`, `salary`) VALUES ('01063802983', '123456789111110', 'Ahmed kamel hassan', ' abasia.cairo', 'M', '1993-12-09', 1, 'callCenter', 2500);
INSERT INTO `clothesFactory`.`employee` (`phone`, `ssn`, `name`, `address`, `type`, `Birthdate`, `Department_number`, `TypeOfEmployee`, `salary`) VALUES ('01055456644', '125211520121110', 'Ahmed hassan mohamed', ' abasia.cairo', 'M', '1993-09-03', 4, 'Tailor', 2000);
INSERT INTO `clothesFactory`.`employee` (`phone`, `ssn`, `name`, `address`, `type`, `Birthdate`, `Department_number`, `TypeOfEmployee`, `salary`) VALUES ('01347541443', '211122112121220', 'Ahmed mustafa kamael', ' abasia.cairo', 'M', '1994-04-04', 8, 'MarketingRepresentative', 4000);
INSERT INTO `clothesFactory`.`employee` (`phone`, `ssn`, `name`, `address`, `type`, `Birthdate`, `Department_number`, `TypeOfEmployee`, `salary`) VALUES ('01245564541', '011551101515410', 'Ahmed hussain mohamed', 'elmadie.cairo', 'M', '1997-04-06', 3, 'SalesRepresentative', 3500);
INSERT INTO `clothesFactory`.`employee` (`phone`, `ssn`, `name`, `address`, `type`, `Birthdate`, `Department_number`, `TypeOfEmployee`, `salary`) VALUES ('01226857872', '300012345678932', 'OmarAliHassan', 'elmohandessen.cairo', 'M', '2000-3-30', 1, 'callCenter', 2400);
INSERT INTO `clothesFactory`.`employee` (`phone`, `ssn`, `name`, `address`, `type`, `Birthdate`, `Department_number`, `TypeOfEmployee`, `salary`) VALUES ('01226587479', '300012345678456', 'AbanobAtefHamdi', 'AinShams.cairo', 'M', '2000-4-29', 5, 'HR', 3900);
INSERT INTO `clothesFactory`.`employee` (`phone`, `ssn`, `name`, `address`, `type`, `Birthdate`, `Department_number`, `TypeOfEmployee`, `salary`) VALUES ('01226587479', '300012345678753', 'MohamedAhmedMohamed', 'Elsalam.cairo', 'M', '1999-5-27', 6, 'Tailor', 2500);
INSERT INTO `clothesFactory`.`employee` (`phone`, `ssn`, `name`, `address`, `type`, `Birthdate`, `Department_number`, `TypeOfEmployee`, `salary`) VALUES ('01063802983', '123456789111119', 'Ahmed kamel hassan', ' abasia.cairo', 'M', '1993-12-10', 1, 'SalesRepresentative', 3000);
INSERT INTO `clothesFactory`.`employee` (`phone`, `ssn`, `name`, `address`, `type`, `Birthdate`, `Department_number`, `TypeOfEmployee`, `salary`) VALUES ('01063802984', '300012345678455', 'Ahmed hussain Omar', 'AinShams.cairo', 'M', '1999-5-24', 8, 'MarketingRepresentative', 4500);

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`SalesRepresentative`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`SalesRepresentative` (`employee_ssn`) VALUES ('01155110151541');
INSERT INTO `clothesFactory`.`SalesRepresentative` (`employee_ssn`) VALUES ('12345678911111');
INSERT INTO `clothesFactory`.`SalesRepresentative` (`employee_ssn`) VALUES ('12521152012111');
INSERT INTO `clothesFactory`.`SalesRepresentative` (`employee_ssn`) VALUES ('21112211212122');

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`Call center`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`Call center` (`employee_ssn`) VALUES ('123456789111110');
INSERT INTO `clothesFactory`.`Call center` (`employee_ssn`) VALUES ('300012345678932');

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`Website`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`Website` (`name`, `ipaddresse`, `programmingLanguage`) VALUES ('petrol', '192.168.1.1', 'php-js');
INSERT INTO `clothesFactory`.`Website` (`name`, `ipaddresse`, `programmingLanguage`) VALUES ('corner', '192.168.1.2', 'python-js');
INSERT INTO `clothesFactory`.`Website` (`name`, `ipaddresse`, `programmingLanguage`) VALUES ('catch', '192.168.1.3', 'php-Nodejs');
INSERT INTO `clothesFactory`.`Website` (`name`, `ipaddresse`, `programmingLanguage`) VALUES ('elhoot', '192.168.1.4', 'php-React');
INSERT INTO `clothesFactory`.`Website` (`name`, `ipaddresse`, `programmingLanguage`) VALUES ('elmasry', '192.168.1.5', 'python-Vuejs');

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`Marketing_Representative`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`Marketing_Representative` (`employee_ssn`, `Website_ipaddresse`) VALUES ('211122112121220', '192.168.1.1');
INSERT INTO `clothesFactory`.`Marketing_Representative` (`employee_ssn`, `Website_ipaddresse`) VALUES ('300012345678455', '192.168.1.4');

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`ExportDepartment`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`ExportDepartment` (`Department_number`) VALUES (1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`MaintainceDepartment`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`MaintainceDepartment` (`Department_number`) VALUES (3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`ClothingManufactoringDepartment`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`ClothingManufactoringDepartment` (`Department_number`) VALUES (4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`Tailor`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`Tailor` (`employee_ssn`) VALUES ('125211520121110');
INSERT INTO `clothesFactory`.`Tailor` (`employee_ssn`) VALUES ('300012345678753');

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`Factory`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`Factory` (`name`, `owner`, `cost`, `space`, `location`) VALUES ('FAC_1', 'Ahmed', 10000, '560 m^2', 'Cairo');
INSERT INTO `clothesFactory`.`Factory` (`name`, `owner`, `cost`, `space`, `location`) VALUES ('FAC_2', 'Mohamed', 15000, '500 m^2', 'Giza');
INSERT INTO `clothesFactory`.`Factory` (`name`, `owner`, `cost`, `space`, `location`) VALUES ('FAC_3', 'Ali', 9000, '600 m^2', 'Helwan');
INSERT INTO `clothesFactory`.`Factory` (`name`, `owner`, `cost`, `space`, `location`) VALUES ('FAC_4', 'Omar', 9500, '590 m^2', 'Banha');

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`Branches`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`Branches` (`addresse`, `number`, `Factory_name`) VALUES ('marg', 1, 'FAC_1');
INSERT INTO `clothesFactory`.`Branches` (`addresse`, `number`, `Factory_name`) VALUES ('ezbet el nakhal', 2, 'FAC_2');
INSERT INTO `clothesFactory`.`Branches` (`addresse`, `number`, `Factory_name`) VALUES ('ainshams', 3, 'FAC_3');
INSERT INTO `clothesFactory`.`Branches` (`addresse`, `number`, `Factory_name`) VALUES ('elmataria', 4, 'FAC_4');
INSERT INTO `clothesFactory`.`Branches` (`addresse`, `number`, `Factory_name`) VALUES ('MasrElgdeda', 5, 'FAC_1');
INSERT INTO `clothesFactory`.`Branches` (`addresse`, `number`, `Factory_name`) VALUES ('NasrCity', 6, 'FAC_2');
INSERT INTO `clothesFactory`.`Branches` (`addresse`, `number`, `Factory_name`) VALUES ('tagamohElkhams', 7, 'FAC_3');
INSERT INTO `clothesFactory`.`Branches` (`addresse`, `number`, `Factory_name`) VALUES ('GamalAbdelNasr', 8, 'FAC_4');

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`Feasibility Study`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`Feasibility Study` (`Branches_Factory_name`, `Branches_number`, `feasibilityID`) VALUES ('FAC_2', 2, 3940);
INSERT INTO `clothesFactory`.`Feasibility Study` (`Branches_Factory_name`, `Branches_number`, `feasibilityID`) VALUES ('FAC_4', 4, 4344);
INSERT INTO `clothesFactory`.`Feasibility Study` (`Branches_Factory_name`, `Branches_number`, `feasibilityID`) VALUES ('FAC_1', 1, 3738);
INSERT INTO `clothesFactory`.`Feasibility Study` (`Branches_Factory_name`, `Branches_number`, `feasibilityID`) VALUES ('FAC_3', 3, 4142);
INSERT INTO `clothesFactory`.`Feasibility Study` (`Branches_Factory_name`, `Branches_number`, `feasibilityID`) VALUES ('FAC_4', 4, 5152);
INSERT INTO `clothesFactory`.`Feasibility Study` (`Branches_Factory_name`, `Branches_number`, `feasibilityID`) VALUES ('FAC_1', 1, 5354);
INSERT INTO `clothesFactory`.`Feasibility Study` (`Branches_Factory_name`, `Branches_number`, `feasibilityID`) VALUES ('FAC_3', 3, 5758);
INSERT INTO `clothesFactory`.`Feasibility Study` (`Branches_Factory_name`, `Branches_number`, `feasibilityID`) VALUES ('FAC_4', 4, 5960);
INSERT INTO `clothesFactory`.`Feasibility Study` (`Branches_Factory_name`, `Branches_number`, `feasibilityID`) VALUES ('FAC_2', 6, 6364);
INSERT INTO `clothesFactory`.`Feasibility Study` (`Branches_Factory_name`, `Branches_number`, `feasibilityID`) VALUES ('FAC_3', 7, 6566);
INSERT INTO `clothesFactory`.`Feasibility Study` (`Branches_Factory_name`, `Branches_number`, `feasibilityID`) VALUES ('FAC_4', 8, 6768);
INSERT INTO `clothesFactory`.`Feasibility Study` (`Branches_Factory_name`, `Branches_number`, `feasibilityID`) VALUES ('FAC_2', 2, 4748);

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`MarketingStudy`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`MarketingStudy` (`StudyID`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES (2122, 'FAC_3', 3, 4142);
INSERT INTO `clothesFactory`.`MarketingStudy` (`StudyID`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES (2324, 'FAC_1', 1, 3738);
INSERT INTO `clothesFactory`.`MarketingStudy` (`StudyID`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES (2526, 'FAC_1', 1, 5354);
INSERT INTO `clothesFactory`.`MarketingStudy` (`StudyID`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES (2728, 'FAC_4', 4, 5960);
INSERT INTO `clothesFactory`.`MarketingStudy` (`StudyID`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES (6061, 'FAC_3', 3, 4142);
INSERT INTO `clothesFactory`.`MarketingStudy` (`StudyID`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES (6263, 'FAC_1', 1, 3738);
INSERT INTO `clothesFactory`.`MarketingStudy` (`StudyID`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES (6465, 'FAC_1', 1, 5354);

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`Product`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`Product` (`id`, `price`, `name`, `quantity`, `Tailor_employee_ssn`, `MarketingStudy_StudyID`, `MarketingStudy_Feasibility Study_Branches_Factory_name`, `MarketingStudy_Feasibility Study_Branches_number`, `MarketingStudy_Feasibility Study_feasibilityID`) VALUES (101, '30$', 'shirt', 30, '41394976584433', 2122, 'FAC_3', 3, 4142);
INSERT INTO `clothesFactory`.`Product` (`id`, `price`, `name`, `quantity`, `Tailor_employee_ssn`, `MarketingStudy_StudyID`, `MarketingStudy_Feasibility Study_Branches_Factory_name`, `MarketingStudy_Feasibility Study_Branches_number`, `MarketingStudy_Feasibility Study_feasibilityID`) VALUES (102, '20$', 'T_shirt', 20, '15647889944444', 2324, 'FAC_1', 1, 3738);
INSERT INTO `clothesFactory`.`Product` (`id`, `price`, `name`, `quantity`, `Tailor_employee_ssn`, `MarketingStudy_StudyID`, `MarketingStudy_Feasibility Study_Branches_Factory_name`, `MarketingStudy_Feasibility Study_Branches_number`, `MarketingStudy_Feasibility Study_feasibilityID`) VALUES (103, '30$', 'trouser', 40, '13488779865411', 2526, 'FAC_1', 1, 5354);
INSERT INTO `clothesFactory`.`Product` (`id`, `price`, `name`, `quantity`, `Tailor_employee_ssn`, `MarketingStudy_StudyID`, `MarketingStudy_Feasibility Study_Branches_Factory_name`, `MarketingStudy_Feasibility Study_Branches_number`, `MarketingStudy_Feasibility Study_feasibilityID`) VALUES (104, '35$', 'jacket', 50, '44896689797946', 2728, 'FAC_4', 4, 5960);
INSERT INTO `clothesFactory`.`Product` (`id`, `price`, `name`, `quantity`, `Tailor_employee_ssn`, `MarketingStudy_StudyID`, `MarketingStudy_Feasibility Study_Branches_Factory_name`, `MarketingStudy_Feasibility Study_Branches_number`, `MarketingStudy_Feasibility Study_feasibilityID`) VALUES (105, '34$', 'blouse', 60, '12124979984543', 2122, 'FAC_3', 3, 4142);

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`Shops`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`Shops` (`Number`, `location`, `Owner`, `MarketingStudy_StudyID`, `MarketingStudy_Feasibility Study_Branches_Factory_name`, `MarketingStudy_Feasibility Study_Branches_number`, `MarketingStudy_Feasibility Study_feasibilityID`) VALUES (11, 'New El-Marg.cairo		', 'Ahmed', 2122, 'FAC_3', 3, 4142);
INSERT INTO `clothesFactory`.`Shops` (`Number`, `location`, `Owner`, `MarketingStudy_StudyID`, `MarketingStudy_Feasibility Study_Branches_Factory_name`, `MarketingStudy_Feasibility Study_Branches_number`, `MarketingStudy_Feasibility Study_feasibilityID`) VALUES (12, 'Kebaa.cairo', 'Omar', 2324, 'FAC_1', 1, 4546);
INSERT INTO `clothesFactory`.`Shops` (`Number`, `location`, `Owner`, `MarketingStudy_StudyID`, `MarketingStudy_Feasibility Study_Branches_Factory_name`, `MarketingStudy_Feasibility Study_Branches_number`, `MarketingStudy_Feasibility Study_feasibilityID`) VALUES (13, 'Koleyet El Banat.cairo', 'Ali', 2526, 'FAC_1', 1, 5354);
INSERT INTO `clothesFactory`.`Shops` (`Number`, `location`, `Owner`, `MarketingStudy_StudyID`, `MarketingStudy_Feasibility Study_Branches_Factory_name`, `MarketingStudy_Feasibility Study_Branches_number`, `MarketingStudy_Feasibility Study_feasibilityID`) VALUES (14, 'El-Zahraa\'.cairo', 'Eslam', 2728, 'FAC_4', 4, 5960);
INSERT INTO `clothesFactory`.`Shops` (`Number`, `location`, `Owner`, `MarketingStudy_StudyID`, `MarketingStudy_Feasibility Study_Branches_Factory_name`, `MarketingStudy_Feasibility Study_Branches_number`, `MarketingStudy_Feasibility Study_feasibilityID`) VALUES (15, 'Al-Kawmeiah.cairo	', 'Abanob', 2324, 'FAC_1', 1, 4546);

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`Machines`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`Machines` (`id`, `type`, `name`, `timeofwork`, `cost`, `number`, `MaintainceDepartment_Department_number`) VALUES (1415412, 'Fabric cutting machine', 'CAUTION', '2Hours', '300$', 4, 3);
INSERT INTO `clothesFactory`.`Machines` (`id`, `type`, `name`, `timeofwork`, `cost`, `number`, `MaintainceDepartment_Department_number`) VALUES (2245461, 'normal machine', 'BAi', '1Hours', '400$', 2, 3);
INSERT INTO `clothesFactory`.`Machines` (`id`, `type`, `name`, `timeofwork`, `cost`, `number`, `MaintainceDepartment_Department_number`) VALUES (1455451, 'plot machine', 'SHAKTI', '3Hours', '500$', 3, 3);
INSERT INTO `clothesFactory`.`Machines` (`id`, `type`, `name`, `timeofwork`, `cost`, `number`, `MaintainceDepartment_Department_number`) VALUES (1515241, 'stitching machine', 'JUKI', '4Hours', '700$', 4, 3);
INSERT INTO `clothesFactory`.`Machines` (`id`, `type`, `name`, `timeofwork`, `cost`, `number`, `MaintainceDepartment_Department_number`) VALUES (1221464, 'ironing machine', 'PFAFF', '2Hours', '600$', 5, 3);
INSERT INTO `clothesFactory`.`Machines` (`id`, `type`, `name`, `timeofwork`, `cost`, `number`, `MaintainceDepartment_Department_number`) VALUES (6465644, 'cutting machine', 'SINGER', '3Hours', '550$', 2, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`needsOfShop`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`needsOfShop` (`needs`, `Shops_Number`) VALUES ('twenty of shirts', 11);
INSERT INTO `clothesFactory`.`needsOfShop` (`needs`, `Shops_Number`) VALUES ('thirty of t-shirts', 12);
INSERT INTO `clothesFactory`.`needsOfShop` (`needs`, `Shops_Number`) VALUES ('fourty of trousers', 13);
INSERT INTO `clothesFactory`.`needsOfShop` (`needs`, `Shops_Number`) VALUES ('fifty of blouses', 14);
INSERT INTO `clothesFactory`.`needsOfShop` (`needs`, `Shops_Number`) VALUES ('twenty of jackets', 15);

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`FinancialStudy`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`FinancialStudy` (`funding resources`, `theCurrentCapital`, `investmentsCosts`, `WagesAndSalaries`, `FactoryRent`, `electrictyBill`, `AdverstingExpenses`, `ReularMaintainceWork`, `StudyID`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('AlahyBank', 1000000, 1000000, 500000, 100000, 50000, 40000, 10000, 2930, 'FAC_1', 1, 3738);
INSERT INTO `clothesFactory`.`FinancialStudy` (`funding resources`, `theCurrentCapital`, `investmentsCosts`, `WagesAndSalaries`, `FactoryRent`, `electrictyBill`, `AdverstingExpenses`, `ReularMaintainceWork`, `StudyID`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('africanBank', 2000000, 3000000, 100000, 50000, 40000, 30000, 5000, 3132, 'FAC_4', 4, 4344);
INSERT INTO `clothesFactory`.`FinancialStudy` (`funding resources`, `theCurrentCapital`, `investmentsCosts`, `WagesAndSalaries`, `FactoryRent`, `electrictyBill`, `AdverstingExpenses`, `ReularMaintainceWork`, `StudyID`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('BankMasr', 3000000, 3000000, 600000, 40000, 20000, 70000, 20000, 3334, 'FAC_2', 2, 4748);
INSERT INTO `clothesFactory`.`FinancialStudy` (`funding resources`, `theCurrentCapital`, `investmentsCosts`, `WagesAndSalaries`, `FactoryRent`, `electrictyBill`, `AdverstingExpenses`, `ReularMaintainceWork`, `StudyID`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('CIBbank', 4000000, 2000000, 400000, 35000, 10000, 20000, 8000, 3536, 'FAC_4', 4, 4344);

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`clients`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`clients` (`id`, `name`, `phone`, `addresse`, `Website_ipaddresse`) VALUES (1001, 'wael mohamed', '01012441256', '252Adly Mansour.cairo ', '192.168.1.1');
INSERT INTO `clothesFactory`.`clients` (`id`, `name`, `phone`, `addresse`, `Website_ipaddresse`) VALUES (1002, 'adel nassim', '01052545412', '235Hikestep.cairo', '192.168.1.2');
INSERT INTO `clothesFactory`.`clients` (`id`, `name`, `phone`, `addresse`, `Website_ipaddresse`) VALUES (1003, 'mohamed eldosky', '04158545666', '323Kebaa.cairo', '192.168.1.1');
INSERT INTO `clothesFactory`.`clients` (`id`, `name`, `phone`, `addresse`, `Website_ipaddresse`) VALUES (1004, 'essam sasa', '01489499664', '656Hisham Barakat.cairo', '192.168.1.3');
INSERT INTO `clothesFactory`.`clients` (`id`, `name`, `phone`, `addresse`, `Website_ipaddresse`) VALUES (1005, 'ali 2dora', '05649694706', '658El-Shams Club.cairo', '192.168.1.2');
INSERT INTO `clothesFactory`.`clients` (`id`, `name`, `phone`, `addresse`, `Website_ipaddresse`) VALUES (1006, 'tamer hosny', '01984963414', '644Alf Masken.cairo', '192.168.1.1');
INSERT INTO `clothesFactory`.`clients` (`id`, `name`, `phone`, `addresse`, `Website_ipaddresse`) VALUES (1007, 'amr diab', '12041569456', '464Al-Hegaz Square.cairo', '192.168.1.4');
INSERT INTO `clothesFactory`.`clients` (`id`, `name`, `phone`, `addresse`, `Website_ipaddresse`) VALUES (1008, 'amr adeab', '01516152121', '466Cairo Stadium.cairo', '192.168.1.5');
INSERT INTO `clothesFactory`.`clients` (`id`, `name`, `phone`, `addresse`, `Website_ipaddresse`) VALUES (1009, 'wael elbaeshy', '05141646641', '466Naguib.cairo', '192.168.1.2');
INSERT INTO `clothesFactory`.`clients` (`id`, `name`, `phone`, `addresse`, `Website_ipaddresse`) VALUES (1010, 'mohamed morsy', '02541641163', '466Saad Zaghloul.cairo', '192.168.1.3');

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`DealWith`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`DealWith` (`SalesRepresentative_employee_ssn`, `clients_id`) VALUES ('12345678911111', 1001);
INSERT INTO `clothesFactory`.`DealWith` (`SalesRepresentative_employee_ssn`, `clients_id`) VALUES ('12345678911111', 1002);
INSERT INTO `clothesFactory`.`DealWith` (`SalesRepresentative_employee_ssn`, `clients_id`) VALUES ('12345678911111', 1003);
INSERT INTO `clothesFactory`.`DealWith` (`SalesRepresentative_employee_ssn`, `clients_id`) VALUES ('12521152012111', 1004);
INSERT INTO `clothesFactory`.`DealWith` (`SalesRepresentative_employee_ssn`, `clients_id`) VALUES ('21112211212122', 1005);
INSERT INTO `clothesFactory`.`DealWith` (`SalesRepresentative_employee_ssn`, `clients_id`) VALUES ('21112211212122', 1006);
INSERT INTO `clothesFactory`.`DealWith` (`SalesRepresentative_employee_ssn`, `clients_id`) VALUES ('01155110151541', 1007);
INSERT INTO `clothesFactory`.`DealWith` (`SalesRepresentative_employee_ssn`, `clients_id`) VALUES ('01155110151541', 1008);
INSERT INTO `clothesFactory`.`DealWith` (`SalesRepresentative_employee_ssn`, `clients_id`) VALUES ('01515512014165', 1009);
INSERT INTO `clothesFactory`.`DealWith` (`SalesRepresentative_employee_ssn`, `clients_id`) VALUES ('01515512014165', 1010);

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`CommunicateWith`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`CommunicateWith` (`clients_id`, `Call center_employee_ssn`) VALUES (1001, '05451215465111');
INSERT INTO `clothesFactory`.`CommunicateWith` (`clients_id`, `Call center_employee_ssn`) VALUES (1002, '05451215465111');
INSERT INTO `clothesFactory`.`CommunicateWith` (`clients_id`, `Call center_employee_ssn`) VALUES (1003, '11020511564120');
INSERT INTO `clothesFactory`.`CommunicateWith` (`clients_id`, `Call center_employee_ssn`) VALUES (1004, '11020511564120');
INSERT INTO `clothesFactory`.`CommunicateWith` (`clients_id`, `Call center_employee_ssn`) VALUES (1005, '11020511564125');
INSERT INTO `clothesFactory`.`CommunicateWith` (`clients_id`, `Call center_employee_ssn`) VALUES (1006, '11020511564125');
INSERT INTO `clothesFactory`.`CommunicateWith` (`clients_id`, `Call center_employee_ssn`) VALUES (1007, '01551101454121');
INSERT INTO `clothesFactory`.`CommunicateWith` (`clients_id`, `Call center_employee_ssn`) VALUES (1008, '01551101454121');
INSERT INTO `clothesFactory`.`CommunicateWith` (`clients_id`, `Call center_employee_ssn`) VALUES (1009, '00215551440504');
INSERT INTO `clothesFactory`.`CommunicateWith` (`clients_id`, `Call center_employee_ssn`) VALUES (1010, '00215551440504');

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`Produce`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`Produce` (`Product_id`, `ClothingManufactoringDepartment_Department_number`, `Date`) VALUES (101, 4, '2021-1-1');
INSERT INTO `clothesFactory`.`Produce` (`Product_id`, `ClothingManufactoringDepartment_Department_number`, `Date`) VALUES (102, 4, '2021-1-1');
INSERT INTO `clothesFactory`.`Produce` (`Product_id`, `ClothingManufactoringDepartment_Department_number`, `Date`) VALUES (103, 4, '2021-1-1');
INSERT INTO `clothesFactory`.`Produce` (`Product_id`, `ClothingManufactoringDepartment_Department_number`, `Date`) VALUES (104, 4, '2021-1-1');
INSERT INTO `clothesFactory`.`Produce` (`Product_id`, `ClothingManufactoringDepartment_Department_number`, `Date`) VALUES (105, 4, '2021-1-1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`Exports`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`Exports` (`noOfProductExported`, `noOfProductSold`, `ExportDepartment_Department_number`, `Shops_Number`, `Product_id`) VALUES (30, 20, 1, 11, 101);
INSERT INTO `clothesFactory`.`Exports` (`noOfProductExported`, `noOfProductSold`, `ExportDepartment_Department_number`, `Shops_Number`, `Product_id`) VALUES (20, 10, 1, 12, 102);
INSERT INTO `clothesFactory`.`Exports` (`noOfProductExported`, `noOfProductSold`, `ExportDepartment_Department_number`, `Shops_Number`, `Product_id`) VALUES (40, 30, 1, 13, 103);
INSERT INTO `clothesFactory`.`Exports` (`noOfProductExported`, `noOfProductSold`, `ExportDepartment_Department_number`, `Shops_Number`, `Product_id`) VALUES (50, 25, 1, 14, 104);

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`TechnicalStudy`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`TechnicalStudy` (`TypeOfNeededEmployees`, `Number`, `StudyID`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('Tailor', 4, 1234, 'FAC_2', 2, 3940);
INSERT INTO `clothesFactory`.`TechnicalStudy` (`TypeOfNeededEmployees`, `Number`, `StudyID`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('HR', 3, 4567, 'FAC_3', 3, 4142);
INSERT INTO `clothesFactory`.`TechnicalStudy` (`TypeOfNeededEmployees`, `Number`, `StudyID`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('SecurityMan', 8, 8910, 'FAC_2', 2, 3940);
INSERT INTO `clothesFactory`.`TechnicalStudy` (`TypeOfNeededEmployees`, `Number`, `StudyID`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('SalesRepresentative', 6, 1112, 'FAC_3', 3, 4142);
INSERT INTO `clothesFactory`.`TechnicalStudy` (`TypeOfNeededEmployees`, `Number`, `StudyID`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('CallCenter', 7, 1314, 'FAC_1', 1, 3738);
INSERT INTO `clothesFactory`.`TechnicalStudy` (`TypeOfNeededEmployees`, `Number`, `StudyID`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('SalesRepresentative', 2, 1516, 'FAC_2', 6, 6364);
INSERT INTO `clothesFactory`.`TechnicalStudy` (`TypeOfNeededEmployees`, `Number`, `StudyID`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('HR', 5, 1718, 'FAC_3', 7, 6566);
INSERT INTO `clothesFactory`.`TechnicalStudy` (`TypeOfNeededEmployees`, `Number`, `StudyID`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('Tailor', 15, 1920, 'FAC_4', 8, 6768);

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`TechnicalStudy_has_Machines`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`TechnicalStudy_has_Machines` (`TechnicalStudy_StudyID`, `TechnicalStudy_Feasibility Study_Branches_Factory_name`, `TechnicalStudy_Feasibility Study_Branches_number`, `TechnicalStudy_Feasibility Study_feasibilityID`, `Machines_id`) VALUES (1234, 'FAC_2', 2, 3940, 1415412);
INSERT INTO `clothesFactory`.`TechnicalStudy_has_Machines` (`TechnicalStudy_StudyID`, `TechnicalStudy_Feasibility Study_Branches_Factory_name`, `TechnicalStudy_Feasibility Study_Branches_number`, `TechnicalStudy_Feasibility Study_feasibilityID`, `Machines_id`) VALUES (4567, 'FAC_3', 3, 4950, 2245461);
INSERT INTO `clothesFactory`.`TechnicalStudy_has_Machines` (`TechnicalStudy_StudyID`, `TechnicalStudy_Feasibility Study_Branches_Factory_name`, `TechnicalStudy_Feasibility Study_Branches_number`, `TechnicalStudy_Feasibility Study_feasibilityID`, `Machines_id`) VALUES (8910, 'FAC_2', 2, 3940, 2245461);
INSERT INTO `clothesFactory`.`TechnicalStudy_has_Machines` (`TechnicalStudy_StudyID`, `TechnicalStudy_Feasibility Study_Branches_Factory_name`, `TechnicalStudy_Feasibility Study_Branches_number`, `TechnicalStudy_Feasibility Study_feasibilityID`, `Machines_id`) VALUES (1112, 'FAC_3', 3, 4142, 1455451);
INSERT INTO `clothesFactory`.`TechnicalStudy_has_Machines` (`TechnicalStudy_StudyID`, `TechnicalStudy_Feasibility Study_Branches_Factory_name`, `TechnicalStudy_Feasibility Study_Branches_number`, `TechnicalStudy_Feasibility Study_feasibilityID`, `Machines_id`) VALUES (1234, 'FAC_2', 2, 3940, 1515241);
INSERT INTO `clothesFactory`.`TechnicalStudy_has_Machines` (`TechnicalStudy_StudyID`, `TechnicalStudy_Feasibility Study_Branches_Factory_name`, `TechnicalStudy_Feasibility Study_Branches_number`, `TechnicalStudy_Feasibility Study_feasibilityID`, `Machines_id`) VALUES (4567, 'FAC_3', 3, 4142, 1221464);
INSERT INTO `clothesFactory`.`TechnicalStudy_has_Machines` (`TechnicalStudy_StudyID`, `TechnicalStudy_Feasibility Study_Branches_Factory_name`, `TechnicalStudy_Feasibility Study_Branches_number`, `TechnicalStudy_Feasibility Study_feasibilityID`, `Machines_id`) VALUES (8910, 'FAC_2', 2, 3940, 6465644);
INSERT INTO `clothesFactory`.`TechnicalStudy_has_Machines` (`TechnicalStudy_StudyID`, `TechnicalStudy_Feasibility Study_Branches_Factory_name`, `TechnicalStudy_Feasibility Study_Branches_number`, `TechnicalStudy_Feasibility Study_feasibilityID`, `Machines_id`) VALUES (1112, 'FAC_3', 3, 4142, 1415412);

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothesFactory`.`FeasiblityStudyType`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothesFactory`;
INSERT INTO `clothesFactory`.`FeasiblityStudyType` (`Type`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('financial', 'FAC_1', 1, 3738);
INSERT INTO `clothesFactory`.`FeasiblityStudyType` (`Type`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('financial', 'FAC_4', 4, 4344);
INSERT INTO `clothesFactory`.`FeasiblityStudyType` (`Type`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('financial', 'FAC_2', 2, 4748);
INSERT INTO `clothesFactory`.`FeasiblityStudyType` (`Type`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('financial', 'FAC_4', 4, 5152);
INSERT INTO `clothesFactory`.`FeasiblityStudyType` (`Type`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('marketing', 'FAC_1', 1, 3738);
INSERT INTO `clothesFactory`.`FeasiblityStudyType` (`Type`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('marketing', 'FAC_3', 3, 4142);
INSERT INTO `clothesFactory`.`FeasiblityStudyType` (`Type`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('marketing', 'FAC_2', 2, 4748);
INSERT INTO `clothesFactory`.`FeasiblityStudyType` (`Type`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('marketing', 'FAC_1', 1, 5354);
INSERT INTO `clothesFactory`.`FeasiblityStudyType` (`Type`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('marketing', 'FAC_4', 4, 5960);
INSERT INTO `clothesFactory`.`FeasiblityStudyType` (`Type`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('technical', 'FAC_1', 1, 3738);
INSERT INTO `clothesFactory`.`FeasiblityStudyType` (`Type`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('technical', 'FAC_2', 2, 3940);
INSERT INTO `clothesFactory`.`FeasiblityStudyType` (`Type`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('technical', 'FAC_3', 3, 4142);
INSERT INTO `clothesFactory`.`FeasiblityStudyType` (`Type`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('technical', 'FAC_2', 2, 4748);
INSERT INTO `clothesFactory`.`FeasiblityStudyType` (`Type`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('technical', 'FAC_3', 3, 5758);
INSERT INTO `clothesFactory`.`FeasiblityStudyType` (`Type`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('technical', 'FAC_2', 6, 6364);
INSERT INTO `clothesFactory`.`FeasiblityStudyType` (`Type`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('technical', 'FAC_3', 7, 6566);
INSERT INTO `clothesFactory`.`FeasiblityStudyType` (`Type`, `Feasibility Study_Branches_Factory_name`, `Feasibility Study_Branches_number`, `Feasibility Study_feasibilityID`) VALUES ('technical', 'FAC_4', 8, 6768);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
