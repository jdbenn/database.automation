CREATE TABLE `Purchasing_PurchaseOrderHeader` (
  `PurchaseOrderID` int NOT NULL COMMENT 'Primary key.',
  `RevisionNumber` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Incremental number to track changes to the purchase order over time.',
  `Status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT 'Order current status. 1 = Pending; 2 = Approved; 3 = Rejected; 4 = Complete',
  `EmployeeID` int NOT NULL COMMENT 'Employee who created the purchase order. Foreign key to Employee.BusinessEntityID.',
  `VendorID` int NOT NULL COMMENT 'Vendor with whom the purchase order is placed. Foreign key to Vendor.BusinessEntityID.',
  `ShipMethodID` int NOT NULL COMMENT 'Shipping method. Foreign key to ShipMethod.ShipMethodID.',
  `OrderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Purchase order creation date.',
  `ShipDate` datetime(6) DEFAULT NULL COMMENT 'Estimated shipment date from the vendor.',
  `SubTotal` decimal(19,4) NOT NULL DEFAULT '0.0000' COMMENT 'Purchase order subtotal. Computed as SUM(PurchaseOrderDetail.LineTotal)for the appropriate PurchaseOrderID.',
  `TaxAmt` decimal(19,4) NOT NULL DEFAULT '0.0000' COMMENT 'Tax amount.',
  `Freight` decimal(19,4) NOT NULL DEFAULT '0.0000' COMMENT 'Shipping cost.',
  `TotalDue` decimal(19,4) NOT NULL COMMENT 'Total due to vendor. Computed as Subtotal + TaxAmt + Freight.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`PurchaseOrderID`),
  KEY `IX_PurchaseOrderHeader_VendorID` (`VendorID`),
  KEY `IX_PurchaseOrderHeader_EmployeeID` (`EmployeeID`),
  KEY `FK_PurchaseOrderHeader_ShipMethod_ShipMethodID` (`ShipMethodID`),
  CONSTRAINT `FK_PurchaseOrderHeader_Employee_EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `HumanResources_Employee` (`BusinessEntityID`),
  CONSTRAINT `FK_PurchaseOrderHeader_ShipMethod_ShipMethodID` FOREIGN KEY (`ShipMethodID`) REFERENCES `Purchasing_ShipMethod` (`ShipMethodID`),
  CONSTRAINT `FK_PurchaseOrderHeader_Vendor_VendorID` FOREIGN KEY (`VendorID`) REFERENCES `Purchasing_Vendor` (`BusinessEntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='General purchase order information. See PurchaseOrderDetail.';
