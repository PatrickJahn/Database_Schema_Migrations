-- 01_rollback_initial_schema.sql
-- Rollback script for the initial Products table setup

-- Step 1: Drop the Products table
DROP TABLE IF EXISTS Products;
GO

-- Optional: Drop the database if needed
-- DROP DATABASE IF EXISTS ECommerceDB;
