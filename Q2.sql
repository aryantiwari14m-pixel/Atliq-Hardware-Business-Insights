/*
  Request 2: 
  What is the percentage of unique product increase in 2021 vs. 2020? 
  Final output: unique_products_2020, unique_products_2021, percentage_chg
*/

WITH CTE_2020 AS (
    SELECT 
        COUNT(DISTINCT product_code) AS unique_products_2020
    FROM 
        fact_sales_monthly
    WHERE 
        fiscal_year = 2020
),
CTE_2021 AS (
    SELECT 
        COUNT(DISTINCT product_code) AS unique_products_2021
    FROM 
        fact_sales_monthly
    WHERE 
        fiscal_year = 2021
)
SELECT 
    c20.unique_products_2020, 
    c21.unique_products_2021, 
    ROUND((c21.unique_products_2021 - c20.unique_products_2020) * 
    100.0 / c20.unique_products_2020, 2) AS percentage_chg
FROM 
    CTE_2020 c20, 
    CTE_2021 c21;
