CREATE TABLE `Sales_PersonCreditCard` (
  `BusinessEntityID` int NOT NULL COMMENT 'Business entity identification number. Foreign key to Person.BusinessEntityID.',
  `CreditCardID` int NOT NULL COMMENT 'Credit card identification number. Foreign key to CreditCard.CreditCardID.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`BusinessEntityID`,`CreditCardID`),
  KEY `FK_PersonCreditCard_CreditCard_CreditCardID` (`CreditCardID`),
  CONSTRAINT `FK_PersonCreditCard_CreditCard_CreditCardID` FOREIGN KEY (`CreditCardID`) REFERENCES `Sales_CreditCard` (`CreditCardID`),
  CONSTRAINT `FK_PersonCreditCard_Person_BusinessEntityID` FOREIGN KEY (`BusinessEntityID`) REFERENCES `Person_Person` (`BusinessEntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cross-reference table mapping people to their credit card information in the CreditCard table. ';
