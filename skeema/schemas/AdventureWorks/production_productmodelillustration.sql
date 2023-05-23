CREATE TABLE `Production_ProductModelIllustration` (
  `ProductModelID` int NOT NULL COMMENT 'Primary key. Foreign key to ProductModel.ProductModelID.',
  `IllustrationID` int NOT NULL COMMENT 'Primary key. Foreign key to Illustration.IllustrationID.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ProductModelID`,`IllustrationID`),
  KEY `FK_ProductModelIllustration_Illustration_IllustrationID` (`IllustrationID`),
  CONSTRAINT `FK_ProductModelIllustration_Illustration_IllustrationID` FOREIGN KEY (`IllustrationID`) REFERENCES `Production_Illustration` (`IllustrationID`),
  CONSTRAINT `FK_ProductModelIllustration_ProductModel_ProductModelID` FOREIGN KEY (`ProductModelID`) REFERENCES `Production_ProductModel` (`ProductModelID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cross-reference table mapping product models and illustrations.';
