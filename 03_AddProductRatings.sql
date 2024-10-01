CREATE TABLE ProductRatings (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Product_Id INT NOT NULL,
    Rating INT CHECK (Rating >= 1 AND Rating <= 5),
    Review VARCHAR(1000),
    CONSTRAINT FK_Product FOREIGN KEY (Product_Id)
    REFERENCES Products(Id)
);