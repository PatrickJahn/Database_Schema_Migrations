namespace Database_Schema_Migrations;

public class ProductModel
{
    
    public int Id { get; set; }
    public string Name { get; set; }
    public string Description { get; set; }
    public decimal Price { get; set; }
    public int StockQuantity { get; set; }
    public CategoryModel Category { get; set; }
    public DateTime CreatedDate { get; set; }
    public bool IsActive { get; set; }

}