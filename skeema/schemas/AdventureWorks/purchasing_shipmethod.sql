CREATE TABLE `Purchasing_ShipMethod` (
  `ShipMethodID` int NOT NULL COMMENT 'Primary key for ShipMethod records.',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Shipping company name.',
  `ShipBase` decimal(19,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum shipping charge.',
  `ShipRate` decimal(19,4) NOT NULL DEFAULT '0.0000' COMMENT 'Shipping charge per pound.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ShipMethodID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_ShipMethod_Name` (`Name`),
  UNIQUE KEY `AK_ShipMethod_rowguid` (`rowguid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Shipping company lookup table.';
