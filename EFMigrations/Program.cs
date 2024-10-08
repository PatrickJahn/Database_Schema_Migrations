using System;
using System.Linq;
using Database_Schema_Migrations;
using Microsoft.EntityFrameworkCore;

using var db = new DatabaseContext();

TestProductDb();


void TestProductDb()
{
    
// Note: This sample requires the database to be created before running.
 Console.WriteLine($"Database path: {db.DbPath}.");

 // REMOVE ALL CATEGORY data
 Console.WriteLine("Removing categories");
 var categories = db.Categories
  .OrderBy(b => b.Id);

 foreach (var tmpCategory in categories)
 {
  db.Remove(tmpCategory);
 }

 
 
Console.WriteLine("Inserting Bike Category");
 var bikeCategory  = db.Add(new CategoryModel()
  {Id = 1, Name = "Bike"});
 
 db.SaveChanges();

 
 Console.WriteLine("Removing products");
 var products = db.Products
  .OrderBy(b => b.Id);

 foreach (var tmpProduct in products)
 {
  db.Remove(tmpProduct);
 }
 
 
// Create
 Console.WriteLine("Inserting a new product");
 db.Add(new ProductModel()
 {
  Id = 1, Name = "Test product", Description = "Just for testings", StockQuantity = 12,
  Category = bikeCategory.Entity,
  Price = 20, CreatedDate = DateTime.UtcNow, IsActive = true
 });
 db.SaveChanges();

// Read
 Console.WriteLine("Querying products with category");
 var product = db.Products
  .Include(productModel => productModel.Category)
  .OrderBy(b => b.Id)
  .First();

 Console.WriteLine("Found Product: " + product.Name);
 Console.WriteLine("Related category: " + product.Category.Name);


}