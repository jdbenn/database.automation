CREATE TABLE `Sales_CountryRegionCurrency` (
  `CountryRegionCode` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ISO code for countries and regions. Foreign key to CountryRegion.CountryRegionCode.',
  `CurrencyCode` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ISO standard currency code. Foreign key to Currency.CurrencyCode.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`CountryRegionCode`,`CurrencyCode`),
  KEY `IX_CountryRegionCurrency_CurrencyCode` (`CurrencyCode`),
  CONSTRAINT `FK_CountryRegionCurrency_CountryRegion_CountryRegionCode` FOREIGN KEY (`CountryRegionCode`) REFERENCES `Person_CountryRegion` (`CountryRegionCode`),
  CONSTRAINT `FK_CountryRegionCurrency_Currency_CurrencyCode` FOREIGN KEY (`CurrencyCode`) REFERENCES `Sales_Currency` (`CurrencyCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cross-reference table mapping ISO currency codes to a country or region.';
