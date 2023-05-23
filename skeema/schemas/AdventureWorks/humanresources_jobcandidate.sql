CREATE TABLE `HumanResources_JobCandidate` (
  `JobCandidateID` int NOT NULL COMMENT 'Primary key for JobCandidate records.',
  `BusinessEntityID` int DEFAULT NULL COMMENT 'Employee identification number if applicant was hired. Foreign key to Employee.BusinessEntityID.',
  `Resume` text COMMENT 'Résumé in XML format.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`JobCandidateID`),
  KEY `IX_JobCandidate_BusinessEntityID` (`BusinessEntityID`),
  CONSTRAINT `FK_JobCandidate_Employee_BusinessEntityID` FOREIGN KEY (`BusinessEntityID`) REFERENCES `HumanResources_Employee` (`BusinessEntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Résumés submitted to Human Resources by job applicants.';
