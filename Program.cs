using System;
using System.Linq;
using Database_Schema_Migrations;

using var db = new ProductContext();

TestProductDb();


void TestProductDb()
{
    
// Note: This sample requires the database to be created before running.
 Console.WriteLine($"Database path: {db.DbPath}.");

// Create
 Console.WriteLine("Inserting a new product");
 db.Add(new ProductModel()
 {
  Id = 1, Name = "Test product", Description = "Just for testings", StockQuantity = 12, Category = "Tests",
  Price = 20, CreatedDate = DateTime.UtcNow, IsActive = true
 });
 db.SaveChanges();

// Read
 Console.WriteLine("Querying for a blog");
 var product = db.Products
  .OrderBy(b => b.Id)
  .First();

 Console.WriteLine(product.Name);


}