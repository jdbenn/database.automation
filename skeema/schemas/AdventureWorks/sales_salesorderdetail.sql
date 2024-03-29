CREATE TABLE `Sales_SalesOrderDetail` (
  `SalesOrderID` int NOT NULL COMMENT 'Primary key. Foreign key to SalesOrderHeader.SalesOrderID.',
  `SalesOrderDetailID` int NOT NULL COMMENT 'Primary key. One incremental unique number per product sold.',
  `CarrierTrackingNumber` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Shipment tracking number supplied by the shipper.',
  `OrderQty` smallint NOT NULL COMMENT 'Quantity ordered per product.',
  `ProductID` int NOT NULL COMMENT 'Product sold to customer. Foreign key to Product.ProductID.',
  `SpecialOfferID` int NOT NULL COMMENT 'Promotional code. Foreign key to SpecialOffer.SpecialOfferID.',
  `UnitPrice` decimal(19,4) NOT NULL COMMENT 'Selling price of a single product.',
  `UnitPriceDiscount` decimal(19,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount amount.',
  `LineTotal` decimal(38,6) NOT NULL COMMENT 'Per product subtotal. Computed as UnitPrice * (1 - UnitPriceDiscount) * OrderQty.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`SalesOrderID`,`SalesOrderDetailID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_SalesOrderDetail_rowguid` (`rowguid`),
  KEY `IX_SalesOrderDetail_ProductID` (`ProductID`),
  KEY `FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID` (`SpecialOfferID`,`ProductID`),
  CONSTRAINT `FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID` FOREIGN KEY (`SalesOrderID`) REFERENCES `Sales_SalesOrderHeader` (`SalesOrderID`) ON DELETE CASCADE,
  CONSTRAINT `FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID` FOREIGN KEY (`SpecialOfferID`, `ProductID`) REFERENCES `Sales_SpecialOfferProduct` (`SpecialOfferID`, `ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Individual products associated with a specific sales order. See SalesOrderHeader.';
