SELECT 
    *
FROM
    Covid_Data.coviddeaths;

SELECT 
    *
FROM
    Covid_Data.covidvaccinations;
    
-- Select data that we are going to be using

SELECT 
    location,
    date,
    total_cases,
    new_cases,
    total_deaths,
    population_density
FROM
    Covid_Data.coviddeaths
ORDER BY 1 , 2;

-- Looking at total cases vs total deaths
-- Showes likelihood of dying if you contract COVID in your country 

SELECT 
    location,
    date,
    total_cases,
    new_cases,
    total_deaths,
    (total_deaths / total_cases) * 100 AS DeathPercentage
FROM
    Covid_Data.coviddeaths
ORDER BY 1 , 2;

SELECT 
    location,
    date,
    total_cases,
    new_cases,
    total_deaths,
    (total_deaths / total_cases) * 100 AS DeathPercentage
FROM
    Covid_Data.coviddeaths
WHERE
    location LIKE '%states%'
ORDER BY 3;

-- Looking at Total Cases vs Population
-- Shows what percentage of Population got COVID

SELECT 
    location,
    date,
    total_cases,
    population_density,
    (total_cases / population_density) * 100 AS DeathPercentage
FROM
    Covid_Data.coviddeaths
WHERE
    location LIKE '%states%'
ORDER BY 3;

-- Looking at countries with highest infection rate comared to Population

SELECT 
    location,
    population_density,
    MAX(total_cases) AS HighestInfectionCount,
    MAX(total_deaths / total_cases) * 100 AS PercentPopulationInfected
FROM
    Covid_Data.coviddeaths
GROUP BY Location , population_density
ORDER BY PercentPopulationInfected DESC;

-- Showing Countries with Highest Death Count per Population

SELECT 
    location, MAX(Total_deaths) AS TotalDeathCount
FROM
    Covid_Data.coviddeaths
GROUP BY location
ORDER BY TotalDeathCount DESC;


