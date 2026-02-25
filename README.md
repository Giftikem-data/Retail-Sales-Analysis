**PROJECT TITLE** 
SQL Retail Sales Analysis


**Problem statement**
This project analyzes a retail sales database using SQL to uncover revenue trends, customer purchasing patterns, and category performance insights to support data-driven business decisions.


**Tools Used**  
PostgreSQL)
SQL(Aggregations, Window Functions, Time-Based Analysis)


**Dataset Overview**
- Number of Records: 2,000 rows  
- Number of Fields: 11 columns  
- Date Range Covered: January 2022 – December 2023  
- Data Types: VARCHAR, INT, DATE, TIME, NUMERIC/DECIMAL  


**Initial Data Quality Issues Identified**
- Missing values in selected numerical columns  
- Incorrect spelling of the 'Quantity' column (recorded as 'Quantiy')


**Data Cleaning/Validation**
- Standardized column data types for accurate calculations
- Renamed columns for clarity
- Removed records with unrecoverable missing values in critical fields
- Retained NULL values in 'Age' column where appropriate.
- Ensured dataset consistency and accuracy before analysis


**Key Insights**
- Electronics category generated the highest total revenue despite lower transaction volume, indicating strong demand for high-value products.
- A moderate performance difference is observed across the categories.
- Sales peaked in December 2022 and December 2023, highlighting clear seasonality in customer purchasing patterns.
- Transactions are relatively balanced across genders, with female customers accounting for a slightly higher share (~51%)
- The evening period accounts for the largest proportion of orders (~53.2%), establishing it as the primary peak operating window.

  
**Recommendations**
- Prioritize electronics inventory management and explore premium bundling strategies to maximize high-value revenue contribution.
- Prepare operational capacity and targeted marketing campaigns ahead of December to leverage seasonal demand.
- Maintain inclusive marketing strategies given balanced gender participation while optimizing category-specific campaigns.
- Strengthen operational readiness during evening peak hours and implement targeted promotions to improve afternoon sales performance.

  
**Outcome**   
The project analyzed transactions and revenue data to identify the top-performing category, customer purchasing patterns, and seasonal trends. The resulting SQL queries enabled accurate KPI reporting and supported data-driven decisions to optimize inventory, marketing campaigns, and revenue strategies. 
