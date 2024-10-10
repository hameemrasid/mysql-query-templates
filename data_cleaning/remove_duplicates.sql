-- This script removes duplicate records from a table
DELETE FROM your_table
WHERE id NOT IN (
    SELECT MIN(id)
    FROM your_table
    GROUP BY column_to_check_duplicates
);
