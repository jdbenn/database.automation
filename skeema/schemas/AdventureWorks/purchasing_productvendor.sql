CREATE TABLE `Purchasing_ProductVendor` (
  `ProductID` int NOT NULL COMMENT 'Primary key. Foreign key to Product.ProductID.',
  `BusinessEntityID` int NOT NULL COMMENT 'Primary key. Foreign key to Vendor.BusinessEntityID.',
  `AverageLeadTime` int NOT NULL COMMENT 'The average span of time (in days) between placing an order with the vendor and receiving the purchased product.',
  `StandardPrice` decimal(19,4) NOT NULL COMMENT 'The vendor''s usual selling price.',
  `LastReceiptCost` decimal(19,4) DEFAULT NULL COMMENT 'The selling price when last purchased.',
  `LastReceiptDate` datetime(6) DEFAULT NULL COMMENT 'Date the product was last received by the vendor.',
  `MinOrderQty` int NOT NULL COMMENT 'The maximum quantity that should be ordered.',
  `MaxOrderQty` int NOT NULL COMMENT 'The minimum quantity that should be ordered.',
  `OnOrderQty` int DEFAULT NULL COMMENT 'The quantity currently on order.',
  `UnitMeasureCode` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'The product''s unit of measure.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ProductID`,`BusinessEntityID`),
  KEY `IX_ProductVendor_UnitMeasureCode` (`UnitMeasureCode`),
  KEY `IX_ProductVendor_BusinessEntityID` (`BusinessEntityID`),
  CONSTRAINT `FK_ProductVendor_Product_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `Production_Product` (`ProductID`),
  CONSTRAINT `FK_ProductVendor_UnitMeasure_UnitMeasureCode` FOREIGN KEY (`UnitMeasureCode`) REFERENCES `Production_UnitMeasure` (`UnitMeasureCode`),
  CONSTRAINT `FK_ProductVendor_Vendor_BusinessEntityID` FOREIGN KEY (`BusinessEntityID`) REFERENCES `Purchasing_Vendor` (`BusinessEntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cross-reference table mapping vendors with the products they supply.';
