CREATE TABLE `Production_ProductDescription` (
  `ProductDescriptionID` int NOT NULL COMMENT 'Primary key for ProductDescription records.',
  `Description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Description of the product.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ProductDescriptionID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_ProductDescription_rowguid` (`rowguid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Product descriptions in several languages.';
