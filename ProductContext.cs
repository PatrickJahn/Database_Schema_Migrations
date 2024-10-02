
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;

namespace Database_Schema_Migrations;

public class ProductContext : DbContext
{
    
    public DbSet<ProductModel> Products { get; set; }
    public string DbPath { get; }

    public ProductContext()
    {
        var folder = Environment.SpecialFolder.LocalApplicationData;
        var path = Environment.GetFolderPath(folder);
        DbPath = System.IO.Path.Join(path, "ECommerceDB.db");
    }

    // The following configures EF to create a Sqlite database file in the
    // special "local" folder for your platform.
    protected override void OnConfiguring(DbContextOptionsBuilder options)
        => options.UseSqlite($"Data Source={DbPath}");
    
}
