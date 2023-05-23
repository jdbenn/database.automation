CREATE TABLE `Production_ScrapReason` (
  `ScrapReasonID` smallint NOT NULL COMMENT 'Primary key for ScrapReason records.',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Failure description.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ScrapReasonID`),
  UNIQUE KEY `AK_ScrapReason_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Manufacturing failure reasons lookup table.';
