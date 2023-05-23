CREATE TABLE `Production_ProductPhoto` (
  `ProductPhotoID` int NOT NULL COMMENT 'Primary key for ProductPhoto records.',
  `ThumbNailPhoto` longblob COMMENT 'Small image of the product.',
  `ThumbnailPhotoFileName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Small image file name.',
  `LargePhoto` longblob COMMENT 'Large image of the product.',
  `LargePhotoFileName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Large image file name.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`ProductPhotoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Product images.';
