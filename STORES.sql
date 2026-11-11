USE ROLE ACCOUNTADMIN;
USE WAREHOUSE COMPUTE_WH;

USE DATABASE SNOWFLAKE_DB;
USE SCHEMA SILVER_TRANSFORMED;

TRUNCATE TABLE SILVER_TRANSFORMED.STORES;

INSERT INTO SILVER_TRANSFORMED.STORES(STORE_ID, STORE_NAME, ADDRESS, CITY, STATE, ZIP_CODE, EMAIL, PHONE)
VALUES
('STR-101', 'Downtown Flagship Center', '100 Broadway Ave', 'New York', 'NY', '10005', 'downtown.ny@sleekmart.com', '+1-212-555-0101'),
('STR-102', 'Manhattan West Mall', '450 West 33rd St', 'New York', 'NY', '10001', 'manhattanwest@mart.com', '+1-212-555-0102'),
('STR-103', 'Brooklyn Heights Hub', '250 Cadman Plaza W', 'Brooklyn', 'NY', '11201', 'brooklyn@mart.com', '+1-718-555-0103'),
('STR-104', 'Chicago Loop Store', '200 S Michigan Ave', 'Chicago', 'IL', '60604', 'chicago.loop@mart.com', '+1-312-555-0104'),
('STR-105', 'Magnificent Mile Branch', '830 N Michigan Ave', 'Chicago', 'IL', '60611', 'magmile@mart.com', '+1-312-555-0105'),
('STR-106', 'Los Angeles Downtown Plaza', '700 W 7th St', 'Los Angeles', 'CA', '90017', 'la.downtown@kmart.com', '+1-213-555-0106'),
('STR-107', 'Hollywood Boulevard Outlet', '6801 Hollywood Blvd', 'Los Angeles', 'CA', '90028', 'hollywood@sleekmart.com', '+1-323-555-0107'),
('STR-108', 'San Francisco Financial Center', '555 California St', 'San Francisco', 'CA', '94104', 'sf.financial@sleekmart.com', '+1-415-555-0108'),
('STR-109', 'Houston Galleria Branch', '5085 Westheimer Rd', 'Houston', 'TX', '77056', 'houston.galleria@sleekmart.com', '+1-713-555-0109'),
('STR-110', 'Austin Downtown Market', '112 E 6th St', 'Austin', 'TX', '78701', 'austin@sleekmart.com', '+1-512-555-0110'),
('STR-111', 'Dallas Market Center', '2000 Stemmons Freeway', 'Dallas', 'TX', '75207', 'dallas@sleekmart.com', '+1-214-555-0111'),
('STR-112', 'Phoenix Biltmore Store', '2400 E Camelback Rd', 'Phoenix', 'AZ', '85016', 'phoenix@sleekmart.com', '+1-602-555-0112'),
('STR-113', 'Philadelphia Center City', '1600 Market St', 'Philadelphia', 'PA', '19103', 'philly@sleekmart.com', '+1-215-555-0113'),
('STR-114', 'San Diego Gaslamp Hub', '300 Broadway', 'San Diego', 'CA', '92101', 'sandiego@sleekmart.com', '+1-619-555-0114'),
('STR-115', 'Seattle Downtown Store', '400 Pine St', 'Seattle', 'WA', '98101', 'seattle@sleekmart.com', '+1-206-555-0115'),
('STR-116', 'Bellevue Square Outlet', '125 Bellevue Way NE', 'Bellevue', 'WA', '98004', 'bellevue@sleekmart.com', '+1-425-555-0116'),
('STR-117', 'Denver Cherry Creek Mall', '3000 E 1st Ave', 'Denver', 'CO', '80206', 'denver@sleekmart.com', '+1-303-555-0117'),
('STR-118', 'Boston Downtown Crossing', '450 Washington St', 'Boston', 'MA', '02111', 'boston@sleekmart.com', '+1-617-555-0118'),
('STR-119', 'Atlanta Midtown Plaza', '1180 Peachtree St NE', 'Atlanta', 'GA', '30309', 'atlanta@sleekmart.com', '+1-404-555-0119'),
('STR-120', 'Miami Brickell City Centre', '701 S Miami Ave', 'Miami', 'FL', '33131', 'miami@sleekmart.com', '+1-305-555-0120'),
('STR-121', 'Orlando Millenia Store', '4200 Conroy Rd', 'Orlando', 'FL', '32839', 'orlando@sleekmart.com', '+1-407-555-0121'),
('STR-122', 'Las Vegas Strip Outlet', '3200 S Las Vegas Blvd', 'Las Vegas', 'NV', '89109', 'lasvegas@sleekmart.com', '+1-702-555-0122'),
('STR-123', 'Portland Pioneer Place', '700 SW 5th Ave', 'Portland', 'OR', '97204', 'portland@sleekmart.com', '+1-503-555-0123'),
('STR-124', 'Minneapolis Mall of America', '60 E Broadway', 'Bloomington', 'MN', '55425', 'minneapolis@sleekmart.com', '+1-952-555-0124'),
('STR-125', 'Detroit Campus Martius', '1000 Woodward Ave', 'Detroit', 'MI', '48226', 'detroit@sleekmart.com', '+1-313-555-0125'),
('STR-126', 'San Jose Santana Row', '377 Santana Row', 'San Jose', 'CA', '95128', 'sanjose@sleekmart.com', '+1-408-555-0126'),
('STR-127', 'Salt Lake City Gateway', '400 W 100 S', 'Salt Lake City', 'UT', '84101', 'slc@sleekmart.com', '+1-801-555-0127'),
('STR-128', 'Nashville Broadway Store', '501 Broadway', 'Nashville', 'TN', '37203', 'nashville@sleekmart.com', '+1-615-555-0128'),
('STR-129', 'Charlotte Uptown Center', '200 S Tryon St', 'Charlotte', 'NC', '28202', 'charlotte@sleekmart.com', '+1-704-555-0129'),
('STR-130', 'Indianapolis Circle Centre', '49 W Maryland St', 'Indianapolis', 'IN', '46204', 'indy@mart.com', '+1-317-555-0130');

SELECT
    COUNT(*) TOTAL_STORES,
    MAX(STORE_ID) LAST_STORE,
    MIN(STORE_ID) FIRST_STORE,
    COUNT(DISTINCT STATE) UNIQUE_STATES,
    MAX(UPDATED_AT) LAST_UPDATED_AT
FROM SILVER_TRANSFORMED.STORES;