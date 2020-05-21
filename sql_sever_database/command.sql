-- https://www.c-sharpcorner.com/blogs/get-list-of-stored-procedure-and-tables-from-sql-server-database1

-- For Tables:
SELECT TABLE_NAME  FROM INFORMATION_SCHEMA.TABLES

-- For Stored Procedure:
Select [NAME] from sysobjects where type = 'P' and category = 0

-- For Views:
Select [NAME] from sysobjects where type = 'V' and category = 0