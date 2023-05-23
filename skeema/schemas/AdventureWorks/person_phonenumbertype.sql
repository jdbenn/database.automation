CREATE TABLE `Person_PhoneNumberType` (
  `PhoneNumberTypeID` int NOT NULL COMMENT 'Primary key for telephone number type records.',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Name of the telephone number type',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`PhoneNumberTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Type of phone number of a person.';
