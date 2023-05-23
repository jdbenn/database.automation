CREATE TABLE `Person_BusinessEntityContact` (
  `BusinessEntityID` int NOT NULL COMMENT 'Primary key. Foreign key to BusinessEntity.BusinessEntityID.',
  `PersonID` int NOT NULL COMMENT 'Primary key. Foreign key to Person.BusinessEntityID.',
  `ContactTypeID` int NOT NULL COMMENT 'Primary key.  Foreign key to ContactType.ContactTypeID.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`BusinessEntityID`,`PersonID`,`ContactTypeID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_BusinessEntityContact_rowguid` (`rowguid`),
  KEY `IX_BusinessEntityContact_PersonID` (`PersonID`),
  KEY `IX_BusinessEntityContact_ContactTypeID` (`ContactTypeID`),
  CONSTRAINT `FK_BusinessEntityContact_BusinessEntity_BusinessEntityID` FOREIGN KEY (`BusinessEntityID`) REFERENCES `Person_BusinessEntity` (`BusinessEntityID`),
  CONSTRAINT `FK_BusinessEntityContact_ContactType_ContactTypeID` FOREIGN KEY (`ContactTypeID`) REFERENCES `Person_ContactType` (`ContactTypeID`),
  CONSTRAINT `FK_BusinessEntityContact_Person_PersonID` FOREIGN KEY (`PersonID`) REFERENCES `Person_Person` (`BusinessEntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cross-reference table mapping stores, vendors, and employees to people';
