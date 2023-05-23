CREATE TABLE `Person_Password` (
  `BusinessEntityID` int NOT NULL,
  `PasswordHash` varchar(128) NOT NULL COMMENT 'Password for the e-mail account.',
  `PasswordSalt` varchar(10) NOT NULL COMMENT 'Random value concatenated with the password string before the password is hashed.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`BusinessEntityID`),
  UNIQUE KEY `rowguid` (`rowguid`),
  CONSTRAINT `FK_Password_Person_BusinessEntityID` FOREIGN KEY (`BusinessEntityID`) REFERENCES `Person_Person` (`BusinessEntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='One way hashed authentication information';
