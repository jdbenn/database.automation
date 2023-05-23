CREATE TABLE `Sales_CurrencyRate` (
  `CurrencyRateID` int NOT NULL COMMENT 'Primary key for CurrencyRate records.',
  `CurrencyRateDate` datetime(6) NOT NULL COMMENT 'Date and time the exchange rate was obtained.',
  `FromCurrencyCode` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Exchange rate was converted from this currency code.',
  `ToCurrencyCode` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Exchange rate was converted to this currency code.',
  `AverageRate` decimal(19,4) NOT NULL COMMENT 'Average exchange rate for the day.',
  `EndOfDayRate` decimal(19,4) NOT NULL COMMENT 'Final exchange rate for the day.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`CurrencyRateID`),
  UNIQUE KEY `AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode` (`CurrencyRateDate`,`FromCurrencyCode`,`ToCurrencyCode`),
  KEY `FK_CurrencyRate_Currency_FromCurrencyCode` (`FromCurrencyCode`),
  KEY `FK_CurrencyRate_Currency_ToCurrencyCode` (`ToCurrencyCode`),
  CONSTRAINT `FK_CurrencyRate_Currency_FromCurrencyCode` FOREIGN KEY (`FromCurrencyCode`) REFERENCES `Sales_Currency` (`CurrencyCode`),
  CONSTRAINT `FK_CurrencyRate_Currency_ToCurrencyCode` FOREIGN KEY (`ToCurrencyCode`) REFERENCES `Sales_Currency` (`CurrencyCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Currency exchange rates.';
