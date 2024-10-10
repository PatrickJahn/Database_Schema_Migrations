using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


    namespace Database_Schema_Migrations
{
    public class ProductRating
    {
        public int Id { get; set; }                // Primary Key
        public int ProductId { get; set; }         // Foreign Key to ProductModel
        public int Rating { get; set; }            // Rating value (1-5)
        public string Review { get; set; }         // Optional review text
        public DateTime CreatedAt { get; set; }    // Timestamp

        // Navigation property back to ProductModel
        public ProductModel Product { get; set; }  // The product this rating is related to
    }
}