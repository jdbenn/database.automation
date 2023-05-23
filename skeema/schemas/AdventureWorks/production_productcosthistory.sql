CREATE TABLE `Production_ProductCostHistory` (
  `ProductID` int NOT NULL COMMENT 'Product identification number. Foreign key to Product.ProductID',
  `StartDate` datetime(6) NOT NULL COMMENT 'Product cost start date.',
  `EndDate` datetime(6) DEFAULT NULL COMMENT 'Product cost end date.',
  `StandardCost` decimal(19,4) NOT NULL COMMENT 'Standard cost of the product.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ProductID`,`StartDate`),
  CONSTRAINT `FK_ProductCostHistory_Product_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `Production_Product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Changes in the cost of a product over time.';
