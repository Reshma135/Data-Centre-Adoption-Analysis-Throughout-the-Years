-- Purpose: SQL setup, data loading, and initial data preparation for the Data Centre Adoption Analysis project.

CREATE DATABASE data_centre_analysis;
USE data_centre_analysis;

SELECT COUNT(*) FROM Data_Centre_Adoption_Analysis_Realistic_20000;

SELECT * 
FROM Data_Centre_Adoption_Analysis_Realistic_20000
LIMIT 10;

SELECT COUNT(*) AS Total_Rows
FROM Data_Centre_Adoption_Analysis_Realistic_20000;

DESCRIBE Data_Centre_Adoption_Analysis_Realistic_20000;

SELECT *
FROM Data_Centre_Adoption_Analysis_Realistic_20000
WHERE Country IS NULL;

SELECT Country, City, Year, COUNT(*)
FROM Data_Centre_Adoption_Analysis_Realistic_20000
GROUP BY Country, City, Year
HAVING COUNT(*) > 1;