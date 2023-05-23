CREATE TABLE `Production_ProductModel` (
  `ProductModelID` int NOT NULL COMMENT 'Primary key for ProductModel records.',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Product model description.',
  `CatalogDescription` text COMMENT 'Detailed product catalog information in xml format.',
  `Instructions` text COMMENT 'Manufacturing instructions in xml format.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ProductModelID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_ProductModel_Name` (`Name`),
  UNIQUE KEY `AK_ProductModel_rowguid` (`rowguid`),
  KEY `PXML_ProductModel_CatalogDescription` (`CatalogDescription`(255)),
  KEY `PXML_ProductModel_Instructions` (`Instructions`(255))
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Product model classification.';
