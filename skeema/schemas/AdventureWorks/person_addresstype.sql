CREATE TABLE `Person_AddressType` (
  `AddressTypeID` int NOT NULL COMMENT 'Primary key for AddressType records.',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Address type description. For example, Billing, Home, or Shipping.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`AddressTypeID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_AddressType_rowguid` (`rowguid`),
  UNIQUE KEY `AK_AddressType_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Types of addresses stored in the Address table. ';
