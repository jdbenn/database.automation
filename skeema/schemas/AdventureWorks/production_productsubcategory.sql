CREATE TABLE `Production_ProductSubcategory` (
  `ProductSubcategoryID` int NOT NULL COMMENT 'Primary key for ProductSubcategory records.',
  `ProductCategoryID` int NOT NULL COMMENT 'Product category identification number. Foreign key to ProductCategory.ProductCategoryID.',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Subcategory description.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ProductSubcategoryID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_ProductSubcategory_Name` (`Name`),
  UNIQUE KEY `AK_ProductSubcategory_rowguid` (`rowguid`),
  KEY `FK_ProductSubcategory_ProductCategory_ProductCategoryID` (`ProductCategoryID`),
  CONSTRAINT `FK_ProductSubcategory_ProductCategory_ProductCategoryID` FOREIGN KEY (`ProductCategoryID`) REFERENCES `Production_ProductCategory` (`ProductCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Product subcategories. See ProductCategory table.';
