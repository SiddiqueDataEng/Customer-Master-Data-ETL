/*
 * Customer Master Data ETL
 * Project #68 - Complete Database Implementation
 * SQL Server 2008/2012
 * Technology: SSIS, MSSQL
 * Created: 2012
 */

USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'CustomerMDM')
BEGIN
    ALTER DATABASE CustomerMDM SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE CustomerMDM;
END
GO

CREATE DATABASE CustomerMDM
ON PRIMARY
(
    NAME = 'CustomerMDM_Data',
    FILENAME = 'C:\SQLData\CustomerMDM_Data.mdf',
    SIZE = 100MB,
    MAXSIZE = 5GB,
    FILEGROWTH = 10MB
)
LOG ON
(
    NAME = 'CustomerMDM_Log',
    FILENAME = 'C:\SQLData\CustomerMDM_Log.ldf',
    SIZE = 50MB,
    MAXSIZE = 1GB,
    FILEGROWTH = 5MB
);
GO

ALTER DATABASE CustomerMDM SET RECOVERY SIMPLE;
ALTER DATABASE CustomerMDM SET AUTO_UPDATE_STATISTICS ON;
GO

USE CustomerMDM;
GO

PRINT 'Database CustomerMDM created successfully';
PRINT 'Project: Customer Master Data ETL';
PRINT 'Description: Unified customer record creation';
GO
