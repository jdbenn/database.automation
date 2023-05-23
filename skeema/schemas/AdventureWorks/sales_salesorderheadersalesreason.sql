CREATE TABLE `Sales_SalesOrderHeaderSalesReason` (
  `SalesOrderID` int NOT NULL COMMENT 'Primary key. Foreign key to SalesOrderHeader.SalesOrderID.',
  `SalesReasonID` int NOT NULL COMMENT 'Primary key. Foreign key to SalesReason.SalesReasonID.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`SalesOrderID`,`SalesReasonID`),
  KEY `FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID` (`SalesReasonID`),
  CONSTRAINT `FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID` FOREIGN KEY (`SalesOrderID`) REFERENCES `Sales_SalesOrderHeader` (`SalesOrderID`) ON DELETE CASCADE,
  CONSTRAINT `FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID` FOREIGN KEY (`SalesReasonID`) REFERENCES `Sales_SalesReason` (`SalesReasonID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cross-reference table mapping sales orders to sales reason codes.';
