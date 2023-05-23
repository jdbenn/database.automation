CREATE TABLE `Production_TransactionHistoryArchive` (
  `TransactionID` int NOT NULL COMMENT 'Primary key for TransactionHistoryArchive records.',
  `ProductID` int NOT NULL COMMENT 'Product identification number. Foreign key to Product.ProductID.',
  `ReferenceOrderID` int NOT NULL COMMENT 'Purchase order, sales order, or work order identification number.',
  `ReferenceOrderLineID` int NOT NULL DEFAULT '0' COMMENT 'Line number associated with the purchase order, sales order, or work order.',
  `TransactionDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time of the transaction.',
  `TransactionType` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'W = Work Order, S = Sales Order, P = Purchase Order',
  `Quantity` int NOT NULL COMMENT 'Product quantity.',
  `ActualCost` decimal(19,4) NOT NULL COMMENT 'Product cost.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`TransactionID`),
  KEY `IX_TransactionHistoryArchive_ProductID` (`ProductID`),
  KEY `IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLi19` (`ReferenceOrderID`,`ReferenceOrderLineID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Transactions for previous years.';
