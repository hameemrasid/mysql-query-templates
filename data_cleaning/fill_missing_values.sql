-- This script fills missing values in a specific column with a default value
UPDATE your_table
SET column_with_nulls = 'default_value'
WHERE column_with_nulls IS NULL;
