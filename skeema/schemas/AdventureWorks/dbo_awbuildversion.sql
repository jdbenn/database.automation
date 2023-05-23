CREATE TABLE `dbo_AWBuildVersion` (
  `SystemInformationID` tinyint unsigned NOT NULL COMMENT 'Primary key for AWBuildVersion records.',
  `Database Version` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Version number of the database in 9.yy.mm.dd.00 format.',
  `VersionDate` datetime(6) NOT NULL COMMENT 'Date and time the record was last updated.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`SystemInformationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Current version number of the AdventureWorks 2016 sample database. ';
