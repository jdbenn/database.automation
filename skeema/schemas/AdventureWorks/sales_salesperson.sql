CREATE TABLE `Sales_SalesPerson` (
  `BusinessEntityID` int NOT NULL COMMENT 'Primary key for SalesPerson records. Foreign key to Employee.BusinessEntityID',
  `TerritoryID` int DEFAULT NULL COMMENT 'Territory currently assigned to. Foreign key to SalesTerritory.SalesTerritoryID.',
  `SalesQuota` decimal(19,4) DEFAULT NULL COMMENT 'Projected yearly sales.',
  `Bonus` decimal(19,4) NOT NULL DEFAULT '0.0000' COMMENT 'Bonus due if quota is met.',
  `CommissionPct` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT 'Commision percent received per sale.',
  `SalesYTD` decimal(19,4) NOT NULL DEFAULT '0.0000' COMMENT 'Sales total year to date.',
  `SalesLastYear` decimal(19,4) NOT NULL DEFAULT '0.0000' COMMENT 'Sales total of previous year.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`BusinessEntityID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_SalesPerson_rowguid` (`rowguid`),
  KEY `FK_SalesPerson_SalesTerritory_TerritoryID` (`TerritoryID`),
  CONSTRAINT `FK_SalesPerson_Employee_BusinessEntityID` FOREIGN KEY (`BusinessEntityID`) REFERENCES `HumanResources_Employee` (`BusinessEntityID`),
  CONSTRAINT `FK_SalesPerson_SalesTerritory_TerritoryID` FOREIGN KEY (`TerritoryID`) REFERENCES `Sales_SalesTerritory` (`TerritoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Sales representative current information.';
