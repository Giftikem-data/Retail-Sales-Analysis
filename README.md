**PROJECT TITLE** 
SQL Retail Sales Analysis

**Problem statement**
Analyse retail sales database to perform exploratory data analysis, and answer specific business questions through SQL queries after cleaning the dataset. 

**Tools Used**  
SQL(PostgreSQL)

**Dataset Overview**
- File Format: Microsoft Excel (.xlsx)  
- Number of Records: 2,000 rows  
- Number of Fields: 11 columns  
- Date Range Covered: January 2022 – December 2023  
- Data Types: VARCHAR, INT, DATE, TIME, NUMERIC/DECIMAL  

**Initial Data Quality Issues Identified**
- Missing values in selected numerical columns  
- Incorrect spelling of the 'Quantity' column (recorded as 'Quantiy')

**Data Validation**
- Previewed dataset after import into PostgreSQL to verify successful loading.
- Verified total record count to ensure data integrity.
- Checked for duplicates (none found).
- Identified and reviewed missing values.
- Confirmed column data types were appropriate.

**Data cleaning steps** 
Adjusted 'Cogs' column to `NUMERIC(10,2)` for accurate decimal calculations.
- Renamed 'Cogs' to 'cost_of_goods_sold' for clarity.
- Removed rows with missing values in critical numerical columns ('Quantity', ‘Price_Per_Unit’, ‘Total_Sale’, 'Cogs') where values could not be recovered.
- Retained NULL values in 'Age' where appropriate.

**Post cleaning validation**
- Recounted rows to confirm expected reduction due to removed missing values.
- Verified that all identified missing values in critical columns were resolved.
- Confirmed dataset readiness for analysis and reporting.

**Outcome**   
The cleaned dataset was validated and structured for accurate exploratory data analysis, KPI reporting, and dashboard creation.

**Key Insights**
- The Electronics category generated the highest total revenue despite not having the highest transaction volume, indicating stronger sales of higher-priced products. A moderate performance difference is observed across the categories.
- Sales peaked in December 2022 and December 2023, highlighting clear seasonality in customer purchasing patterns.
- Transactions are relatively balanced across genders, with female customers accounting for a slightly higher share (~51%)
- The evening period accounts for the largest proportion of orders (~53.2%), establishing it as the primary peak operating window, while afternoon sales record the lowest activity levels.

**Recommendations**
- Prioritize electronics inventory management and explore premium bundling strategies to maximize high-value revenue contribution.
- Prepare operational capacity and targeted marketing campaigns ahead of December to leverage seasonal demand.
- Maintain inclusive marketing strategies given balanced gender participation while optimizing category-specific campaigns.
- Strengthen operational readiness during evening peak hours and implement targeted promotions to improve afternoon sales performance.
