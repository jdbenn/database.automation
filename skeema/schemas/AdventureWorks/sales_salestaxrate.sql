CREATE TABLE `Sales_SalesTaxRate` (
  `SalesTaxRateID` int NOT NULL COMMENT 'Primary key for SalesTaxRate records.',
  `StateProvinceID` int NOT NULL COMMENT 'State, province, or country/region the sales tax applies to.',
  `TaxType` tinyint unsigned NOT NULL COMMENT '1 = Tax applied to retail transactions, 2 = Tax applied to wholesale transactions, 3 = Tax applied to all sales (retail and wholesale) transactions.',
  `TaxRate` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT 'Tax rate amount.',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Tax rate description.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`SalesTaxRateID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_SalesTaxRate_StateProvinceID_TaxType` (`StateProvinceID`,`TaxType`),
  UNIQUE KEY `AK_SalesTaxRate_rowguid` (`rowguid`),
  CONSTRAINT `FK_SalesTaxRate_StateProvince_StateProvinceID` FOREIGN KEY (`StateProvinceID`) REFERENCES `Person_StateProvince` (`StateProvinceID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tax rate lookup table.';
