CREATE TABLE `HumanResources_Employee` (
  `BusinessEntityID` int NOT NULL COMMENT 'Primary key for Employee records.  Foreign key to BusinessEntity.BusinessEntityID.',
  `NationalIDNumber` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Unique national identification number such as a social security number.',
  `LoginID` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Network login.',
  `OrganizationNode` varchar(255) DEFAULT NULL COMMENT 'Where the employee is located in corporate hierarchy.',
  `OrganizationLevel` smallint DEFAULT NULL COMMENT 'The depth of the employee in the corporate hierarchy.',
  `JobTitle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Work title such as Buyer or Sales Representative.',
  `BirthDate` date NOT NULL COMMENT 'Date of birth.',
  `MaritalStatus` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'M = Married, S = Single',
  `Gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'M = Male, F = Female',
  `HireDate` date NOT NULL COMMENT 'Employee hired on this date.',
  `SalariedFlag` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Job classification. 0 = Hourly, not exempt from collective bargaining. 1 = Salaried, exempt from collective bargaining.',
  `VacationHours` smallint NOT NULL DEFAULT '0' COMMENT 'Number of available vacation hours.',
  `SickLeaveHours` smallint NOT NULL DEFAULT '0' COMMENT 'Number of available sick leave hours.',
  `CurrentFlag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = Inactive, 1 = Active',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`BusinessEntityID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `AK_Employee_NationalIDNumber` (`NationalIDNumber`),
  UNIQUE KEY `AK_Employee_rowguid` (`rowguid`),
  UNIQUE KEY `AK_Employee_LoginID` (`LoginID`(255)),
  KEY `IX_Employee_OrganizationNode` (`OrganizationNode`),
  KEY `IX_Employee_OrganizationLevel_OrganizationNode` (`OrganizationLevel`,`OrganizationNode`),
  CONSTRAINT `FK_Employee_Person_BusinessEntityID` FOREIGN KEY (`BusinessEntityID`) REFERENCES `Person_Person` (`BusinessEntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Employee information such as salary, department, and title.';