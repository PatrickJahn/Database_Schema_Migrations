# Database_Schema_Migrations


## Rollback Instructions for EF Core Migrations

Entity Framework Core automatically generates `Up` and `Down` methods for each migration. The `Up` method applies changes, while the `Down` method reverts them. To roll back a migration, use the following command:


Examples:


### Manual Migration Rollback Instructions

To manually roll back the initial schema or other SQL scripts, run the following commands in your SQL client:

```sql
DROP TABLE ProductRatings;


```bash

dotnet ef database update <PreviousMigrationName>


 rollback the AddProductRatings migration and drop the ProductRatings table:

 dotnet ef database update InitialCreate


 Revert the Most Recent Migration:

 dotnet ef migrations remove