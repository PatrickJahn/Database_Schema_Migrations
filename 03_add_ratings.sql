-- 03_add_ratings.sql
-- Migration script for adding Product ratings with a relationship to Products

-- Step 1: Use ECommerceDB
USE ECommerceDB;
GO

-- Step 2: Create Table for product ratings 
CREATE TABLE ProductRatings (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Product_Id INT NOT NULL,
    Rating INT CHECK (Rating >= 1 AND Rating <= 5), -- Check to make sure rating is between 1 and 5
    Review VARCHAR(1000),
    CONSTRAINT FK_Product FOREIGN KEY (Product_Id) 
    REFERENCES Products(Id)
);



-- Step 3: Insert example product rating for testing
Declare @product_id INT
SELECT @product_id = MAX(Id)
FROM Products

INSERT INTO ProductRatings (Product_Id, Rating, Review)
VALUES 
(@product_id, 4, 'Very good product')
GO


SELECT * FROM ProductRatings
