CREATE TABLE `Sales_SalesTerritory` (
  `TerritoryID` int NOT NULL COMMENT 'Primary key for SalesTerritory records.',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Sales territory description',
  `CountryRegionCode` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ISO standard country or region code. Foreign key to CountryRegion.CountryRegionCode. ',
  `Group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Geographic area to which the sales territory belong.',
  `SalesYTD` decimal(19,4) NOT NULL DEFAULT '0.0000' COMMENT 'Sales in the territory year to date.',
  `SalesLastYear` decimal(19,4) NOT NULL DEFAULT '0.0000' COMMENT 'Sales in the territory the previous year.',
  `CostYTD` decimal(19,4) NOT NULL DEFAULT '0.0000' COMMENT 'Business costs in the territory year to date.',
  `CostLastYear` decimal(19,4) NOT NULL DEFAULT '0.0000' COMMENT 'Business costs in the territory the previous year.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`TerritoryID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_SalesTerritory_Name` (`Name`),
  UNIQUE KEY `AK_SalesTerritory_rowguid` (`rowguid`),
  KEY `FK_SalesTerritory_CountryRegion_CountryRegionCode` (`CountryRegionCode`),
  CONSTRAINT `FK_SalesTerritory_CountryRegion_CountryRegionCode` FOREIGN KEY (`CountryRegionCode`) REFERENCES `Person_CountryRegion` (`CountryRegionCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Sales territory lookup table.';
