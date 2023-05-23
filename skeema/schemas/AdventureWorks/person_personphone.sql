CREATE TABLE `Person_PersonPhone` (
  `BusinessEntityID` int NOT NULL COMMENT 'Business entity identification number. Foreign key to Person.BusinessEntityID.',
  `PhoneNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Telephone number identification number.',
  `PhoneNumberTypeID` int NOT NULL COMMENT 'Kind of phone number. Foreign key to PhoneNumberType.PhoneNumberTypeID.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`BusinessEntityID`,`PhoneNumber`,`PhoneNumberTypeID`),
  KEY `IX_PersonPhone_PhoneNumber` (`PhoneNumber`),
  KEY `FK_PersonPhone_PhoneNumberType_PhoneNumberTypeID` (`PhoneNumberTypeID`),
  CONSTRAINT `FK_PersonPhone_Person_BusinessEntityID` FOREIGN KEY (`BusinessEntityID`) REFERENCES `Person_Person` (`BusinessEntityID`),
  CONSTRAINT `FK_PersonPhone_PhoneNumberType_PhoneNumberTypeID` FOREIGN KEY (`PhoneNumberTypeID`) REFERENCES `Person_PhoneNumberType` (`PhoneNumberTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Telephone number and type of a person.';
