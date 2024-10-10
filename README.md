
# E-Commerce Application - Database Schema Migrations

## Overview

This project demonstrates the use of Entity Framework Core to implement schema migrations for an e-commerce application. The migrations include adding a `Products` table, `Categories` table, and `ProductRatings` table.

## Prerequisites

- .NET SDK 6.0 or later
- Entity Framework Core
- SQL Server (or compatible local environment)
  
## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/PatrickJahn/Database_Schema_Migrations.git
cd your-repo-folder
```
### 2. Navigate to the Project

First of all, you need to navigate into the project directory. From the root directory, use the following command:

```bash
cd EFMigrations
```

### 3. Apply Migrations

To apply the Entity Framework Core migrations and update the database schema, run the following command:

```bash
dotnet ef database update
```

This will apply the latest migrations and create the necessary tables (`Products`, `Categories`, `ProductRatings`).

### Migrations Overview

The migrations included in this project are:

- **InitialCreate**: Creates the `Products` table.
- **AddCategories**: Adds the `Categories` table and establishes a foreign key relationship between `Products` and `Categories`.
- **AddProductRatings**: Adds the `ProductRatings` table with a foreign key relationship to `Products`.

## Migration Details

### 1. InitialCreate
This migration creates the `Products` table with the following columns:
- `Id`: Primary key (int)
- `Name`: Name of the product (string, non-nullable)
- `Description`: Product description (string, non-nullable)
- `Price`: Product price (decimal, non-nullable)
- `StockQuantity`: Number of items in stock (int, non-nullable)
- `Category`: Product category (string, non-nullable)
- `CreatedDate`: Timestamp of product creation (DateTime, non-nullable)
- `IsActive`: Status of the product (bool, non-nullable)

### 2. AddCategories
This migration adds a new `Categories` table and modifies the `Products` table:
- Removes the `Category` column from the `Products` table.
- Adds a `CategoryId` column to the `Products` table, establishing a foreign key relationship with the `Categories` table.
- `Categories` table structure:
  - `Id`: Primary key (int)
  - `Name`: Name of the category (string, non-nullable)

### 3. AddProductRatings
This migration adds the `ProductRatings` table, which includes:
- `Id`: Primary key (int)
- `ProductId`: Foreign key (int) linking to the `Products` table
- `Rating`: Rating score (int, non-nullable)
- `Review`: Review text (string, non-nullable)
- `CreatedAt`: Timestamp of when the rating was created (DateTime, non-nullable)

## Rollback Instructions

### Rolling Back a Specific Migration

To roll back to a specific migration, use the following command, specifying the name of the migration you want to revert to:

```bash
dotnet ef database update <MigrationName>
```

For example, to roll back to the initial schema (before adding categories), you can run:

```bash
dotnet ef database update 20241008123756_InitialCreate
```

### Rolling Back All Migrations

To completely revert the database to its original state (dropping all tables), use:

```bash
dotnet ef database update 0
```

This will remove all migrations and drop the tables that were created.

## Testing Rollback Process

### Step-by-Step Rollback Testing

1. Apply all migrations:
    ```bash
    dotnet ef database update
    ```

2. Roll back to the previous migration (before `AddProductRatings`):
    ```bash
    dotnet ef database update 20241008125251_AddCategories
    ```

3. Verify that the `ProductRatings` table is removed from the database.

4. Roll back to the initial schema:
    ```bash
    dotnet ef database update 20241008123756_InitialCreate
    ```

5. Verify that only the `Products` table exists in the database.

6. Roll back all migrations:
    ```bash
    dotnet ef database update 0
    ```

7. Verify that all tables are dropped and the database is empty.


## Troubleshooting

- If a migration fails, ensure that all necessary dependencies are installed (`dotnet-ef` tool).

