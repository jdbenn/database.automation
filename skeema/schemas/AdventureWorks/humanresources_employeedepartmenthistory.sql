CREATE TABLE `HumanResources_EmployeeDepartmentHistory` (
  `BusinessEntityID` int NOT NULL COMMENT 'Employee identification number. Foreign key to Employee.BusinessEntityID.',
  `DepartmentID` smallint NOT NULL COMMENT 'Department in which the employee worked including currently. Foreign key to Department.DepartmentID.',
  `ShiftID` tinyint unsigned NOT NULL COMMENT 'Identifies which 8-hour shift the employee works. Foreign key to Shift.Shift.ID.',
  `StartDate` date NOT NULL COMMENT 'Date the employee started work in the department.',
  `EndDate` date DEFAULT NULL COMMENT 'Date the employee left the department. NULL = Current department.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`BusinessEntityID`,`DepartmentID`,`ShiftID`,`StartDate`),
  KEY `IX_EmployeeDepartmentHistory_DepartmentID` (`DepartmentID`),
  KEY `IX_EmployeeDepartmentHistory_ShiftID` (`ShiftID`),
  CONSTRAINT `FK_EmployeeDepartmentHistory_Department_DepartmentID` FOREIGN KEY (`DepartmentID`) REFERENCES `HumanResources_Department` (`DepartmentID`),
  CONSTRAINT `FK_EmployeeDepartmentHistory_Employee_BusinessEntityID` FOREIGN KEY (`BusinessEntityID`) REFERENCES `HumanResources_Employee` (`BusinessEntityID`),
  CONSTRAINT `FK_EmployeeDepartmentHistory_Shift_ShiftID` FOREIGN KEY (`ShiftID`) REFERENCES `HumanResources_Shift` (`ShiftID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Employee department transfers.';
