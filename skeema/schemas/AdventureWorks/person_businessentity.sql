CREATE TABLE `Person_BusinessEntity` (
  `BusinessEntityID` int NOT NULL COMMENT 'Primary key for all customers, vendors, and employees.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`BusinessEntityID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_BusinessEntity_rowguid` (`rowguid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Source of the ID that connects vendors, customers, and employees with address and contact information.';
