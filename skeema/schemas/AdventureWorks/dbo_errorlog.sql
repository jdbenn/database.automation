CREATE TABLE `dbo_ErrorLog` (
  `ErrorLogID` int NOT NULL COMMENT 'Primary key for ErrorLog records.',
  `ErrorTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The date and time at which the error occurred.',
  `UserName` varchar(160) NOT NULL COMMENT 'The user who executed the batch in which the error occurred.',
  `ErrorNumber` int NOT NULL COMMENT 'The error number of the error that occurred.',
  `ErrorSeverity` int DEFAULT NULL COMMENT 'The severity of the error that occurred.',
  `ErrorState` int DEFAULT NULL COMMENT 'The state number of the error that occurred.',
  `ErrorProcedure` varchar(126) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'The name of the stored procedure or trigger where the error occurred.',
  `ErrorLine` int DEFAULT NULL COMMENT 'The line number at which the error occurred.',
  `ErrorMessage` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'The message text of the error that occurred.',
  PRIMARY KEY (`ErrorLogID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Audit table tracking errors in the the AdventureWorks database that are caught by the CATCH block of a TRY...CATCH construct. Data is inserted by stored procedure dbo.uspLogError when it is executed from inside the CATCH block of a TRY...CATCH construct.';
