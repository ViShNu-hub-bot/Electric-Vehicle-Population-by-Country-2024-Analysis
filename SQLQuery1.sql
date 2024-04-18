
--Count of total vehicles by state
SELECT State, SUM(CAST(REPLACE(Total_Vehicles, ',', '') AS INT)) AS Total_Vehicles
FROM Electric_Vehicle_Population_Size_History_By_County_
GROUP BY State;

--Total electric vehicles by state
SELECT State, SUM(CAST(REPLACE(Electric_Vehicle_EV_Total, ',', '') AS INT)) AS Total_EV
FROM Electric_Vehicle_Population_Size_History_By_County_
GROUP BY State;

--Average percentage of electric vehicles by state
SELECT State, AVG(Percent_Electric_Vehicles) AS Avg_Percent_EV
FROM Electric_Vehicle_Population_Size_History_By_County_
GROUP BY State;

--County with the highest number of electric vehicles
SELECT County, Electric_Vehicle_EV_Total AS Max_EV_Total
FROM Electric_Vehicle_Population_Size_History_By_County_
WHERE Electric_Vehicle_EV_Total = (
    SELECT MAX(Electric_Vehicle_EV_Total)
    FROM Electric_Vehicle_Population_Size_History_By_County_
);

--State with the highest number of electric vehicles
SELECT State, Electric_Vehicle_EV_Total AS Max_EV_Total
FROM Electric_Vehicle_Population_Size_History_By_County_
WHERE Electric_Vehicle_EV_Total = (
    SELECT MAX(Electric_Vehicle_EV_Total)
    FROM Electric_Vehicle_Population_Size_History_By_County_
);


--Count of electric vehicles by vehicle primary use
SELECT Vehicle_Primary_Use, SUM(CAST(REPLACE(Electric_Vehicle_EV_Total, ',', '') AS INT)) AS Total_EV
FROM Electric_Vehicle_Population_Size_History_By_County_
GROUP BY Vehicle_Primary_Use;

--Count of electric vehicles by year and month
SELECT 
    YEAR(Date) AS Year, 
    MONTH(Date) AS Month, 
    SUM(CAST(REPLACE(Electric_Vehicle_EV_Total, ',', '') AS INT)) AS Total_EV
FROM 
    Electric_Vehicle_Population_Size_History_By_County_
GROUP BY 
    YEAR(Date), MONTH(Date);

--Count of non-electric vehicles by year and month
SELECT 
    YEAR(Date) AS Year, 
    MONTH(Date) AS Month, 
    SUM(CAST(REPLACE(Non_Electric_Vehicle_Total, ',', '') AS INT)) AS Total_Non_EV
FROM 
    Electric_Vehicle_Population_Size_History_By_County_
GROUP BY 
    YEAR(Date), MONTH(Date);
;

--Percentage of electric vehicles over time
SELECT 
    Date, 
    SUM(CAST(REPLACE(Electric_Vehicle_EV_Total, ',', '') AS INT)) AS Total_EV, 
    SUM(CAST(REPLACE(Non_Electric_Vehicle_Total, ',', '') AS INT)) AS Total_Non_EV,
    (SUM(CAST(REPLACE(Electric_Vehicle_EV_Total, ',', '') AS INT)) / NULLIF(SUM(CAST(REPLACE(Electric_Vehicle_EV_Total, ',', '') AS INT)) + SUM(CAST(REPLACE(Non_Electric_Vehicle_Total, ',', '') AS INT)), 0)) * 100 AS Percent_EV
FROM 
    Electric_Vehicle_Population_Size_History_By_County_
GROUP BY 
    Date;

--Count of electric vehicles by vehicle primary use and state
SELECT 
    State, 
    Vehicle_Primary_Use, 
    SUM(CAST(REPLACE(Electric_Vehicle_EV_Total, ',', '') AS INT)) AS Total_EV
FROM 
    Electric_Vehicle_Population_Size_History_By_County_
GROUP BY 
    State, Vehicle_Primary_Use;

--Count of electric vehicles by vehicle primary use and county
SELECT 
    County, 
    Vehicle_Primary_Use, 
    SUM(CAST(REPLACE(Electric_Vehicle_EV_Total, ',', '') AS INT)) AS Total_EV
FROM 
    Electric_Vehicle_Population_Size_History_By_County_
GROUP BY 
    County, Vehicle_Primary_Use;

--Count of electric vehicles by county and state
SELECT 
    County, 
    State, 
    SUM(CAST(REPLACE(Electric_Vehicle_EV_Total, ',', '') AS INT)) AS Total_EV
FROM 
    Electric_Vehicle_Population_Size_History_By_County_
GROUP BY 
    County, State;

--Top 10 counties with the highest percentage of electric vehicles
SELECT TOP 10 
    County, 
    (CAST(REPLACE(Electric_Vehicle_EV_Total, ',', '') AS FLOAT) * 100.0 / CAST(REPLACE(Total_Vehicles, ',', '') AS FLOAT)) AS Percent_EV
FROM 
    Electric_Vehicle_Population_Size_History_By_County_
ORDER BY 
    Percent_EV DESC;

--Top 10 states with the highest percentage of electric vehicles
SELECT TOP 10 
    State, 
    (CAST(REPLACE(Electric_Vehicle_EV_Total, ',', '') AS FLOAT) * 100.0 / CAST(REPLACE(Total_Vehicles, ',', '') AS FLOAT)) AS Percent_EV
FROM 
    Electric_Vehicle_Population_Size_History_By_County_
ORDER BY 
    Percent_EV DESC;

--Count of electric vehicles by state and year
SELECT 
    State, 
    YEAR(Date) AS Year, 
    SUM(CAST(REPLACE(Electric_Vehicle_EV_Total, ',', '') AS INT)) AS Total_EV
FROM 
    Electric_Vehicle_Population_Size_History_By_County_
GROUP BY 
    State, YEAR(Date);















select * from dbo.Electric_Vehicle_Population_Size_History_By_County_


