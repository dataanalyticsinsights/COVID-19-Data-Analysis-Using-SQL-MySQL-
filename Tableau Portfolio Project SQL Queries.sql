/*

Queries used for Tableau Project

*/
-- Updated query
SELECT 
    SUM(CAST(new_cases AS DOUBLE)) AS total_cases,
    SUM(CAST(new_deaths AS DOUBLE)) AS total_deaths,
    (SUM(CAST(new_deaths AS DOUBLE)) / NULLIF(SUM(CAST(new_cases AS DOUBLE)),0)) * 100 AS death_percentage
FROM CovidDeaths
WHERE continent IS NOT NULL;

-- 1. 

SELECT 
    SUM(CAST(new_cases AS DOUBLE)) AS TotalCases,
    SUM(CAST(new_deaths AS DOUBLE)) AS TotalDeaths,
    (SUM(CAST(new_deaths AS DOUBLE)) / NULLIF(SUM(CAST(new_cases AS DOUBLE)),0)) * 100 AS DeathPercentage
FROM CovidDeaths
WHERE continent IS NOT NULL;


-- Just a double check based off the data provided
-- numbers are extremely close so we will keep them - The Second includes "International"  Location


SELECT 
    SUM(CAST(new_cases AS DOUBLE)) AS total_cases,
    SUM(CAST(new_deaths AS DOUBLE)) AS total_deaths,
    (SUM(CAST(new_deaths AS DOUBLE)) / NULLIF(SUM(CAST(new_cases AS DOUBLE)),0)) * 100 AS DeathPercentage
FROM CovidDeaths
WHERE location = 'World';


-- 2. 

-- Analyzing aggregated regions (excluding World, EU, International for consistency)

SELECT 
    continent,
    SUM(CAST(new_deaths AS DOUBLE)) AS TotalDeathCount
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC;


-- 3.

SELECT 
    location,
    population,
    MAX(CAST(total_cases AS DOUBLE)) AS HighestInfectionCount,
    MAX((CAST(total_cases AS DOUBLE) / CAST(population AS DOUBLE))) * 100 AS PercentPopulationInfected
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC;


-- 4.


SELECT 
    location,
    population,
    date,
    CAST(total_cases AS DOUBLE) AS total_cases,
    (CAST(total_cases AS DOUBLE) / CAST(population AS DOUBLE)) * 100 AS PercentPopulationInfected
FROM CovidDeaths
WHERE continent IS NOT NULL
ORDER BY PercentPopulationInfected DESC;







