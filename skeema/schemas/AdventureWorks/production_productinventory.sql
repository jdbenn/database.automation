CREATE TABLE `Production_ProductInventory` (
  `ProductID` int NOT NULL COMMENT 'Product identification number. Foreign key to Product.ProductID.',
  `LocationID` smallint NOT NULL COMMENT 'Inventory location identification number. Foreign key to Location.LocationID. ',
  `Shelf` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Storage compartment within an inventory location.',
  `Bin` tinyint unsigned NOT NULL COMMENT 'Storage container on a shelf in an inventory location.',
  `Quantity` smallint NOT NULL DEFAULT '0' COMMENT 'Quantity of products in the inventory location.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ProductID`,`LocationID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  KEY `FK_ProductInventory_Location_LocationID` (`LocationID`),
  CONSTRAINT `FK_ProductInventory_Location_LocationID` FOREIGN KEY (`LocationID`) REFERENCES `Production_Location` (`LocationID`),
  CONSTRAINT `FK_ProductInventory_Product_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `Production_Product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Product inventory information.';
