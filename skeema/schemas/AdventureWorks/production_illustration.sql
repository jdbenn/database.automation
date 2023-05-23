CREATE TABLE `Production_Illustration` (
  `IllustrationID` int NOT NULL COMMENT 'Primary key for Illustration records.',
  `Diagram` text COMMENT 'Illustrations used in manufacturing instructions. Stored as XML.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`IllustrationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Bicycle assembly diagrams.';
