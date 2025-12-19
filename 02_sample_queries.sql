-- ==========================================
-- Sample Query 1: Total EV sales by region
-- Purpose: Check regional distribution of EV sales
-- ==========================================
SELECT
  region,
  SUM(value) AS total_ev_sales
FROM ev_market_data_clean
WHERE parameter = 'EV sales'
  AND unit = 'Vehicles'
GROUP BY region
ORDER BY total_ev_sales DESC;

-- ==========================================
-- Sample Query 2: EV sales by powertrain type
-- Purpose: Analyze adoption of different EV powertrains
-- ==========================================
SELECT
  powertrain,
  SUM(value) AS total_ev_sales
FROM ev_market_data_clean
WHERE parameter = 'EV sales'
  AND unit = 'Vehicles'
GROUP BY powertrain
ORDER BY total_ev_sales DESC;

-- ==========================================
-- Sample Query 3: Year-over-Year growth of EV sales
-- Purpose: Calculate YoY growth for trend analysis
-- ==========================================
WITH yearly_sales AS (
  SELECT
    year,
    SUM(value) AS total_ev_sales
  FROM ev_market_data_clean
  WHERE parameter = 'EV sales'
    AND unit = 'Vehicles'
  GROUP BY year
)
SELECT
  year,
  total_ev_sales,
  LAG(total_ev_sales) OVER (ORDER BY year) AS prev_year_sales,
  (total_ev_sales - LAG(total_ev_sales) OVER (ORDER BY year)) * 100.0 / LAG(total_ev_sales) OVER (ORDER BY year) AS yoy_growth_pct
FROM yearly_sales
ORDER BY year;
