CREATE TABLE `Production_Location` (
  `LocationID` smallint NOT NULL COMMENT 'Primary key for Location records.',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Location description.',
  `CostRate` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT 'Standard hourly cost of the manufacturing location.',
  `Availability` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT 'Work capacity (in hours) of the manufacturing location.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`LocationID`),
  UNIQUE KEY `AK_Location_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Product inventory and manufacturing locations.';
