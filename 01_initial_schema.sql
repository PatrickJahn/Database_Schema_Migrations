-- 01_initial_schema.sql
-- Initial Schema Setup for Products Table and Database

-- Step 1: Create the database
CREATE DATABASE ECommerceDB;
GO

-- Step 2: Use the DB
USE ECommerceDB;
GO

-- Step 3: Create the Products table
CREATE TABLE Products (
    Id INT PRIMARY KEY IDENTITY(1,1),  -- Auto-incrementing primary key
    Name NVARCHAR(255) NOT NULL,       -- Product name, cannot be null
    Price DECIMAL(10, 2) NOT NULL      -- Product price with two decimal places
);
GO

-- Optional: Insert example products for testing
INSERT INTO Products (Name, Price) 
VALUES 
('Sample Product 1', 19.99),
('Sample Product 2', 29.99);
GO
