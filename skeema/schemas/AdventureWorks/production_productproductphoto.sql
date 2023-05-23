CREATE TABLE `Production_ProductProductPhoto` (
  `ProductID` int NOT NULL COMMENT 'Product identification number. Foreign key to Product.ProductID.',
  `ProductPhotoID` int NOT NULL COMMENT 'Product photo identification number. Foreign key to ProductPhoto.ProductPhotoID.',
  `Primary` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = Photo is not the principal image. 1 = Photo is the principal image.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ProductID`,`ProductPhotoID`),
  KEY `FK_ProductProductPhoto_ProductPhoto_ProductPhotoID` (`ProductPhotoID`),
  CONSTRAINT `FK_ProductProductPhoto_Product_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `Production_Product` (`ProductID`),
  CONSTRAINT `FK_ProductProductPhoto_ProductPhoto_ProductPhotoID` FOREIGN KEY (`ProductPhotoID`) REFERENCES `Production_ProductPhoto` (`ProductPhotoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cross-reference table mapping products and product photos.';
