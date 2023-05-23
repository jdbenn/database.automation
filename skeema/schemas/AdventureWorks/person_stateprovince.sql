CREATE TABLE `Person_StateProvince` (
  `StateProvinceID` int NOT NULL COMMENT 'Primary key for StateProvince records.',
  `StateProvinceCode` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ISO standard state or province code.',
  `CountryRegionCode` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ISO standard country or region code. Foreign key to CountryRegion.CountryRegionCode. ',
  `IsOnlyStateProvinceFlag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = StateProvinceCode exists. 1 = StateProvinceCode unavailable, using CountryRegionCode.',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'State or province description.',
  `TerritoryID` int NOT NULL COMMENT 'ID of the territory in which the state or province is located. Foreign key to SalesTerritory.SalesTerritoryID.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`StateProvinceID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_StateProvince_Name` (`Name`),
  UNIQUE KEY `AK_StateProvince_StateProvinceCode_CountryRegionCode` (`StateProvinceCode`,`CountryRegionCode`),
  UNIQUE KEY `AK_StateProvince_rowguid` (`rowguid`),
  KEY `FK_StateProvince_CountryRegion_CountryRegionCode` (`CountryRegionCode`),
  KEY `FK_StateProvince_SalesTerritory_TerritoryID` (`TerritoryID`),
  CONSTRAINT `FK_StateProvince_CountryRegion_CountryRegionCode` FOREIGN KEY (`CountryRegionCode`) REFERENCES `Person_CountryRegion` (`CountryRegionCode`),
  CONSTRAINT `FK_StateProvince_SalesTerritory_TerritoryID` FOREIGN KEY (`TerritoryID`) REFERENCES `Sales_SalesTerritory` (`TerritoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='State and province lookup table.';
