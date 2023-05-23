CREATE TABLE `Person_EmailAddress` (
  `BusinessEntityID` int NOT NULL COMMENT 'Primary key. Person associated with this email address.  Foreign key to Person.BusinessEntityID',
  `EmailAddressID` int NOT NULL COMMENT 'Primary key. ID of this email address.',
  `EmailAddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'E-mail address for the person.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`BusinessEntityID`,`EmailAddressID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  KEY `IX_EmailAddress_EmailAddress` (`EmailAddress`),
  CONSTRAINT `FK_EmailAddress_Person_BusinessEntityID` FOREIGN KEY (`BusinessEntityID`) REFERENCES `Person_Person` (`BusinessEntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Where to send a person email.';
