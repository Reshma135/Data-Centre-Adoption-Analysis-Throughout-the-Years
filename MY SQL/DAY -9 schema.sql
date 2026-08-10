-- Purpose: SQL aggregation and KPI analysis for the Data Centre Adoption Analysis project.

USE data_centre_analysis;
SHOW TABLES;

SELECT * FROM data_centre_adoption_analysis_realistic_20000
LIMIT 10;

DESCRIBE data_centre_adoption_analysis_realistic_20000;

SELECT DISTINCT Region
FROM data_centre_adoption_analysis_realistic_20000;

SELECT
    Country,
    City,
    Region,
    Electricity_Access,
    Data_Center_Count,
    Renewable_Energy_Percentage
FROM data_centre_adoption_analysis_realistic_20000
LIMIT 10;

SELECT
    City,
    COUNT(Country) AS Total_Countries,
    SUM(Data_Center_Count) AS Total_Data_Centers,
    AVG(Renewable_Energy_Percentage) AS Avg_Renewable_Energy
FROM data_centre_adoption_analysis_realistic_20000
GROUP BY City;

SELECT
    Region,
    COUNT(Country) AS Total_Countries,
    SUM(Data_Center_Count) AS Total_Data_Centers,
    AVG(Renewable_Energy_Percentage) AS Avg_Renewable_Energy
FROM data_centre_adoption_analysis_realistic_20000
GROUP BY Region;

SELECT
    Electricity_Access,
    COUNT(Country) AS Total_Countries,
    SUM(Data_Center_Count) AS Total_Data_Centers,
    AVG(Renewable_Energy_Percentage) AS Avg_Renewable_Energy
FROM data_centre_adoption_analysis_realistic_20000
GROUP BY Electricity_Access;

SELECT COUNT(DISTINCT Country) AS Total_Countries
FROM data_centre_adoption_analysis_realistic_20000

SELECT SUM(Data_Center_Count) AS Total_Data_Centers
FROM data_centre_adoption_analysis_realistic_20000;

SELECT AVG(Renewable_Energy_Percentage) AS Average_Renewable_Energy
FROM data_centre_adoption_analysis_realistic_20000;

SELECT MAX(Data_Center_Count) AS Highest_Data_Center_Count
FROM data_centre_adoption_analysis_realistic_20000;

SELECT MIN(Data_Center_Count) AS Lowest_Data_Center_Count
FROM data_centre_adoption_analysis_realistic_20000;

