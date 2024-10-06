-- 02_rollback_add_categories.sql
-- Rollback script for Categories and Products modifications

-- Step 1: Remove the foreign key constraint from Products
ALTER TABLE Products
DROP CONSTRAINT IF EXISTS FK_Products_Categories;
GO

-- Step 2: Remove the category_id column from Products
ALTER TABLE Products
DROP COLUMN IF EXISTS category_id;
GO

-- Step 3: Re-add the old Category column in Products
ALTER TABLE Products
ADD Category NVARCHAR(100) NULL;
GO

-- Step 4: Drop the Categories table
DROP TABLE IF EXISTS Categories;
GO
