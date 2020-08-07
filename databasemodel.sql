-- MySQL Workbench Forward Engineering
-- Script name: DatabaseModel.sql
-- Author: Zachary Ma
-- Purpose: Creating Default Database Tables
-- DROP DATABASE `ArtGalleryManagementDB`;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Schema ArtGalleryManagementDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ArtGalleryManagementDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ArtGalleryManagementDB` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `ArtGalleryManagementDB` ;

-- Drop all table data if exists --
DROP TABLE IF EXISTS Administrator;
DROP TABLE IF EXISTS ArtistType;
DROP TABLE IF EXISTS Bought;
DROP TABLE IF EXISTS BoughtStatus;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Contact;
DROP TABLE IF EXISTS Delivery;
DROP TABLE IF EXISTS Exhibition;
DROP TABLE IF EXISTS ExhibitionStaging;
DROP TABLE IF EXISTS News;
DROP TABLE IF EXISTS OrderStatus;
DROP TABLE IF EXISTS Paintings;
DROP TABLE IF EXISTS PaintingStatus;
DROP TABLE IF EXISTS PaymentMethod;
DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS PaymentType;
DROP TABLE IF EXISTS Purchases;
DROP TABLE IF EXISTS Receipt;
DROP TABLE IF EXISTS ReceiptStatus;
DROP TABLE IF EXISTS RegisteredUsers;
DROP TABLE IF EXISTS Shipping;
DROP TABLE IF EXISTS ShippingItems;
DROP TABLE IF EXISTS SocialMedia;
DROP TABLE IF EXISTS TempUser;
DROP TABLE IF EXISTS ToBuy;
DROP TABLE IF EXISTS WebSite;


-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`Exhibition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`Exhibition` (
  `Exhibition_ID` INT NOT NULL AUTO_INCREMENT,
  `Date_Started` VARCHAR(45) NOT NULL,
  `Date_Created` VARCHAR(45) NOT NULL,
  `Exhibition_Name` VARCHAR(45) NOT NULL,
  `Exhibtion_Desc` VARCHAR(45) NOT NULL,
  `Misc_Details` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Exhibition_ID`),
  UNIQUE INDEX `Exhibition_ID_UNIQUE` (`Exhibition_ID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`WebSite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`WebSite` (
  `WebSite_ID` INT NOT NULL AUTO_INCREMENT,
  `Exhibition_ID` INT NOT NULL,
  `Misc_Exhibtion_Data` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`WebSite_ID`),
  INDEX `Exhibition_ID_idx` (`Exhibition_ID` ASC) VISIBLE,
  CONSTRAINT `Website-Exhibition`
    FOREIGN KEY (`Exhibition_ID`)
    REFERENCES `ArtGalleryManagementDB`.`Exhibition` (`Exhibition_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`Administrator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`Administrator` (
  `Administrator_ID` INT NOT NULL AUTO_INCREMENT,
  `WebSite_ID` INT NOT NULL,
  `UserName` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Administrator_ID`),
  UNIQUE INDEX `idAdministrator_UNIQUE` (`Administrator_ID` ASC) VISIBLE,
  INDEX `WebSite_ID_idx` (`WebSite_ID` ASC) VISIBLE,
  CONSTRAINT `Admin-Website`
    FOREIGN KEY (`WebSite_ID`)
    REFERENCES `ArtGalleryManagementDB`.`WebSite` (`WebSite_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`ArtistType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`ArtistType` (
  `ArtistType` VARCHAR(45) NOT NULL,
  `TypeDesc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ArtistType`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`Artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`Artist` (
  `Artist_ID` INT NOT NULL AUTO_INCREMENT,
  `ArtistType` VARCHAR(45) NOT NULL,
  `Artist_Name` VARCHAR(45) NOT NULL,
  `Artist_Photo` VARCHAR(128) NOT NULL,
  `Artist_Desc` VARCHAR(45) NOT NULL,
  `Birth_City` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `DOB` VARCHAR(45) NOT NULL,
  `Death` VARCHAR(45) NOT NULL,
  `Misc_Artist_Details` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Artist_ID`),
  UNIQUE INDEX `Artist_ID_UNIQUE` (`Artist_ID` ASC) VISIBLE,
  INDEX `Artist_Type_idx` (`ArtistType` ASC) VISIBLE,
  CONSTRAINT `Artist_Type`
    FOREIGN KEY (`ArtistType`)
    REFERENCES `ArtGalleryManagementDB`.`ArtistType` (`ArtistType`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`Categories` (
  `Category_Type` INT NOT NULL AUTO_INCREMENT,
  `MainCatType` VARCHAR(45) NOT NULL,
  `CatDesc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Category_Type`),
  UNIQUE INDEX `Category_Type_UNIQUE` (`Category_Type` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`PaintingStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`PaintingStatus` (
  `PaintingStatus` INT NOT NULL AUTO_INCREMENT,
  `ArtworkStatus` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PaintingStatus`),
  UNIQUE INDEX `PaintingStatusCode_UNIQUE` (`PaintingStatus` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`Paintings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`Paintings` (
  `Painting_ID` INT NOT NULL AUTO_INCREMENT,
  `Artist_ID` INT NOT NULL,
  `CatType` VARCHAR(45) NOT NULL,
  `Category_Type` INT NOT NULL,
  `PaintStatus` INT NOT NULL,
  `Title` VARCHAR(45) NOT NULL,
  `StartingPrice` VARCHAR(45) NOT NULL,
  `SoldPrice` VARCHAR(45) NOT NULL,
  `Size` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  `Photo_FileName` VARCHAR(128) NOT NULL,
  `Misc_Painting_Details` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Painting_ID`),
  UNIQUE INDEX `idPaintings_UNIQUE` (`Painting_ID` ASC) VISIBLE,
  UNIQUE INDEX `Title_UNIQUE` (`Title` ASC) VISIBLE,
  INDEX `Category_Type_idx` (`Category_Type` ASC) VISIBLE,
  INDEX `PaintingStatus_idx` (`PaintStatus` ASC) VISIBLE,
  INDEX `Artist_ID_idx` (`Artist_ID` ASC) VISIBLE,
  CONSTRAINT `Paintin-Artist`
    FOREIGN KEY (`Artist_ID`)
    REFERENCES `ArtGalleryManagementDB`.`Artist` (`Artist_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Painting-Cat`
    FOREIGN KEY (`Category_Type`)
    REFERENCES `ArtGalleryManagementDB`.`Categories` (`Category_Type`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Painting-Status`
    FOREIGN KEY (`PaintStatus`)
    REFERENCES `ArtGalleryManagementDB`.`PaintingStatus` (`PaintingStatus`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`RegisteredUsers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`RegisteredUsers` (
  `RegisterUser_ID` INT NOT NULL AUTO_INCREMENT,
  `Address` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `Company` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `Gender` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `UserName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`RegisterUser_ID`),
  UNIQUE INDEX `RegistedUser_ID_UNIQUE` (`RegisterUser_ID` ASC) VISIBLE,
  UNIQUE INDEX `UserName_UNIQUE` (`UserName` ASC) VISIBLE,
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`OrderStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`OrderStatus` (
  `OrderStatus_ID` INT NOT NULL AUTO_INCREMENT,
  `OrderStatus_Desc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`OrderStatus_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`Purchases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`Purchases` (
  `Purchase_ID` INT NOT NULL AUTO_INCREMENT,
  `RegisterUser_ID` INT NOT NULL,
  `OrderStatus_ID` INT NOT NULL,
  `DatePlaced` VARCHAR(45) NOT NULL,
  `Misc_Order_Desc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Purchase_ID`),
  INDEX `RegisterUser_ID_idx` (`RegisterUser_ID` ASC) VISIBLE,
  INDEX `OrderStatus_ID_idx` (`OrderStatus_ID` ASC) VISIBLE,
  CONSTRAINT `Purchase-Register`
    FOREIGN KEY (`RegisterUser_ID`)
    REFERENCES `ArtGalleryManagementDB`.`RegisteredUsers` (`RegisterUser_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Purchase-Status`
    FOREIGN KEY (`OrderStatus_ID`)
    REFERENCES `ArtGalleryManagementDB`.`OrderStatus` (`OrderStatus_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`BoughtStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`BoughtStatus` (
  `BoughtStatus` INT NOT NULL AUTO_INCREMENT,
  `Misc_Bought` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`BoughtStatus`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`Bought`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`Bought` (
  `Bought_ID` INT NOT NULL AUTO_INCREMENT,
  `Painting_ID` INT NOT NULL,
  `Purchase_ID` INT NOT NULL,
  `Bought_Status` INT NOT NULL,
  `Bought_Amount` VARCHAR(45) NOT NULL,
  `Bought_Price` VARCHAR(45) NOT NULL,
  `Misc_Bought_Desc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Bought_ID`),
  INDEX `Purchaese_ID_idx` (`Purchase_ID` ASC) VISIBLE,
  INDEX `Painting_ID_idx` (`Painting_ID` ASC) VISIBLE,
  INDEX `BoughtStatus_idx` (`Bought_Status` ASC) VISIBLE,
  CONSTRAINT `Bought-Painting`
    FOREIGN KEY (`Painting_ID`)
    REFERENCES `ArtGalleryManagementDB`.`Paintings` (`Painting_ID`),
  CONSTRAINT `Bought-Purchase`
    FOREIGN KEY (`Purchase_ID`)
    REFERENCES `ArtGalleryManagementDB`.`Purchases` (`Purchase_ID`),
  CONSTRAINT `Bought-Status`
    FOREIGN KEY (`Bought_Status`)
    REFERENCES `ArtGalleryManagementDB`.`BoughtStatus` (`BoughtStatus`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`Contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`Contact` (
  `Contact_ID` INT NOT NULL AUTO_INCREMENT,
  `Company_Name` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `ZipCode` INT NOT NULL,
  `Contactcol` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(45) NOT NULL,
  `Website_ID` INT NOT NULL,
  PRIMARY KEY (`Contact_ID`),
  UNIQUE INDEX `Contact_ID_UNIQUE` (`Contact_ID` ASC) VISIBLE,
  INDEX `Website_ID_idx` (`Website_ID` ASC) VISIBLE,
  CONSTRAINT `Contact-WebSite`
    FOREIGN KEY (`Website_ID`)
    REFERENCES `ArtGalleryManagementDB`.`WebSite` (`WebSite_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`ExhibitionStaging`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`ExhibitionStaging` (
  `Exhibition_Id` INT NOT NULL,
  `Painting_ID` INT NOT NULL,
  INDEX `Exhibitions_idx` (`Exhibition_Id` ASC) VISIBLE,
  INDEX `Painting_ID_idx` (`Painting_ID` ASC) VISIBLE,
  CONSTRAINT `Staging-Exhibition`
    FOREIGN KEY (`Exhibition_Id`)
    REFERENCES `ArtGalleryManagementDB`.`Exhibition` (`Exhibition_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Staging-Paintings`
    FOREIGN KEY (`Painting_ID`)
    REFERENCES `ArtGalleryManagementDB`.`Paintings` (`Painting_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`PaymentMethod`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`PaymentMethod` (
  `PaymentType` INT NOT NULL AUTO_INCREMENT,
  `Payment_Desc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PaymentType`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`PaymentType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`PaymentType` (
  `RegisteredUserPayment_ID` INT NOT NULL,
  `RegisterUser_ID` INT NOT NULL,
  `PaymentType` INT NOT NULL,
  `Card` INT NOT NULL,
  `CVC` INT NOT NULL,
  `Expiration` INT NOT NULL,
  `ZipCode` INT NOT NULL,
  PRIMARY KEY (`RegisteredUserPayment_ID`),
  UNIQUE INDEX `Card_UNIQUE` (`Card` ASC) VISIBLE,
  INDEX `PaymentType_idx` (`PaymentType` ASC) VISIBLE,
  INDEX `RegisterUser_ID_idx` (`RegisterUser_ID` ASC) VISIBLE,
  CONSTRAINT `Payment-Method`
    FOREIGN KEY (`PaymentType`)
    REFERENCES `ArtGalleryManagementDB`.`PaymentMethod` (`PaymentType`),
  CONSTRAINT `Payment-Register`
    FOREIGN KEY (`RegisterUser_ID`)
    REFERENCES `ArtGalleryManagementDB`.`RegisteredUsers` (`RegisterUser_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`ReceiptStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`ReceiptStatus` (
  `ReceiptStatus` INT NOT NULL AUTO_INCREMENT,
  `Misc_Receipt_Desc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ReceiptStatus`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`Receipt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`Receipt` (
  `Receipt_ID` INT NOT NULL AUTO_INCREMENT,
  `Purchase_ID` INT NOT NULL,
  `ReceiptStatus_ID` INT NOT NULL,
  `Misc_Receipt` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Receipt_ID`),
  INDEX `Purchase_ID_idx` (`Purchase_ID` ASC) VISIBLE,
  INDEX `ReceiptStatus_idx` (`ReceiptStatus_ID` ASC) VISIBLE,
  CONSTRAINT `Receipt-Purchase`
    FOREIGN KEY (`Purchase_ID`)
    REFERENCES `ArtGalleryManagementDB`.`Purchases` (`Purchase_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Receipt-Status`
    FOREIGN KEY (`ReceiptStatus_ID`)
    REFERENCES `ArtGalleryManagementDB`.`ReceiptStatus` (`ReceiptStatus`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`Payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`Payments` (
  `Payments_ID` INT NOT NULL AUTO_INCREMENT,
  `Receipt_ID` INT NOT NULL,
  PRIMARY KEY (`Payments_ID`),
  INDEX `Receipt_ID_idx` (`Receipt_ID` ASC) VISIBLE,
  CONSTRAINT `Payment-Receipt`
    FOREIGN KEY (`Receipt_ID`)
    REFERENCES `ArtGalleryManagementDB`.`Receipt` (`Receipt_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`Delivery` (
  `Delivery_ID` INT NOT NULL AUTO_INCREMENT,
  `Shipping_ID` INT NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `From_Address` VARCHAR(45) NOT NULL,
  `Date` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Delivery_ID`),
  UNIQUE INDEX `Delivery_ID_UNIQUE` (`Delivery_ID` ASC) VISIBLE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`Shipping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`Shipping` (
  `Shipping_ID` INT NOT NULL AUTO_INCREMENT,
  `Purchase_ID` INT NOT NULL,
  `Receipt_ID` INT NOT NULL,
  PRIMARY KEY (`Shipping_ID`),
  INDEX `Receipt_ID_idx` (`Receipt_ID` ASC) VISIBLE,
  INDEX `Purchase_ID_idx` (`Purchase_ID` ASC) VISIBLE,
  CONSTRAINT `Shipping-Purchase`
    FOREIGN KEY (`Purchase_ID`)
    REFERENCES `ArtGalleryManagementDB`.`Purchases` (`Purchase_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Shipping-Receipt`
    FOREIGN KEY (`Receipt_ID`)
    REFERENCES `ArtGalleryManagementDB`.`Receipt` (`Receipt_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Shipping-Delivery`
    FOREIGN KEY (`Shipping_ID`)
    REFERENCES `ArtGalleryManagementDB`.`Delivery` (`Delivery_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`ShippingItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`ShippingItems` (
  `Shipping_ID` INT NOT NULL AUTO_INCREMENT,
  `Bought_ID` INT NOT NULL,
  UNIQUE INDEX `Shipping_ID_UNIQUE` (`Shipping_ID` ASC) VISIBLE,
  UNIQUE INDEX `Bought_ID_UNIQUE` (`Bought_ID` ASC) VISIBLE,
  CONSTRAINT `Items-Bought`
    FOREIGN KEY (`Bought_ID`)
    REFERENCES `ArtGalleryManagementDB`.`Bought` (`Bought_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Items-Shipping`
    FOREIGN KEY (`Shipping_ID`)
    REFERENCES `ArtGalleryManagementDB`.`Shipping` (`Shipping_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`SocialMedia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`SocialMedia` (
  `Media_ID` INT NOT NULL AUTO_INCREMENT,
  `FaceBook` VARCHAR(45) NOT NULL,
  `Twitter` VARCHAR(45) NOT NULL,
  `Linkedin` VARCHAR(45) NOT NULL,
  `Instagram` VARCHAR(45) NOT NULL,
  `Contact_ID` INT NOT NULL,
  PRIMARY KEY (`Media_ID`),
  INDEX `Contact_ID_idx` (`Contact_ID` ASC) VISIBLE,
  CONSTRAINT `Media-Contact`
    FOREIGN KEY (`Contact_ID`)
    REFERENCES `ArtGalleryManagementDB`.`Contact` (`Contact_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`TempUser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`TempUser` (
  `TempUser` INT NOT NULL AUTO_INCREMENT,
  `Misc_User_Data` VARCHAR(45) NOT NULL,
  `Website_ID` INT NOT NULL,
  PRIMARY KEY (`TempUser`),
  INDEX `Website_ID_idx` (`Website_ID` ASC) VISIBLE,
  CONSTRAINT `TempUser-WebSite`
    FOREIGN KEY (`Website_ID`)
    REFERENCES `ArtGalleryManagementDB`.`WebSite` (`WebSite_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`ToBuy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`ToBuy` (
  `RegisterUser_ID` INT NOT NULL,
  `Painting_ID` INT NOT NULL,
  `Add_Date` VARCHAR(45) NOT NULL,
  INDEX `RegiserUser_ID3_idx` (`RegisterUser_ID` ASC) VISIBLE,
  INDEX `Painting_ID` (`Painting_ID` ASC) VISIBLE,
  CONSTRAINT `Painting_ID`
    FOREIGN KEY (`Painting_ID`)
    REFERENCES `ArtGalleryManagementDB`.`Paintings` (`Painting_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `RegiserUser_ID3`
    FOREIGN KEY (`RegisterUser_ID`)
    REFERENCES `ArtGalleryManagementDB`.`RegisteredUsers` (`RegisterUser_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ArtGalleryManagementDB`.`News`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ArtGalleryManagementDB`.`News` (
  `News_ID` INT NOT NULL AUTO_INCREMENT,
  `MiscNews` VARCHAR(45) NOT NULL,
  `WebSite_ID` INT NOT NULL,
  PRIMARY KEY (`News_ID`),
  UNIQUE INDEX `News_ID_UNIQUE` (`News_ID` ASC) VISIBLE,
  INDEX `WebSite_ID_idx` (`WebSite_ID` ASC) VISIBLE,
  CONSTRAINT `WebSite_ID`
    FOREIGN KEY (`WebSite_ID`)
    REFERENCES `ArtGalleryManagementDB`.`WebSite` (`WebSite_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;