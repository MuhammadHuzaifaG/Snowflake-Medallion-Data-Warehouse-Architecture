USE ROLE ACCOUNTADMIN;
USE WAREHOUSE COMPUTE_WH;

USE DATABASE SNOWFLAKE_DB;
USE SCHEMA SILVER_TRANSFORMED;

TRUNCATE TABLE SILVER_TRANSFORMED.EMPLOYEES;

INSERT INTO SILVER_TRANSFORMED.EMPLOYEES(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, JOB_TITLE, HIRE_DATE, MANAGER_ID, STORE_ID)
VALUES
(1001, 'Alexander', 'Wright', 'alexander.wright@mart.com', 'Store General Manager', '2021-03-15', NULL, 'STR-101'),
(1002, 'Victoria', 'Scott', 'victoria.scott@mart.com', 'Assistant Manager', '2021-06-20', 1001, 'STR-101'),
(1003, 'Benjamin', 'Green', 'benjamin.green@mart.com', 'Senior Sales Associate', '2022-01-10', 1002, 'STR-101'),
(1004, 'Charlotte', 'Baker', 'charlotte.baker@art.com', 'Inventory Specialist', '2022-04-12', 1001, 'STR-102'),
(1005, 'Daniel', 'Adams', 'daniel.adams@mart.com', 'Store General Manager', '2020-11-05', NULL, 'STR-102'),
(1006, 'Evelyn', 'Nelson', 'evelyn.nelson@sleekmart.com', 'Customer Service Lead', '2022-08-18', 1005, 'STR-103'),
(1007, 'Gabriel', 'Carter', 'gabriel.carter@sleekmart.com', 'Sales Associate', '2023-02-14', 1005, 'STR-103'),
(1008, 'Hannah', 'Mitchell', 'hannah.mitchell@sleekmart.com', 'Visual Merchandiser', '2022-09-01', 1001, 'STR-104'),
(1009, 'Isaac', 'Perez', 'isaac.perez@sleekmart.com', 'Store General Manager', '2019-05-12', NULL, 'STR-104'),
(1010, 'Julia', 'Roberts', 'julia.roberts@sleekmart.com', 'Assistant Manager', '2021-07-22', 1009, 'STR-105'),
(1011, 'Nathan', 'Turner', 'nathan.turner@sleekmart.com', 'Senior Sales Associate', '2022-10-11', 1010, 'STR-105'),
(1012, 'Olivia', 'Phillips', 'olivia.phillips@sleekmart.com', 'Inventory Specialist', '2023-01-09', 1009, 'STR-106'),
(1013, 'Patrick', 'Campbell', 'patrick.campbell@sleekmart.com', 'Store General Manager', '2020-02-18', NULL, 'STR-106'),
(1014, 'Quinn', 'Parker', 'quinn.parker@sleekmart.com', 'Customer Service Lead', '2022-05-30', 1013, 'STR-107'),
(1015, 'Rachel', 'Evans', 'rachel.evans@sleekmart.com', 'Sales Associate', '2023-03-04', 1013, 'STR-107'),
(1016, 'Samuel', 'Edwards', 'samuel.edwards@sleekmart.com', 'Store General Manager', '2019-08-19', NULL, 'STR-108'),
(1017, 'Taylor', 'Collins', 'taylor.collins@sleekmart.com', 'Assistant Manager', '2021-11-15', 1016, 'STR-108'),
(1018, 'Ulysses', 'Stewart', 'ulysses.stewart@sleekmart.com', 'Senior Sales Associate', '2022-06-12', 1017, 'STR-109'),
(1019, 'Valerie', 'Sanchez', 'valerie.sanchez@sleekmart.com', 'Inventory Specialist', '2022-12-01', 1016, 'STR-109'),
(1020, 'Wyatt', 'Morris', 'wyatt.morris@sleekmart.com', 'Store General Manager', '2020-06-10', NULL, 'STR-110'),
(1021, 'Xander', 'Rogers', 'xander.rogers@sleekmart.com', 'Customer Service Lead', '2022-07-19', 1020, 'STR-110'),
(1022, 'Yasmine', 'Reed', 'yasmine.reed@sleekmart.com', 'Sales Associate', '2023-02-01', 1020, 'STR-111'),
(1023, 'Zachary', 'Cook', 'zachary.cook@sleekmart.com', 'Store General Manager', '2019-10-01', NULL, 'STR-112'),
(1024, 'Amber', 'Morgan', 'amber.morgan@sleekmart.com', 'Assistant Manager', '2021-04-14', 1023, 'STR-113'),
(1025, 'Brandon', 'Bell', 'brandon.bell@sleekmart.com', 'Senior Sales Associate', '2022-03-22', 1024, 'STR-114'),
(1026, 'Cynthia', 'Murphy', 'cynthia.murphy@sleekmart.com', 'Store General Manager', '2020-09-15', NULL, 'STR-115'),
(1027, 'Derek', 'Bailey', 'derek.bailey@sleekmart.com', 'Inventory Specialist', '2022-08-05', 1026, 'STR-116'),
(1028, 'Elena', 'Rivera', 'elena.rivera@sleekmart.com', 'Visual Merchandiser', '2023-01-15', 1026, 'STR-117'),
(1029, 'Frank', 'Cooper', 'frank.cooper@sleekmart.com', 'Store General Manager', '2019-12-01', NULL, 'STR-118'),
(1030, 'Grace', 'Richardson', 'grace.richardson@sleekmart.com', 'Assistant Manager', '2021-08-10', 1029, 'STR-119');

select
    count(distinct JOB_TITLE) unique_jobtitles,
    count(EMPLOYEE_ID) Count_of_Employees,
    max(FIRST_NAME) last_employee,
    min(LAST_NAME) first_employee,
    max(HIRE_DATE) last_hire_date
from SILVER_TRANSFORMED.EMPLOYEES;