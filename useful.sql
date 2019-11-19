# 1. column types
SELECT column_name, data_type FROM information_schema.columns
WHERE table_name = 'table';

# 2. set search path
SET search_path TO siatkowka;