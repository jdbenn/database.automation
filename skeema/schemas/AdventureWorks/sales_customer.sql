CREATE TABLE `Sales_Customer` (
  `CustomerID` int NOT NULL COMMENT 'Primary key.',
  `PersonID` int DEFAULT NULL COMMENT 'Foreign key to Person.BusinessEntityID',
  `StoreID` int DEFAULT NULL COMMENT 'Foreign key to Store.BusinessEntityID',
  `TerritoryID` int DEFAULT NULL COMMENT 'ID of the territory in which the customer is located. Foreign key to SalesTerritory.SalesTerritoryID.',
  `AccountNumber` varchar(10) NOT NULL COMMENT 'Unique number identifying the customer assigned by the accounting system.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_Customer_rowguid` (`rowguid`),
  UNIQUE KEY `AK_Customer_AccountNumber` (`AccountNumber`),
  KEY `IX_Customer_TerritoryID` (`TerritoryID`),
  KEY `FK_Customer_Person_PersonID` (`PersonID`),
  KEY `FK_Customer_Store_StoreID` (`StoreID`),
  CONSTRAINT `FK_Customer_Person_PersonID` FOREIGN KEY (`PersonID`) REFERENCES `Person_Person` (`BusinessEntityID`),
  CONSTRAINT `FK_Customer_SalesTerritory_TerritoryID` FOREIGN KEY (`TerritoryID`) REFERENCES `Sales_SalesTerritory` (`TerritoryID`),
  CONSTRAINT `FK_Customer_Store_StoreID` FOREIGN KEY (`StoreID`) REFERENCES `Sales_Store` (`BusinessEntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Current customer information. Also see the Person and Store tables.';
