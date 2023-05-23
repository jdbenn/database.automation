CREATE TABLE `HumanResources_EmployeePayHistory` (
  `BusinessEntityID` int NOT NULL COMMENT 'Employee identification number. Foreign key to Employee.BusinessEntityID.',
  `RateChangeDate` datetime(6) NOT NULL COMMENT 'Date the change in pay is effective',
  `Rate` decimal(19,4) NOT NULL COMMENT 'Salary hourly rate.',
  `PayFrequency` tinyint unsigned NOT NULL COMMENT '1 = Salary received monthly, 2 = Salary received biweekly',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`BusinessEntityID`,`RateChangeDate`),
  CONSTRAINT `FK_EmployeePayHistory_Employee_BusinessEntityID` FOREIGN KEY (`BusinessEntityID`) REFERENCES `HumanResources_Employee` (`BusinessEntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Employee pay history.';
