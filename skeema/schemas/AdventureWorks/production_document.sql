CREATE TABLE `Production_Document` (
  `DocumentNode` varchar(255) NOT NULL COMMENT 'Primary key for Document records.',
  `DocumentLevel` smallint DEFAULT NULL COMMENT 'Depth in the document hierarchy.',
  `Title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Title of the document.',
  `Owner` int NOT NULL COMMENT 'Employee who controls the document.  Foreign key to Employee.BusinessEntityID',
  `FolderFlag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = This is a folder, 1 = This is a document.',
  `FileName` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'File name of the document',
  `FileExtension` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'File extension indicating the document type. For example, .doc or .txt.',
  `Revision` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Revision number of the document. ',
  `ChangeNumber` int NOT NULL DEFAULT '0' COMMENT 'Engineering change approval number.',
  `Status` tinyint unsigned NOT NULL COMMENT '1 = Pending approval, 2 = Approved, 3 = Obsolete',
  `DocumentSummary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'Document abstract.',
  `Document` longblob COMMENT 'Complete document.',
  `rowguid` varchar(64) NOT NULL COMMENT 'ROWGUIDCOL number uniquely identifying the record. Required for FileStream.',
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time the record was last updated.',
  PRIMARY KEY (`DocumentNode`),
  UNIQUE KEY `rowguid` (`rowguid`),
  UNIQUE KEY `UQ__Document__F73921F7C5112C2E` (`rowguid`),
  UNIQUE KEY `AK_Document_rowguid` (`rowguid`),
  UNIQUE KEY `AK_Document_DocumentLevel_DocumentNode` (`DocumentLevel`,`DocumentNode`),
  KEY `IX_Document_FileName_Revision` (`FileName`(255),`Revision`),
  KEY `FK_Document_Employee_Owner` (`Owner`),
  CONSTRAINT `FK_Document_Employee_Owner` FOREIGN KEY (`Owner`) REFERENCES `HumanResources_Employee` (`BusinessEntityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Product maintenance documents.';