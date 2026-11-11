USE ROLE ACCOUNTADMIN;
USE WAREHOUSE COMPUTE_WH;

USE DATABASE SNOWFLAKE_DB;
USE SCHEMA GOLD_DATAMART;

-- Check if Silver tables actually have data
SELECT 'SILVER_CUSTOMERS' AS tbl, COUNT(*) AS cnt FROM SILVER_TRANSFORMED.CUSTOMERS
UNION ALL
SELECT 'SILVER_PRODUCTS', COUNT(*) FROM SILVER_TRANSFORMED.PRODUCTS
UNION ALL
SELECT 'SILVER_STORES', COUNT(*) FROM SILVER_TRANSFORMED.STORES
UNION ALL
SELECT 'SILVER_ORDERS', COUNT(*) FROM SILVER_TRANSFORMED.ORDERS
UNION ALL
-- 2. Check if Gold dimensions have data
SELECT 'GOLD_DIM_CUSTOMER', COUNT(*) FROM GOLD_DATAMART.DIM_CUSTOMER
UNION ALL
SELECT 'GOLD_DIM_PRODUCT', COUNT(*) FROM GOLD_DATAMART.DIM_PRODUCT
UNION ALL
SELECT 'GOLD_DIM_STORE', COUNT(*) FROM GOLD_DATAMART.DIM_STORE
UNION ALL
SELECT 'GOLD_DIM_DATE', COUNT(*) FROM GOLD_DATAMART.DIM_DATE;
-- Total Revenue & Orders by Product Category
SELECT 
    DP.CATEGORY AS "PRODUCT CATEGORY",
    COUNT(DISTINCT FS.ORDER_ID) AS TOTAL_ORDERS,
    SUM(FS.QUANTITY) AS UNITS_SOLD,
    ROUND(SUM(FS.QUANTITY * FS.UNIT_PRICE), 2) AS TOTAL_REVENUE
FROM GOLD_DATAMART.FACT_SALES FS 
JOIN GOLD_DATAMART.DIM_PRODUCT DP
    ON FS.PRODUCT_KEY = DP.PRODUCT_KEY
WHERE FS.STATUS IN ('COMPLETED', 'DELIVERED', 'SHIPPED', 'PROCESSING')
GROUP BY DP.CATEGORY
ORDER BY TOTAL_REVENUE DESC;

-- Regional Sales Breakdown (State & City)
SELECT
    DS.STATE AS STATE,
    DS.CITY AS CITY,
    FS.STATUS AS ORDER_STATUS,
    COUNT(DISTINCT FS.ORDER_ID) AS TOTAL_ORDERS,
    ROUND(SUM(FS.GROSS_REVENUE), 2) AS TOTAL_REVENUE,
    FROM GOLD_DATAMART.FACT_SALES FS 
    JOIN GOLD_DATAMART.DIM_STORE DS
        ON FS.STORE_KEY= DS.STORE_KEY
    WHERE FS.STATUS IN('COMPLETED', 'DELIVERED', 'SHIPPED')
    GROUP BY DS.STATE, DS.CITY, FS.STATUS
    ORDER BY TOTAL_REVENUE DESC;
-- Top 5 Highest Revenue Stores
SELECT
    DS.STORE_NAME AS "STORE NAME",
    DS.CITY AS CITY,
    DS.STATE AS "STATE",
    ROUND(SUM(FS.GROSS_REVENUE), 2) AS "STORE REVENUE",
    FROM GOLD_DATAMART.FACT_SALES FS 
    JOIN GOLD_DATAMART.DIM_STORE DS
        ON FS.STORE_KEY = DS.STORE_KEY
    WHERE FS.STATUS IN('COMPLETED', 'DELIVERED', 'SHIPPED')
    GROUP BY DS.STORE_NAME, DS.CITY, DS.STATE
    ORDER BY "STORE REVENUE" DESC
    LIMIT 5;
-- MONTHLY REVENUE
SELECT
    DD.YEAR AS YEAR,
    DD.QUARTER AS QUARTER,
    DD.MONTH_NUM AS MONTH_NUM,
    COUNT(DISTINCT FS.ORDER_ID) AS TOTAL_ORDERS,
    SUM(FS.QUANTITY) AS UNITS_SOLD,
    ROUND(SUM(FS.GROSS_REVENUE), 2) AS "MONTHLY REVENUE"
    FROM GOLD_DATAMART.FACT_SALES FS 
    JOIN GOLD_DATAMART.DIM_DATE DD
     ON FS.DATE_KEY = DD.DATE_KEY
    WHERE FS.STATUS IN('COMPLETED', 'DELIVERED', 'SHIPPED')
    GROUP BY DD.YEAR, DD.QUARTER, DD.MONTH_NUM
    ORDER BY DD.YEAR DESC, DD.MONTH_NUM ASC;
-- REGIONAL PERFORMANCE & CATEGORY BREAKDOWN
WITH RegionalCategoryBase AS (
    SELECT 
        ds.STATE AS store_state,
        ds.CITY AS store_city,
        ds.STORE_NAME,
        dp.CATEGORY AS product_category,
        COUNT(DISTINCT fs.ORDER_ID) AS total_orders,
        SUM(fs.QUANTITY) AS total_units_sold,
        SUM(fs.GROSS_REVENUE) AS total_gross_revenue
    FROM GOLD_DATAMART.FACT_SALES fs
    JOIN GOLD_DATAMART.DIM_STORE ds ON fs.STORE_KEY = ds.STORE_KEY
    JOIN GOLD_DATAMART.DIM_PRODUCT dp ON fs.PRODUCT_KEY = dp.PRODUCT_KEY
    WHERE fs.STATUS IN ('COMPLETED', 'SHIPPED', 'DELIVERED')
    GROUP BY ds.STATE, ds.CITY, ds.STORE_NAME, dp.CATEGORY
),

WindowedAnalytics AS (
    SELECT 
        store_state,
        store_city,
        STORE_NAME,
        product_category,
        total_orders,
        total_units_sold,
        total_gross_revenue,
        SUM(total_gross_revenue) OVER (
            PARTITION BY store_state
        ) AS state_total_revenue,
        
        DENSE_RANK() OVER (
            PARTITION BY store_state 
            ORDER BY total_gross_revenue DESC
        ) AS category_rank_in_state,
        
        ROUND(
            (total_gross_revenue / SUM(total_gross_revenue) OVER ()) * 100, 
            2
        ) AS pct_of_total_global_revenue,
        
        DENSE_RANK() OVER (
            ORDER BY total_gross_revenue DESC
        ) AS global_category_rank
    FROM RegionalCategoryBase
)

SELECT 
    store_state AS "State",
    store_city AS "City",
    STORE_NAME AS "Store Name",
    product_category AS "Product Category",
    total_orders AS "Orders",
    total_units_sold AS "Units Sold",
    TO_VARCHAR(total_gross_revenue, '$999,999.00') AS "Gross Revenue",
    TO_VARCHAR(state_total_revenue, '$999,999.00') AS "State Total Revenue",
    category_rank_in_state AS "Category Rank (In State)",
    pct_of_total_global_revenue || '%' AS "Global Revenue Share %"
FROM WindowedAnalytics
ORDER BY state_total_revenue DESC, category_rank_in_state ASC;