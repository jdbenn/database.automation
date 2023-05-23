CREATE TABLE `Sales_SalesTerritoryHistory` (
  `BusinessEntityID` int NOT NULL COMMENT 'Primary key. The sales rep.  Foreign key to SalesPerson.BusinessEntityID.',
  `TerritoryID` int NOT NULL COMMENT 'Primary key. Territory identification number. Foreign key to SalesTerritory.SalesTerritoryID.',
  `StartDate` datetime(6) NOT NULL COMMENT 'Primary key. Date the sales representive started work in the territory.',
  `EndDate` datetime(6) DEFAULT NULL COMMENT 'Date the sales representative left work in the territory.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`BusinessEntityID`,`TerritoryID`,`StartDate`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_SalesTerritoryHistory_rowguid` (`rowguid`),
  KEY `FK_SalesTerritoryHistory_SalesTerritory_TerritoryID` (`TerritoryID`),
  CONSTRAINT `FK_SalesTerritoryHistory_SalesPerson_BusinessEntityID` FOREIGN KEY (`BusinessEntityID`) REFERENCES `Sales_SalesPerson` (`BusinessEntityID`),
  CONSTRAINT `FK_SalesTerritoryHistory_SalesTerritory_TerritoryID` FOREIGN KEY (`TerritoryID`) REFERENCES `Sales_SalesTerritory` (`TerritoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Sales representative transfers to other sales territories.';
