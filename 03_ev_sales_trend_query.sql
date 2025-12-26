-- =========================================================
-- Purpose:
-- Calculate total EV sales by year.
--
-- Why this query?
-- - Validates data correctness
-- - Used for exploratory analysis
-- - Helps confirm trends before dashboarding
--
-- Note:
-- This query does NOT create a table.
-- It is computed on-the-fly and is best suited
-- for ad-hoc analysis, not dashboards.
-- =========================================================

SELECT
    year,
    SUM(value) AS total_ev_sales
FROM ev_market_data_clean
WHERE parameter = 'EV sales'
  AND unit = 'Vehicles'
GROUP BY year
ORDER BY year;
