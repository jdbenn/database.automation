CREATE TABLE `Production_WorkOrder` (
  `WorkOrderID` int NOT NULL COMMENT 'Primary key for WorkOrder records.',
  `ProductID` int NOT NULL COMMENT 'Product identification number. Foreign key to Product.ProductID.',
  `OrderQty` int NOT NULL COMMENT 'Product quantity to build.',
  `StockedQty` int NOT NULL COMMENT 'Quantity built and put in inventory.',
  `ScrappedQty` smallint NOT NULL COMMENT 'Quantity that failed inspection.',
  `StartDate` datetime(6) NOT NULL COMMENT 'Work order start date.',
  `EndDate` datetime(6) DEFAULT NULL COMMENT 'Work order end date.',
  `DueDate` datetime(6) NOT NULL COMMENT 'Work order due date.',
  `ScrapReasonID` smallint DEFAULT NULL COMMENT 'Reason for inspection failure.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`WorkOrderID`),
  KEY `IX_WorkOrder_ScrapReasonID` (`ScrapReasonID`),
  KEY `IX_WorkOrder_ProductID` (`ProductID`),
  CONSTRAINT `FK_WorkOrder_Product_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `Production_Product` (`ProductID`),
  CONSTRAINT `FK_WorkOrder_ScrapReason_ScrapReasonID` FOREIGN KEY (`ScrapReasonID`) REFERENCES `Production_ScrapReason` (`ScrapReasonID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Manufacturing work orders.';
