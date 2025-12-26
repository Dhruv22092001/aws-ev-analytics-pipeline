-- =========================================================
-- Purpose:
-- Create an analytics-ready Parquet table optimized for
-- BI dashboards and repeated querying.
--
-- Why Parquet?
-- - Columnar storage (faster queries)
-- - Lower Athena cost (less data scanned)
-- - Ideal for dashboards with multiple KPIs
--
-- Why CTAS (CREATE TABLE AS SELECT)?
-- - Transforms raw CSV into clean, structured analytics data
-- - Materializes results for reuse across dashboards
-- =========================================================

CREATE TABLE ev_market_analytics
WITH (
    format = 'PARQUET',  -- Columnar analytics format
    external_location = 's3://corporate-analytics-data/analytics/ev_market_analytics/'
)
AS
SELECT
    region,
    powertrain,
    year,
    parameter AS metric,   -- Renamed for BI-friendly semantics
    value
FROM ev_market_data_clean
WHERE unit = 'Vehicles'    -- Focus on vehicle count metrics
  AND year IS NOT NULL;    -- Ensure time-series integrity
