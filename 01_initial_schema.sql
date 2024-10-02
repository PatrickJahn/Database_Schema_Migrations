-- 01_initial_schema.sql
-- Initial Schema Setup for Products Table and Database

-- Step 1: Create the database
CREATE DATABASE ECommerceDB;
GO

-- Step 2: Use ECommerceDB
USE ECommerceDB;
GO

-- Step 3: Create the Products table with additional fields
CREATE TABLE Products (
    Id INT PRIMARY KEY IDENTITY(1,1),  -- Auto-incrementing primary key
    Name NVARCHAR(255) NOT NULL,       -- Product name, cannot be null
    Description NVARCHAR(MAX) NULL,    -- Detailed product description
    Price DECIMAL(10, 2) NOT NULL,     -- Product price with two decimal places
    StockQuantity INT NOT NULL,        -- Quantity available in stock
    CreatedDate DATETIME DEFAULT GETDATE(), -- Date product was added
    IsActive BIT DEFAULT 1,            -- Whether the product is active or not (1 = active, 0 = inactive)
    Category NVARCHAR(100) NULL        -- Product category
);
GO

-- Optional: Insert example products for testing
INSERT INTO Products (Name, Description, Price, StockQuantity, Category)
VALUES 
('Sample Product 1', 'This is a description for product 1', 19.99, 100, 'Electronics'),
('Sample Product 2', 'This is a description for product 2', 29.99, 200, 'Clothing');
GO
