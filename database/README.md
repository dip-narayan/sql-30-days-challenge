# Database Setup

This project uses PostgreSQL.

## Restore the Database

1. Create a new database named `hrdb`.

```sql
CREATE DATABASE hrdb;
```

2. Open **pgAdmin 4**.

3. Right-click the `hrdb` database.

4. Select **Restore...**

5. Configure:
   - **Format:** Custom or tar
   - **Filename:** `hrdb_backup.dump`

6. Click **Restore**.

After the restore completes, all required tables, constraints, relationships, and sample data will be available.