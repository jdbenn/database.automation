CREATE TABLE `Sales_SpecialOfferProduct` (
  `SpecialOfferID` int NOT NULL COMMENT 'Primary key for SpecialOfferProduct records.',
  `ProductID` int NOT NULL COMMENT 'Product identification number. Foreign key to Product.ProductID.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`SpecialOfferID`,`ProductID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_SpecialOfferProduct_rowguid` (`rowguid`),
  KEY `IX_SpecialOfferProduct_ProductID` (`ProductID`),
  CONSTRAINT `FK_SpecialOfferProduct_Product_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `Production_Product` (`ProductID`),
  CONSTRAINT `FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID` FOREIGN KEY (`SpecialOfferID`) REFERENCES `Sales_SpecialOffer` (`SpecialOfferID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cross-reference table mapping products to special offer discounts.';
