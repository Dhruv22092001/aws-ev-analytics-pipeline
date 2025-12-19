-- ==========================================
-- Query: Create EV Sales Trend Table (Parquet)
-- Purpose: Aggregate total EV sales per year and store
--          the results in a Parquet-formatted analytics table
-- Source: ev_market_data_clean
-- Notes: Only considers rows where 'parameter' = 'EV sales'
--        and 'unit' = 'Vehicles'
-- ==========================================
CREATE TABLE ev_sales_trend_table
WITH (
  format = 'PARQUET',
  external_location = 's3://corporate-analytics-data/analytics/ev_sales_trend/'
) AS
SELECT
  year,
  SUM(value) AS total_ev_sales
FROM ev_market_data_clean
WHERE parameter = 'EV sales'
  AND unit = 'Vehicles'
GROUP BY year;

-- ==========================================
-- Query: Preview EV Sales Trend
-- Purpose: Inspect the total EV sales per year
-- Notes: Orders results by year for easy visualization
-- ==========================================
SELECT
  year,
  SUM(value) AS total_ev_sales
FROM ev_market_data_clean
WHERE parameter = 'EV sales'
  AND unit = 'Vehicles'
GROUP BY year
ORDER BY year;

-- ==========================================
-- Query: Duplicate of CREATE TABLE for testing (optional)
-- Notes: Can be used for reruns if needed
-- ==========================================
CREATE TABLE ev_sales_trend_table
WITH (
  format = 'PARQUET',
  external_location = 's3://corporate-analytics-data/analytics/ev_sales_trend/'
) AS
SELECT
  year,
  SUM(value) AS total_ev_sales
FROM ev_market_data_clean
WHERE parameter = 'EV sales'
  AND unit = 'Vehicles'
GROUP BY year;

