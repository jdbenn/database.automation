CREATE TABLE `Sales_SpecialOffer` (
  `SpecialOfferID` int NOT NULL COMMENT 'Primary key for SpecialOffer records.',
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Discount description.',
  `DiscountPct` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount precentage.',
  `Type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Discount type category.',
  `Category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Group the discount applies to such as Reseller or Customer.',
  `StartDate` datetime(6) NOT NULL COMMENT 'Discount start date.',
  `EndDate` datetime(6) NOT NULL COMMENT 'Discount end date.',
  `MinQty` int NOT NULL DEFAULT '0' COMMENT 'Minimum discount percent allowed.',
  `MaxQty` int DEFAULT NULL COMMENT 'Maximum discount percent allowed.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`SpecialOfferID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_SpecialOffer_rowguid` (`rowguid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Sale discounts lookup table.';
