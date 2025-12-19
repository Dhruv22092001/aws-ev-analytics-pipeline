# aws-ev-analytics-pipeline

📊 Corporate EV Analytics Pipeline on AWS
📌 Overview

This project demonstrates a corporate-style data analytics pipeline built on AWS using real-world EV market data.
It covers data ingestion, querying, analytics optimization, and BI-ready modeling using cloud-native services.

The goal was to simulate how data analysts use AWS in production environments for dashboard-driven decision making.

🏗️ Architecture
Raw CSV (S3)
     ↓
AWS Glue (Schema Discovery)
     ↓
Amazon Athena (SQL Analytics)
     ↓
Optimized Parquet Analytics Tables (S3)
     ↓
BI Layer (QuickSight-ready / Athena queries)

🔧 Technologies Used

Amazon S3 – Data lake (raw + analytics zones)

AWS Glue – Data catalog & schema management

Amazon Athena – Serverless SQL analytics

Parquet – Columnar analytics storage

SQL – Data transformation & KPI modeling

📂 Dataset

Source: IEA Global EV Data (2024)

Format: CSV

Granularity: Region × Year × Powertrain × Metric


🧠 Key Concepts Demonstrated

Raw vs Analytics data separation

External tables vs managed Hive tables

Athena cost optimization using Parquet

KPI-focused analytics modeling

Reusable analytics tables for multiple dashboards



🚀 Why Parquet?

Columnar storage → faster analytics

Reduced data scanned → lower Athena cost

Dashboard-friendly schema

Scalable for multiple KPIs and dashboards


🎯 Outcome

Built an end-to-end AWS analytics pipeline

Designed BI-optimized Parquet tables

Simulated real corporate data workflows


🔮 Future Improvements

Partitioned Parquet tables by year

Automated ingestion via AWS Lambda

QuickSight dashboards

ML forecasting on EV sales trends


📬 Contact

Dhruv Pandey
MSc Data Science & AI
Aspiring Data Analyst / Data Scientist



















