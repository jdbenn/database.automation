CREATE TABLE `Sales_Store` (
  `BusinessEntityID` int NOT NULL COMMENT 'Primary key. Foreign key to Customer.BusinessEntityID.',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Name of the store.',
  `SalesPersonID` int DEFAULT NULL COMMENT 'ID of the sales person assigned to the customer. Foreign key to SalesPerson.BusinessEntityID.',
  `Demographics` text COMMENT 'Demographic informationg about the store such as the number of employees, annual sales and store type.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`BusinessEntityID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_Store_rowguid` (`rowguid`),
  KEY `IX_Store_SalesPersonID` (`SalesPersonID`),
  KEY `PXML_Store_Demographics` (`Demographics`(255)),
  CONSTRAINT `FK_Store_BusinessEntity_BusinessEntityID` FOREIGN KEY (`BusinessEntityID`) REFERENCES `Person_BusinessEntity` (`BusinessEntityID`),
  CONSTRAINT `FK_Store_SalesPerson_SalesPersonID` FOREIGN KEY (`SalesPersonID`) REFERENCES `Sales_SalesPerson` (`BusinessEntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Customers (resellers) of Adventure Works products.';
