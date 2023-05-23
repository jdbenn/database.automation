CREATE TABLE `Production_BillOfMaterials` (
  `BillOfMaterialsID` int NOT NULL COMMENT 'Primary key for BillOfMaterials records.',
  `ProductAssemblyID` int DEFAULT NULL COMMENT 'Parent product identification number. Foreign key to Product.ProductID.',
  `ComponentID` int NOT NULL COMMENT 'Component identification number. Foreign key to Product.ProductID.',
  `StartDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date the component started being used in the assembly item.',
  `EndDate` datetime(6) DEFAULT NULL COMMENT 'Date the component stopped being used in the assembly item.',
  `UnitMeasureCode` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Standard code identifying the unit of measure for the quantity.',
  `BOMLevel` smallint NOT NULL COMMENT 'Indicates the depth the component is from its parent (AssemblyID).',
  `PerAssemblyQty` decimal(8,2) NOT NULL DEFAULT '1.00' COMMENT 'Quantity of the component needed to create the assembly.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`BillOfMaterialsID`),
  UNIQUE KEY `AK_BillOfMaterials_ProductAssemblyID_ComponentID_StartDate` (`ProductAssemblyID`,`ComponentID`,`StartDate`),
  KEY `IX_BillOfMaterials_UnitMeasureCode` (`UnitMeasureCode`),
  KEY `FK_BillOfMaterials_Product_ComponentID` (`ComponentID`),
  CONSTRAINT `FK_BillOfMaterials_Product_ComponentID` FOREIGN KEY (`ComponentID`) REFERENCES `Production_Product` (`ProductID`),
  CONSTRAINT `FK_BillOfMaterials_Product_ProductAssemblyID` FOREIGN KEY (`ProductAssemblyID`) REFERENCES `Production_Product` (`ProductID`),
  CONSTRAINT `FK_BillOfMaterials_UnitMeasure_UnitMeasureCode` FOREIGN KEY (`UnitMeasureCode`) REFERENCES `Production_UnitMeasure` (`UnitMeasureCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Items required to make bicycles and bicycle subassemblies. It identifies the heirarchical relationship between a parent product and its components.';
