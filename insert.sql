-- Script name: inserts.sql
-- Author: Zachary Ma
-- Purpose: insert sample data to test integrity of database system

USE ArtGalleryManagementDB;
-- DROP DATABASE TempUser;
SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO `ArtGalleryManagementDB`.`ArtistType`
(`ArtistType`,`TypeDesc`)
VALUES
('Emo1','Dark1'),
('Emo2','Dark1'),
('Emo3','Dark1');

INSERT INTO `ArtGalleryManagementDB`.`BoughtStatus`
(`BoughtStatus`,`Misc_Bought`)
VALUES
(1,'None'),
(2,'None'),
(3,'None');

INSERT INTO `ArtGalleryManagementDB`.`Categories`
(`Category_Type`,`MainCatType`,`CatDesc`)
VALUES
(1,'None','None'),
(2,'None','None'),
(3,'None','None');

INSERT INTO `ArtGalleryManagementDB`.`Delivery`
(`Delivery_ID`,`Shipping_ID`,`Address`,`From_Address`,`Date`)
VALUES
(1,1,'1','1','1'),
(2,1,'1','1','1'),
(3,1,'1','1','1');

INSERT INTO `ArtGalleryManagementDB`.`Exhibition`
(`Exhibition_ID`,`Date_Started`,`Date_Created`,`Exhibition_Name`,`Exhibtion_Desc`,`Misc_Details`)
VALUES
(1,'1','1','1','1','1'),
(2,'1','1','1','1','1'),
(3,'1','1','1','1','1');

INSERT INTO `ArtGalleryManagementDB`.`OrderStatus`
(`OrderStatus_ID`,`OrderStatus_Desc`)
VALUES
(1,'1'),
(2,'1'),
(3,'1');

INSERT INTO `ArtGalleryManagementDB`.`PaintingStatus`
(`PaintingStatus`,`ArtworkStatus`)
VALUES
(1,'1'),
(2,'2'),
(3,'1');

INSERT INTO `ArtGalleryManagementDB`.`PaymentMethod`
(`PaymentType`,`Payment_Desc`)
VALUES
(1,'1'),
(2,'2'),
(3,'1');

INSERT INTO `ArtGalleryManagementDB`.`ReceiptStatus`
(`ReceiptStatus`,`Misc_Receipt_Desc`)
VALUES
(1,'1'),
(2,'1'),
(3,'1');

INSERT INTO `ArtGalleryManagementDB`.`RegisteredUsers`
(`Company`,`Gender`,`FirstName`,`LastName`,`Email`,`UserName`,`Password`,`Address`,`City`,`Country`)
VALUES
('Fake Company1','Plane','Joe','Doe','email','use','pass','123 add','not','aplace'),
('Fake Company2','Plane','Joe1','Doe','email2','use2','pass2','124 add','not','aplace'),
('Fake Company3','Plane','Joe2','Doe','email3','use3','pass3','125 add','not','aplace');

INSERT INTO `ArtGalleryManagementDB`.`WebSite`
(`WebSite_ID`,`Exhibition_ID`,`Misc_Exhibtion_Data`)
VALUES
(1,1,'Test'),
(2,1,'Test2'),
(3,1,'Test3');