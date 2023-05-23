CREATE TABLE `Person_BusinessEntityAddress` (
  `BusinessEntityID` int NOT NULL COMMENT 'Primary key. Foreign key to BusinessEntity.BusinessEntityID.',
  `AddressID` int NOT NULL COMMENT 'Primary key. Foreign key to Address.AddressID.',
  `AddressTypeID` int NOT NULL COMMENT 'Primary key. Foreign key to AddressType.AddressTypeID.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`BusinessEntityID`,`AddressID`,`AddressTypeID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_BusinessEntityAddress_rowguid` (`rowguid`),
  KEY `IX_BusinessEntityAddress_AddressID` (`AddressID`),
  KEY `IX_BusinessEntityAddress_AddressTypeID` (`AddressTypeID`),
  CONSTRAINT `FK_BusinessEntityAddress_Address_AddressID` FOREIGN KEY (`AddressID`) REFERENCES `Person_Address` (`AddressID`),
  CONSTRAINT `FK_BusinessEntityAddress_AddressType_AddressTypeID` FOREIGN KEY (`AddressTypeID`) REFERENCES `Person_AddressType` (`AddressTypeID`),
  CONSTRAINT `FK_BusinessEntityAddress_BusinessEntity_BusinessEntityID` FOREIGN KEY (`BusinessEntityID`) REFERENCES `Person_BusinessEntity` (`BusinessEntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cross-reference table mapping customers, vendors, and employees to their addresses.';
