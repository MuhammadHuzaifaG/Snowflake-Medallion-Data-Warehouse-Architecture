USE ROLE ACCOUNTADMIN;
USE WAREHOUSE COMPUTE_WH;

USE DATABASE SNOWFLAKE_DB;
USE SCHEMA SILVER_TRANSFORMED;

TRUNCATE TABLE SILVER_TRANSFORMED.PRODUCTS;

INSERT INTO SILVER_TRANSFORMED.PRODUCTS(PRODUCT_ID, PRODUCT_NAME, CATEGORY, RETAIL_PRICE, supplier_price, SUPPLIER_ID)
VALUES
(201, 'Ultra HD 4K Curved Monitor 32-inch', 'Electronics', 499.99, 350.00, 501),
(202, 'Ergonomic Mechanical Gaming Keyboard', 'Electronics', 129.99, 80.00, 501),
(203, 'Wireless Noise-Canceling Headphones', 'Electronics', 199.99, 120.00, 502),
(204, 'Stainless Steel Insulated Water Bottle', 'Home & Kitchen', 24.99, 10.00, 503),
(205, 'Memory Foam Office Chair', 'Furniture', 250.00, 160.00, 504),
(206, 'LED Desk Lamp with USB Charging Port', 'Home & Kitchen', 45.99, 22.00, 503),
(207, 'Precision Smart Body Weight Scale', 'Health & Fitness', 59.99, 30.00, 505),
(208, 'Dual-Port Fast USB-C Wall Charger', 'Electronics', 29.99, 12.00, 501),
(209, 'Adjustable Dumbbell Set (5-52 lbs)', 'Health & Fitness', 349.99, 240.00, 505),
(210, 'Minimalist Executive Leather Backpack', 'Apparel & Travel', 89.99, 45.00, 506),
(211, 'Smart Wi-Fi LED Security Camera', 'Electronics', 79.99, 40.00, 502),
(212, 'Portable Waterproof Bluetooth Speaker', 'Electronics', 59.99, 28.00, 502),
(213, 'Organic Bamboo Sheet Set (Queen)', 'Home & Kitchen', 89.99, 42.00, 503),
(214, 'Professional Chef Knife 8-inch', 'Home & Kitchen', 65.00, 30.00, 503),
(215, 'Standing Desk Converter Adjustable', 'Furniture', 189.99, 115.00, 504),
(216, 'USB-C Multi-Port Hub Adapter', 'Electronics', 39.99, 15.00, 501),
(217, 'Electric Coffee Grinder with Burr Blades', 'Home & Kitchen', 74.99, 38.00, 503),
(218, 'Non-Slip Yoga Mat with Alignment Lines', 'Health & Fitness', 35.00, 14.00, 505),
(219, 'Wireless Vertical Ergonomic Mouse', 'Electronics', 49.99, 22.00, 501),
(220, 'Cast Iron Skillet 12-inch Seasoned', 'Home & Kitchen', 44.99, 20.00, 503),
(221, 'Smart Fitness Activity Tracker Band', 'Health & Fitness', 99.99, 55.00, 505),
(222, 'LED Backlit Gaming Mousepad Extended', 'Electronics', 29.99, 10.00, 501),
(223, 'Insulated Lunch Box Cooler Bag', 'Apparel & Travel', 22.99, 9.00, 506),
(224, 'Compact Air Purifier with HEPA Filter', 'Home & Kitchen', 119.99, 70.00, 503),
(225, 'Resistance Bands Set with Door Anchor', 'Health & Fitness', 26.99, 11.00, 505),
(226, 'Travel Toiletry Bag Hanging Organizer', 'Apparel & Travel', 27.99, 12.00, 506),
(227, 'Mechanical Numeric Keypad Wireless', 'Electronics', 34.99, 16.00, 501),
(228, 'Digital Kitchen Food Scale Precision', 'Home & Kitchen', 19.99, 8.00, 503),
(229, 'Neoprene Dumbbell Pair (10 lbs)', 'Health & Fitness', 40.00, 18.00, 505),
(230, 'RFID Blocking Minimalist Wallet', 'Apparel & Travel', 31.99, 13.00, 506);

 SELECT 
    COUNT(*) AS TOTAL_ROWS,
    COUNT(DISTINCT CATEGORY) AS UNIQUE_CATEGORIES,
    ROUND(AVG(RETAIL_PRICE)) AS AVG_RETAIL_PRICE,
    MIN(RETAIL_PRICE) MIN_PRICE,
    MAX(RETAIL_PRICE) MAX_PRICE,
    MAX(CREATED_AT) AS LAST_UPDATED
FROM SILVER_TRANSFORMED.PRODUCTS;