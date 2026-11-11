USE ROLE ACCOUNTADMIN;
USE WAREHOUSE COMPUTE_WH;

USE DATABASE SNOWFLAKE_DB;
USE SCHEMA SILVER_TRANSFORMED;

TRUNCATE TABLE SILVER_TRANSFORMED.CUSTOMERS;

-- E-COMMERCE CUSTOMER DATA 
INSERT INTO SILVER_TRANSFORMED.CUSTOMERS(CUSTOMER_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE, ADDRESS, CITY, STATE, ZIP_CODE)
VALUES
('CUST-1001', 'Mark', 'Stephenson', 'mstephenson@fernandez.com', '+1-555-0101', '835 Frank Tunel', 'Wrightmouth', 'MI', '82180'),
('CUST-1002', 'Harold', 'Duke', 'hduke@hotmail.com', '+1-555-0102', '4547 Archer Common', 'Diazchester', 'CA', '06566'),
('CUST-1003', 'Patricia', 'Allen', 'pallen@yahoo.com', '+1-555-0103', '24645 Valerie Unions Suite 582', 'Cobbborough', 'DC', '99414'),
('CUST-1004', 'Rebecca', 'Rivera', 'riverarebecca@gmail.com', '+1-555-0104', '1414 David Throughway', 'Port Jason', 'OH', '22070'),
('CUST-1005', 'David', 'Miller', 'mstephens@davidson-herman.com', '+1-555-0105', '14023 Rodriguez Passage', 'Port Jacobville', 'PR', '37242'),
('CUST-1006', 'Nancy', 'Alvarez', 'alvareznancy@lucas.biz', '+1-555-0106', '645 Martha Park Apt. 611', 'Jeffreychester', 'MN', '67218'),
('CUST-1007', 'Katherine', 'Smith', 'katherine20@yahoo.com', '+1-555-0107', '860 Lee Key West', 'Debra', 'SD', '97450'),
('CUST-1008', 'Andrew', 'Peterson', 'andrew06@peterson.com', '+1-555-0108', '26104 Alexander Groves', 'Alexandriaport', 'WY', '28244'),
('CUST-1009', 'Michael', 'Chang', 'knelson@gmail.com', '+1-555-0109', '6705 Miller Orchard Suite 186', 'Lake Shanestad', 'MO', '75696'),
('CUST-1010', 'Taylor', 'Mason', 'taylormason@gmail.com', '+1-555-0110', '7773 Powell Springs Suite 190', 'Samanthaland', 'ND', '44358'),
('CUST-1011', 'Jessica', 'Stark', 'jstark@anderson.com', '+1-555-0111', '49558 Ramirez Road Suite 399', 'Phillipstad', 'OH', '35641'),
('CUST-1012', 'Robert', 'Taylor', 'youngbarbara@yahoo.com', '+1-555-0112', '019 Elliott Tunnel Suite 190', 'Nicholsbury', 'WV', '60804'),
('CUST-1013', 'Amanda', 'Jones', 'ijones@schaefer-carr.net', '+1-555-0113', '657 Judith Crossroad', 'Hancockchester', 'VI', '75658'),
('CUST-1014', 'Brian', 'Wilson', 'lisacabrera@yahoo.com', '+1-555-0114', '9801 Thomas Pike Suite 058', 'Brandishire', 'AK', '88122'),
('CUST-1015', 'Emily', 'Davis', 'mmatthews@hotmail.com', '+1-555-0115', '18372 Matthew Fork Suite 705', 'North Matthewmouth', 'KY', '99737'),
('CUST-1016', 'Sarah', 'Connor', 'jsandoval@gmail.com', '+1-555-0116', '712 Scott Extension', 'West Kevin', 'TX', '48392'),
('CUST-1017', 'Kevin', 'Vaughn', 'kvaughn@gmail.com', '+1-555-0117', '3321 Martinez Creek', 'New Amber', 'FL', '33101'),
('CUST-1018', 'Lisa', 'Rodriguez', 'lisa.rodriguez@yahoo.com', '+1-555-0118', '890 Tyler Branch', 'East Joshua', 'NY', '10001'),
('CUST-1019', 'James', 'Anderson', 'janderson@smith.net', '+1-555-0119', '541 William Trace', 'South Michael', 'IL', '60601'),
('CUST-1020', 'Maria', 'Garcia', 'mgarcia@garcia-zuniga.com', '+1-555-0120', '123 Pinecrest Blvd', 'Austin', 'TX', '78701'),
('CUST-1021', 'Christopher', 'Martinez', 'cmartinez@hotmail.com', '+1-555-0121', '456 Oakridge Lane', 'Seattle', 'WA', '98101'),
('CUST-1022', 'Ashley', 'Hernandez', 'ahernandez@yahoo.com', '+1-555-0122', '789 Elmwood Drive', 'Denver', 'CO', '80202'),
('CUST-1023', 'Matthew', 'Lopez', 'mlopez@lopez-consulting.org', '+1-555-0123', '321 Maple Drive', 'Chicago', 'IL', '60611'),
('CUST-1024', 'Joshua', 'Gonzalez', 'jgonzalez@gmail.com', '+1-555-0124', '654 Birch Road', 'Miami', 'FL', '33102'),
('CUST-1025', 'Pooja', 'Sharma', 'psharma@sharma-tech.in', '+1-555-0125', '987 Cedar Court', 'San Francisco', 'CA', '94105'),
('CUST-1026', 'Aiden', 'Murphy', 'amurphy@murphy-enterprises.com', '+1-555-0126', '111 Ash Street', 'Boston', 'MA', '02110'),
('CUST-1027', 'Chloe', 'O Connor', 'coconnor@hotmail.com', '+1-555-0127', '222 Walnut Avenue', 'Philadelphia', 'PA', '19103'),
('CUST-1028', 'Liam', 'Kelly', 'lkelly@kelly-design.net', '+1-555-0128', '333 Chestnut Street', 'Atlanta', 'GA', '30303'),
('CUST-1029', 'Zoe', 'Sullivan', 'zsullivan@yahoo.com', '+1-555-0129', '444 Spruce Way', 'Phoenix', 'AZ', '85004'),
('CUST-1030', 'Ethan', 'Walsh', 'ewalsh@walsh-logistics.com', '+1-555-0130', '555 Cypress Drive', 'Portland', 'OR', '97201');

SELECT
    COUNT(*),
    MAX(CUSTOMER_ID) FIRST_CUSTOMER,
    MIN(CUSTOMER_ID) LAST_CUSTOMER,
    COUNT(DISTINCT EMAIL) AS UNIQUE_EMAILS
FROM SILVER_TRANSFORMED.CUSTOMERS