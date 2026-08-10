-- Purpose: SQL views and window functions used for advanced data analysis in the Data Centre Adoption Analysis project.

USE data_centre_analysis;

# KPI VIEW 1: Total Data Centers by Region

CREATE VIEW vw_total_datacenters_by_region AS
SELECT
    Region,
    SUM(Data_Center_Count) AS Total_Data_Centers
FROM data_centre_adoption_analysis_realistic_20000
GROUP BY Region;

SELECT * FROM vw_total_datacenters_by_region;


# KPI VIEW 2: Average Renewable Energy by Region

CREATE VIEW vw_avg_renewable_energy AS
SELECT
    Region,
    AVG(Renewable_Energy_Percentage) AS Avg_Renewable_Energy
FROM data_centre_adoption_analysis_realistic_20000
GROUP BY Region;

SELECT * FROM vw_avg_renewable_energy;


# KPI VIEW 3: Average Internet Penetration by Country

CREATE VIEW vw_avg_internet_penetration AS
SELECT
    Country,
    AVG(Internet_Penetration) AS Avg_Internet
FROM data_centre_adoption_analysis_realistic_20000
GROUP BY Country;

SELECT * FROM vw_avg_internet_penetration;


# KPI VIEW 4: Average GDP Per Capita by Region

CREATE VIEW vw_avg_gdp AS
SELECT
    Region,
    AVG(GDP_Per_Capita) AS Avg_GDP
FROM data_centre_adoption_analysis_realistic_20000
GROUP BY Region;

SELECT * FROM vw_avg_gdp;


# WINDOW FUNCTION 1: Running Total by Year

SELECT
    Year,
    SUM(Data_Center_Count) AS Year_Total,
    SUM(SUM(Data_Center_Count)) OVER (ORDER BY Year) AS Running_Total
FROM data_centre_adoption_analysis_realistic_20000
GROUP BY Year;


# WINDOW FUNCTION 2: Rank Years

SELECT
    Year,
    SUM(Data_Center_Count) AS Total_DC,
    RANK() OVER (ORDER BY SUM(Data_Center_Count) DESC) AS Ranking
FROM data_centre_adoption_analysis_realistic_20000
GROUP BY Year;


# WINDOW FUNCTION 3: LAG (Previous Year)

SELECT
    Year,
    SUM(Data_Center_Count) AS Total_DC,
    LAG(SUM(Data_Center_Count)) OVER (ORDER BY Year) AS Previous_Year
FROM data_centre_adoption_analysis_realistic_20000
GROUP BY Year;


# WINDOW FUNCTION 4: LEAD (Next Year)

SELECT
    Year,
    SUM(Data_Center_Count) AS Total_DC,
    LEAD(SUM(Data_Center_Count)) OVER (ORDER BY Year) AS Next_Year
FROM data_centre_adoption_analysis_realistic_20000
GROUP BY Year;

SHOW FULL TABLES
WHERE Table_type = 'VIEW';

SELECT * FROM vw_total_datacenters_by_region;
SELECT * FROM vw_avg_renewable_energy;
SELECT * FROM vw_avg_internet_penetration;
SELECT * FROM vw_avg_gdp;