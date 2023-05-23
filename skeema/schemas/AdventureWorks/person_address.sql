CREATE TABLE `Person_Address` (
  `AddressID` int NOT NULL COMMENT 'Primary key for Address records.',
  `AddressLine1` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'First street address line.',
  `AddressLine2` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Second street address line.',
  `City` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Name of the city.',
  `StateProvinceID` int NOT NULL COMMENT 'Unique identification number for the state or province. Foreign key to StateProvince table.',
  `PostalCode` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Postal code for the street address.',
  `SpatialLocation` geometry DEFAULT NULL COMMENT 'Latitude and longitude of this address.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`AddressID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_Address_rowguid` (`rowguid`),
  UNIQUE KEY `IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_Post16` (`AddressLine1`,`AddressLine2`,`City`,`StateProvinceID`,`PostalCode`),
  KEY `IX_Address_StateProvinceID` (`StateProvinceID`),
  CONSTRAINT `FK_Address_StateProvince_StateProvinceID` FOREIGN KEY (`StateProvinceID`) REFERENCES `Person_StateProvince` (`StateProvinceID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Street address information for customers, employees, and vendors.';
