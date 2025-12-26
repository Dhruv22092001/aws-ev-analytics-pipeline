🚗📊 From Raw EV Data to Executive Dashboards on AWS

How do data analysts actually use AWS in the real world?
This project answers that question by building a production-style analytics pipeline using real global EV market data.

🧠 The Idea

Instead of treating AWS as a collection of services, this project treats it as a business analytics platform.

The goal was simple:

Turn messy raw CSV data into fast, dashboard-ready insights — the same way it’s done in corporate environments.

🏗️ What This Project Demonstrates

✔ How raw data is stored in an S3 data lake
✔ How schemas are managed using AWS Glue
✔ How analysts query large datasets using Amazon Athena
✔ Why companies convert CSV data into Parquet analytics tables
✔ How cloud data is consumed by BI tools like Power BI

📂 Dataset

Source: International Energy Agency (IEA) – Global EV Data 2024

Scope: Global EV sales, stock, and powertrain metrics

Granularity: Region × Year × Powertrain × Metric

🧩 Key Design Decisions (Corporate Thinking)
Why External Tables?

Raw data stays untouched in S3

Safe, scalable querying

Why Parquet?

- Columnar storage → faster queries

- Lower Athena scan costs

- Designed for dashboards & KPIs

- Why Separate Analytics Tables?

- One optimized table → many dashboards

- No repeated heavy calculations

- BI tools stay fast and responsive

📊 Example Insight

EV Sales Growth by Year

SELECT
  year,
  SUM(value) AS total_ev_sales
FROM ev_market_analytics
WHERE metric = 'EV sales'
GROUP BY year
ORDER BY year;

🎯 What I Learned

- How cloud data lakes are structured

- Why analytics optimization matters more than raw querying

- How BI tools interact with cloud data

- How to think like a corporate data analyst, not just write SQL

🔮 Possible Next Steps

- Partition Parquet tables by year

- Automate ingestion with AWS Lambda

- Add forecasting models for EV adoption

- Deploy QuickSight dashboards

👋 About Me

Dhruv Pandey
MSc Data Science & AI
Aspiring Data Analyst / Data Scientist

📫 Open to analytics & data roles involving cloud, BI, and real-world datasets.
