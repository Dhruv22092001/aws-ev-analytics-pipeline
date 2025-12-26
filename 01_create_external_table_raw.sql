-- =========================================================
-- Purpose:
-- Create an EXTERNAL table in Athena over raw EV CSV data
-- stored in Amazon S3.
--
-- Why EXTERNAL?
-- - Data remains in S3 (Athena does NOT own the data)
-- - Allows safe querying without modifying raw files
--
-- Why this step?
-- - Acts as the ingestion layer of the analytics pipeline
-- - Enables SQL-based access to raw CSV data
-- =========================================================

CREATE EXTERNAL TABLE ev_market_data_clean (
    region STRING,
    category STRING,
    parameter STRING,
    mode STRING,
    powertrain STRING,
    year INT,
    unit STRING,
    value DOUBLE
)

-- Specify CSV parsing using OpenCSVSerde
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    'separatorChar' = ',',     -- CSV delimiter
    'quoteChar' = '"',         -- Handles quoted values
    'escapeChar' = '\\'        -- Handles escaped characters
)

-- Location of raw CSV files in S3
LOCATION 's3://corporate-analytics-data/raw/'

-- Table properties for data quality handling
TBLPROPERTIES (
    'skip.header.line.count' = '1',        -- Skip CSV header row
    'use.null.for.invalid.data' = 'true'   -- Prevent query failures due to bad rows
);
