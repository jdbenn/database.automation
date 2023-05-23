CREATE TABLE `HumanResources_Shift` (
  `ShiftID` tinyint unsigned NOT NULL COMMENT 'Primary key for Shift records.',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Shift description.',
  `StartTime` time(6) NOT NULL COMMENT 'Shift start time.',
  `EndTime` time(6) NOT NULL COMMENT 'Shift end time.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ShiftID`),
  UNIQUE KEY `AK_Shift_Name` (`Name`),
  UNIQUE KEY `AK_Shift_StartTime_EndTime` (`StartTime`,`EndTime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Work shift lookup table.';
