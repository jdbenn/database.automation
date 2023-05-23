CREATE TABLE `Production_WorkOrderRouting` (
  `WorkOrderID` int NOT NULL COMMENT 'Primary key. Foreign key to WorkOrder.WorkOrderID.',
  `ProductID` int NOT NULL COMMENT 'Primary key. Foreign key to Product.ProductID.',
  `OperationSequence` smallint NOT NULL COMMENT 'Primary key. Indicates the manufacturing process sequence.',
  `LocationID` smallint NOT NULL COMMENT 'Manufacturing location where the part is processed. Foreign key to Location.LocationID.',
  `ScheduledStartDate` datetime(6) NOT NULL COMMENT 'Planned manufacturing start date.',
  `ScheduledEndDate` datetime(6) NOT NULL COMMENT 'Planned manufacturing end date.',
  `ActualStartDate` datetime(6) DEFAULT NULL COMMENT 'Actual start date.',
  `ActualEndDate` datetime(6) DEFAULT NULL COMMENT 'Actual end date.',
  `ActualResourceHrs` decimal(9,4) DEFAULT NULL COMMENT 'Number of manufacturing hours used.',
  `PlannedCost` decimal(19,4) NOT NULL COMMENT 'Estimated manufacturing cost.',
  `ActualCost` decimal(19,4) DEFAULT NULL COMMENT 'Actual manufacturing cost.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`WorkOrderID`,`ProductID`,`OperationSequence`),
  KEY `IX_WorkOrderRouting_ProductID` (`ProductID`),
  KEY `FK_WorkOrderRouting_Location_LocationID` (`LocationID`),
  CONSTRAINT `FK_WorkOrderRouting_Location_LocationID` FOREIGN KEY (`LocationID`) REFERENCES `Production_Location` (`LocationID`),
  CONSTRAINT `FK_WorkOrderRouting_WorkOrder_WorkOrderID` FOREIGN KEY (`WorkOrderID`) REFERENCES `Production_WorkOrder` (`WorkOrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Work order details.';
