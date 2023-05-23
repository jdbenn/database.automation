CREATE TABLE `Production_ProductModelProductDescriptionCulture` (
  `ProductModelID` int NOT NULL COMMENT 'Primary key. Foreign key to ProductModel.ProductModelID.',
  `ProductDescriptionID` int NOT NULL COMMENT 'Primary key. Foreign key to ProductDescription.ProductDescriptionID.',
  `CultureID` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Culture identification number. Foreign key to Culture.CultureID.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ProductModelID`,`ProductDescriptionID`,`CultureID`),
  KEY `FK_ProductModelProductDescriptionCulture_ProductDescription_Pr20` (`ProductDescriptionID`),
  KEY `FK_ProductModelProductDescriptionCulture_Culture_CultureID` (`CultureID`),
  CONSTRAINT `FK_ProductModelProductDescriptionCulture_Culture_CultureID` FOREIGN KEY (`CultureID`) REFERENCES `Production_Culture` (`CultureID`),
  CONSTRAINT `FK_ProductModelProductDescriptionCulture_ProductDescription_Pr20` FOREIGN KEY (`ProductDescriptionID`) REFERENCES `Production_ProductDescription` (`ProductDescriptionID`),
  CONSTRAINT `FK_ProductModelProductDescriptionCulture_ProductModel_ProductM21` FOREIGN KEY (`ProductModelID`) REFERENCES `Production_ProductModel` (`ProductModelID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cross-reference table mapping product descriptions and the language the description is written in.';
