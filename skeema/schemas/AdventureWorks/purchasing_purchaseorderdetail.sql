CREATE TABLE `Purchasing_PurchaseOrderDetail` (
  `PurchaseOrderID` int NOT NULL COMMENT 'Primary key. Foreign key to PurchaseOrderHeader.PurchaseOrderID.',
  `PurchaseOrderDetailID` int NOT NULL COMMENT 'Primary key. One line number per purchased product.',
  `DueDate` datetime(6) NOT NULL COMMENT 'Date the product is expected to be received.',
  `OrderQty` smallint NOT NULL COMMENT 'Quantity ordered.',
  `ProductID` int NOT NULL COMMENT 'Product identification number. Foreign key to Product.ProductID.',
  `UnitPrice` decimal(19,4) NOT NULL COMMENT 'Vendor''s selling price of a single product.',
  `LineTotal` decimal(19,4) NOT NULL COMMENT 'Per product subtotal. Computed as OrderQty * UnitPrice.',
  `ReceivedQty` decimal(8,2) NOT NULL COMMENT 'Quantity actually received from the vendor.',
  `RejectedQty` decimal(8,2) NOT NULL COMMENT 'Quantity rejected during inspection.',
  `StockedQty` decimal(9,2) NOT NULL COMMENT 'Quantity accepted into inventory. Computed as ReceivedQty - RejectedQty.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`PurchaseOrderID`,`PurchaseOrderDetailID`),
  KEY `IX_PurchaseOrderDetail_ProductID` (`ProductID`),
  CONSTRAINT `FK_PurchaseOrderDetail_Product_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `Production_Product` (`ProductID`),
  CONSTRAINT `FK_PurchaseOrderDetail_PurchaseOrderHeader_PurchaseOrderID` FOREIGN KEY (`PurchaseOrderID`) REFERENCES `Purchasing_PurchaseOrderHeader` (`PurchaseOrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Individual products associated with a specific purchase order. See PurchaseOrderHeader.';
