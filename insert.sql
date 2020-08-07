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
(`Address`,`City`,`Company`,`Country`,`Email`,`FirstName`,`Gender`,`LastName`,`Password`,`UserName`)
VALUES
('123 add','city','Fake Company1','aplace','Email','Joe','Plane','Doe','pass','not'),
('124 add','city','Fake Company2','aplace','Email2','Joe1','Plane','Doe','pass2','not2'),
('125 add','city','Fake Company3','aplace','Email3','Joe2','Plane','Doe','pass3','not3');

INSERT INTO `ArtGalleryManagementDB`.`WebSite`
(`WebSite_ID`,`Exhibition_ID`,`Misc_Exhibtion_Data`)
VALUES
(1,1,'Test'),
(2,1,'Test2'),
(3,1,'Test3');