CREATE TABLE `Sales_SalesReason` (
  `SalesReasonID` int NOT NULL COMMENT 'Primary key for SalesReason records.',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Sales reason description.',
  `ReasonType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Category the sales reason belongs to.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`SalesReasonID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Lookup table of customer purchase reasons.';
