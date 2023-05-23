CREATE TABLE `Production_ProductReview` (
  `ProductReviewID` int NOT NULL COMMENT 'Primary key for ProductReview records.',
  `ProductID` int NOT NULL COMMENT 'Product identification number. Foreign key to Product.ProductID.',
  `ReviewerName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Name of the reviewer.',
  `ReviewDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date review was submitted.',
  `EmailAddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Reviewer''s e-mail address.',
  `Rating` int NOT NULL COMMENT 'Product rating given by the reviewer. Scale is 1 to 5 with 5 as the highest rating.',
  `Comments` varchar(3850) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Reviewer''s comments',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ProductReviewID`),
  KEY `IX_ProductReview_ProductID_Name` (`ProductID`,`ReviewerName`,`Comments`(255)),
  CONSTRAINT `FK_ProductReview_Product_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `Production_Product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Customer reviews of products they have purchased.';
