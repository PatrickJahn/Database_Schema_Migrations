-- 02_add_categories.sql
-- Step 1: Create the Categories table
CREATE TABLE Categories (
    Id INT PRIMARY KEY IDENTITY(1,1),   -- Auto-incrementing primary key for categories
    Name NVARCHAR(100) NOT NULL         -- Category name
);
GO

-- Step 2: Insert sample categories (Optional)
INSERT INTO Categories (Name)
VALUES 
('Electronics'),
('Clothing'),
('Home & Kitchen'),
('Toys & Games');
GO

-- Step 3: Alter the Products table
-- Remove the old Category column and add the category_id foreign key
ALTER TABLE Products
DROP COLUMN Category;
GO

ALTER TABLE Products
ADD category_id INT NULL;  -- Add new category_id column that references Categories table
GO

-- Step 4: Add a foreign key constraint to link Products and Categories
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (category_id) REFERENCES Categories(Id);
GO

-- Step 5: Update existing products to assign them to categories
UPDATE Products
SET category_id = (SELECT Id FROM Categories WHERE Name = 'Electronics')
WHERE Name = 'Sample Product 1';

UPDATE Products
SET category_id = (SELECT Id FROM Categories WHERE Name = 'Clothing')
WHERE Name = 'Sample Product 2';
GO
