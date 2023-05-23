CREATE TABLE `Sales_SalesPersonQuotaHistory` (
  `BusinessEntityID` int NOT NULL COMMENT 'Sales person identification number. Foreign key to SalesPerson.BusinessEntityID.',
  `QuotaDate` datetime(6) NOT NULL COMMENT 'Sales quota date.',
  `SalesQuota` decimal(19,4) NOT NULL COMMENT 'Sales quota amount.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`BusinessEntityID`,`QuotaDate`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_SalesPersonQuotaHistory_rowguid` (`rowguid`),
  CONSTRAINT `FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID` FOREIGN KEY (`BusinessEntityID`) REFERENCES `Sales_SalesPerson` (`BusinessEntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Sales performance tracking.';
