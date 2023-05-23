CREATE TABLE `Production_ProductListPriceHistory` (
  `ProductID` int NOT NULL COMMENT 'Product identification number. Foreign key to Product.ProductID',
  `StartDate` datetime(6) NOT NULL COMMENT 'List price start date.',
  `EndDate` datetime(6) DEFAULT NULL COMMENT 'List price end date',
  `ListPrice` decimal(19,4) NOT NULL COMMENT 'Product list price.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ProductID`,`StartDate`),
  CONSTRAINT `FK_ProductListPriceHistory_Product_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `Production_Product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Changes in the list price of a product over time.';
