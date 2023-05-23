CREATE TABLE `Sales_CreditCard` (
  `CreditCardID` int NOT NULL COMMENT 'Primary key for CreditCard records.',
  `CardType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Credit card name.',
  `CardNumber` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Credit card number.',
  `ExpMonth` tinyint unsigned NOT NULL COMMENT 'Credit card expiration month.',
  `ExpYear` smallint NOT NULL COMMENT 'Credit card expiration year.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`CreditCardID`),
  UNIQUE KEY `AK_CreditCard_CardNumber` (`CardNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Customer credit card information.';
