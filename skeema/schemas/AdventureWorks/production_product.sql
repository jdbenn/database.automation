CREATE TABLE `Production_Product` (
  `ProductID` int NOT NULL COMMENT 'Primary key for Product records.',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Name of the product.',
  `ProductNumber` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Unique product identification number.',
  `MakeFlag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = Product is purchased, 1 = Product is manufactured in-house.',
  `FinishedGoodsFlag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = Product is not a salable item. 1 = Product is salable.',
  `Color` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Product color.',
  `SafetyStockLevel` smallint NOT NULL COMMENT 'Minimum inventory quantity. ',
  `ReorderPoint` smallint NOT NULL COMMENT 'Inventory level that triggers a purchase order or work order. ',
  `StandardCost` decimal(19,4) NOT NULL COMMENT 'Standard cost of the product.',
  `ListPrice` decimal(19,4) NOT NULL COMMENT 'Selling price.',
  `Size` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Product size.',
  `SizeUnitMeasureCode` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Unit of measure for Size column.',
  `WeightUnitMeasureCode` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Unit of measure for Weight column.',
  `Weight` decimal(8,2) DEFAULT NULL COMMENT 'Product weight.',
  `DaysToManufacture` int NOT NULL COMMENT 'Number of days required to manufacture the product.',
  `ProductLine` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'R = Road, M = Mountain, T = Touring, S = Standard',
  `Class` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'H = High, M = Medium, L = Low',
  `Style` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'W = Womens, M = Mens, U = Universal',
  `ProductSubcategoryID` int DEFAULT NULL COMMENT 'Product is a member of this product subcategory. Foreign key to ProductSubCategory.ProductSubCategoryID. ',
  `ProductModelID` int DEFAULT NULL COMMENT 'Product is a member of this product model. Foreign key to ProductModel.ProductModelID.',
  `SellStartDate` datetime(6) NOT NULL COMMENT 'Date the product was available for sale.',
  `SellEndDate` datetime(6) DEFAULT NULL COMMENT 'Date the product was no longer available for sale.',
  `DiscontinuedDate` datetime(6) DEFAULT NULL COMMENT 'Date the product was discontinued.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ProductID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_Product_ProductNumber` (`ProductNumber`),
  UNIQUE KEY `AK_Product_Name` (`Name`),
  UNIQUE KEY `AK_Product_rowguid` (`rowguid`),
  KEY `FK_Product_UnitMeasure_SizeUnitMeasureCode` (`SizeUnitMeasureCode`),
  KEY `FK_Product_UnitMeasure_WeightUnitMeasureCode` (`WeightUnitMeasureCode`),
  KEY `FK_Product_ProductModel_ProductModelID` (`ProductModelID`),
  KEY `FK_Product_ProductSubcategory_ProductSubcategoryID` (`ProductSubcategoryID`),
  CONSTRAINT `FK_Product_ProductModel_ProductModelID` FOREIGN KEY (`ProductModelID`) REFERENCES `Production_ProductModel` (`ProductModelID`),
  CONSTRAINT `FK_Product_ProductSubcategory_ProductSubcategoryID` FOREIGN KEY (`ProductSubcategoryID`) REFERENCES `Production_ProductSubcategory` (`ProductSubcategoryID`),
  CONSTRAINT `FK_Product_UnitMeasure_SizeUnitMeasureCode` FOREIGN KEY (`SizeUnitMeasureCode`) REFERENCES `Production_UnitMeasure` (`UnitMeasureCode`),
  CONSTRAINT `FK_Product_UnitMeasure_WeightUnitMeasureCode` FOREIGN KEY (`WeightUnitMeasureCode`) REFERENCES `Production_UnitMeasure` (`UnitMeasureCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Products sold or used in the manfacturing of sold products.';
