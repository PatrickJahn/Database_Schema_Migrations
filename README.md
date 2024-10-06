
# ECommerceDB Manual Database Migration

This repository contains SQL scripts to perform manual database migrations for the **ECommerceDB**. The migrations include setting up the initial schema, adding product categories, implementing product ratings, and providing rollback scripts to revert each change.

## Project Overview

The database migrations cover the following tasks:

1. **Initial Schema Setup**: Create the `Products` table with relevant fields.
2. **Add Categories**: Introduce a `Categories` table and update the `Products` table with a foreign key (`category_id`).
3. **Add Product Ratings**: Add a `ProductRatings` table to store ratings for each product.

## Prerequisites

- **SQL Server**: Ensure you have a running instance of SQL Server.
- **SQLCMD**: The SQLCMD utility is required to run the SQL scripts from the command line.
- **Database**: Scripts assume a new database, but they can be adapted for existing databases.

## Migrations

### 1. Initial Schema Setup

The first migration script (`01_initial_schema.sql`) sets up the initial `Products` table.

Schema for `Products` table:
- `Id`: Primary key, auto-incrementing integer.
- `Name`: Name of the product (nvarchar).
- `Description`: Product description (nvarchar).
- `Price`: Product price (decimal).
- `StockQuantity`: Available stock quantity (int).
- `CreatedDate`: Date when the product was added (datetime).
- `IsActive`: Status of the product (bit).
- `Category`: (Removed in later migrations).

#### Running the Initial Schema Setup:

```bash
sqlcmd -S <server> -i 01_initial_schema.sql
```

### 2. Add Product Categories

The second migration script (`02_add_categories.sql`) creates the `Categories` table and modifies the `Products` table by:
- Adding `category_id` as a foreign key to reference `Categories`.
- Removing the previous `Category` column from `Products`.

Schema for `Categories` table:
- `Id`: Primary key, auto-incrementing integer.
- `Name`: Name of the category (nvarchar).

#### Running the Add Categories Migration:

```bash
sqlcmd -S <server> -i 02_add_categories.sql
```

### 3. Add Product Ratings

The third migration script (`03_add_ratings.sql`) introduces a `ProductRatings` table. This table holds ratings for products.

Schema for `ProductRatings` table:
- `Id`: Primary key, auto-incrementing integer.
- `Product_Id`: Foreign key to the `Products` table.
- `Rating`: Rating value (int, between 1 and 5).
- `Review`: Optional user comment (nvarchar, up to 1000 characters).

#### Running the Add Product Ratings Migration:

```bash
sqlcmd -S <server> -i 03_add_ratings.sql
```

### Testing the Migrations

To test the migrations, run each SQL script in sequence and validate that:
1. The schema is created correctly.
2. The tables are populated with the example data.
3. Foreign key relationships are established and function as expected.

---

## Rollback Plan

To revert each migration, rollback scripts are provided. Rollbacks should be tested in reverse order (from the most recent migration to the oldest).

### Rollback for Task 3: Product Ratings

To remove the `ProductRatings` table, run the rollback script for task 3:

```bash
sqlcmd -S <server> -d ECommerceDB -i 03_rollback_add_ratings.sql
```

### Rollback for Task 2: Categories Addition

To remove the `Categories` table and revert changes to the `Products` table, run the rollback script for task 2:

```bash
sqlcmd -S <server> -d ECommerceDB -i 02_rollback_add_categories.sql
```

### Rollback for Task 1: Initial Schema Setup

To completely remove the `Products` table, run the rollback script for task 1:

```bash
sqlcmd -S <server> -d ECommerceDB -i 01_rollback_initial_schema.sql
```

### Testing the Rollback Process

1. Apply each migration in sequence.
2. Run the rollback scripts in reverse order:
   - Start with the rollback for task 3 (Product Ratings).
   - Then, run the rollback for task 2 (Categories).
   - Finally, run the rollback for task 1 (Products).
   
3. Validate that each rollback successfully removes the respective tables and restores the database to its previous state.
