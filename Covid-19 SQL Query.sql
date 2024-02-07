--COVID DEATHS--


SELECT *
FROM 
	[Covid 19 Portfolio Project]..Covid_Deaths
WHERE
	continent IS NOT NULL AND continent <> ''
ORDER BY
	3,4

--Selecting the Necessary Data

SELECT 
	location, 
	--date: the date is in string format so convert to datetime
	Convert(DATETIME, [date], 103) AS formatted_datetime,
	total_cases,
	new_cases,
	total_deaths,
	population
FROM 
	[Covid 19 Portfolio Project]..Covid_Deaths
WHERE
	continent IS NOT NULL AND continent <> ''
ORDER BY
	1,2

--Total Cases vs Total Deaths
--[Out of the recorded cases, how many resulted in deaths?]

SELECT 
	location, 
	Convert(DATETIME, [date], 103) AS formatted_datetime,
	total_cases,
	total_deaths,
	CASE
		WHEN cast(total_cases as float) = 0 THEN NULL
		ELSE ( cast(total_deaths as float) / cast(total_cases as float) ) * 100 
	END as death_rate
FROM 
	[Covid 19 Portfolio Project]..Covid_Deaths
WHERE
	continent IS NOT NULL AND continent <> ''
ORDER BY
	1, 2

--Looking at specific countries
SELECT 
	location, 
	Convert(DATETIME, [date], 103) AS formatted_datetime,
	total_cases,
	total_deaths,
	CASE
		WHEN cast(total_cases as float) = 0 THEN NULL
		ELSE ( cast(total_deaths as float) / cast(total_cases as float) ) * 100 
	END as death_rate
FROM 
	[Covid 19 Portfolio Project]..Covid_Deaths
WHERE
	location like '%finland%'
ORDER BY
	1, formatted_datetime

--Total Cases vs Population
--[What percentage of the population(for a specific country) had covid?]

SELECT 
	location, 
	--date: the date is in string format so convert to datetime
	Convert(DATETIME, [date], 103) AS formatted_datetime,
	total_cases,
	population,
    ( cast(total_cases as float) / cast(population as float) ) * 100 as cases_rate
FROM 
	[Covid 19 Portfolio Project]..Covid_Deaths
WHERE
	location like '%finland%'
ORDER BY
	1, formatted_datetime 

--Countries with Highest Infection Rate compared to their Population

SELECT 
	location,
	population,
	Max( cast(total_cases as float) ) as highest_infection_count,
	CASE
		WHEN cast(population as float) = 0 THEN NULL
		ELSE Max( cast(total_cases as float) / NULLIF(cast(population as float), 0) ) * 100 
	END as percent_pop_infected
FROM 
	[Covid 19 Portfolio Project]..Covid_Deaths
WHERE
	continent IS NOT NULL AND continent <> ''
GROUP BY
	location,
	population
ORDER BY
	percent_pop_infected desc


--Countries with Highest Death Count per Population
SELECT
	location,
	Max(cast(total_deaths as int)) as total_death_count
FROM 
	[Covid 19 Portfolio Project]..Covid_Deaths
WHERE
	continent IS NOT NULL AND continent <> ''
GROUP BY
	location
ORDER BY
	total_death_count desc
	

--BREAKING THINGS DOWN BY CONTINENT
--Continents with Highest Death Count 

SELECT
	continent,
	Max(cast(total_deaths as int)) as total_death_count
FROM 
	[Covid 19 Portfolio Project]..Covid_Deaths
WHERE
	continent IS NOT NULL AND continent <> ''
GROUP BY
	continent
ORDER BY
	total_death_count desc

--SELECT
--	location,
--	Max( cast(total_deaths as int) ) as total_death_count
--FROM 
--	[Covid 19 Portfolio Project]..CovidDeaths
--WHERE
--	continent IS NULL OR TRIM(continent) = '' 
--GROUP BY
--	location
--ORDER BY
--	total_death_count desc


--GLOBAL FIGURES

--Cases per day
SELECT 
	Convert(DATETIME, [date], 103) AS formatted_datetime,
	Sum( cast(new_cases as float) ) as total_cases,
	Sum( cast(new_deaths as float) ) as total_deaths,
	( Sum( cast(new_deaths as float) ) / Sum( NULLIF(cast(new_cases as int), 0 ) ) ) * 100 as death_percentage
FROM 
	[Covid 19 Portfolio Project]..Covid_Deaths
WHERE
	continent IS NOT NULL AND continent <> ''
GROUP BY
	CONVERT(DATETIME, [date], 103)
ORDER BY
	1

--Total cases
SELECT 
	Sum( cast(new_cases as float) ) as total_cases,
	Sum( cast(new_deaths as float) ) as total_deaths,
	( Sum( cast(new_deaths as float) ) / Sum( NULLIF(cast(new_cases as int), 0 ) ) ) * 100 as death_percentage
FROM 
	[Covid 19 Portfolio Project]..Covid_Deaths
WHERE
	continent IS NOT NULL AND continent <> ''
ORDER BY
	1






--COVID VACCINATIONS





SELECT *
FROM [Covid 19 Portfolio Project]..Covid_Deaths dea
Join [Covid 19 Portfolio Project]..Covid_Vaccination vac
	On dea.location = vac.location
	and CONVERT(DATE, dea.date, 103) = CONVERT(DATE, vac.date, 103)
ORDER BY dea.location, CONVERT(DATE, dea.date, 103)


--Total Population vs New_Vaccinations

SELECT dea.continent, dea.location, CONVERT(DATE, dea.date, 103) as correct_date, dea.population, vac.new_vaccinations
FROM [Covid 19 Portfolio Project]..Covid_Deaths dea
Join [Covid 19 Portfolio Project]..Covid_Vaccination vac
	On dea.location = vac.location
	and CONVERT(DATE, dea.date, 103) = CONVERT(DATE, vac.date, 103)
WHERE
	dea.continent IS NOT NULL AND dea.continent <> ''
ORDER BY 
	2,3


--Total Population vs New_Vaccinations Per Day(Rolling Count)

SELECT dea.continent, dea.location, CONVERT(DATE, dea.date, 103) as correct_date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as float)) OVER (Partition by dea.location Order by dea.location, CONVERT(DATE, dea.date, 103)) as Rolling_Count_Vaccinations
FROM [Covid 19 Portfolio Project]..Covid_Deaths dea
Join [Covid 19 Portfolio Project]..Covid_Vaccination vac
	On dea.location = vac.location
	and CONVERT(DATE, dea.date, 103) = CONVERT(DATE, vac.date, 103)
WHERE
	dea.continent IS NOT NULL AND dea.continent <> ''
ORDER BY 
	2,3


--Total Population vs Vaccinations
--[How many people have been vaccinated in a country?]

--Using CTE

With PopvsVac (Continent, Location, date, Population, new_vaccinations, Rolling_Count_Vaccinations)
as (
SELECT dea.continent, dea.location, CONVERT(DATE, dea.date, 103) as correct_date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as float)) OVER (Partition by dea.location Order by dea.location, CONVERT(DATE, dea.date, 103)) as Rolling_Count_Vaccinations
FROM [Covid 19 Portfolio Project]..Covid_Deaths dea
Join [Covid 19 Portfolio Project]..Covid_Vaccination vac
	On dea.location = vac.location
	and CONVERT(DATE, dea.date, 103) = CONVERT(DATE, vac.date, 103)
WHERE
	dea.continent IS NOT NULL AND dea.continent <> ''
)
SELECT *, (Rolling_Count_Vaccinations/Population) * 100
FROM PopvsVac



--CREATING A TEMP TABLE

DROP TABLE if exists #Percentage_Population_Vaccinated
Create Table #Percentage_Population_Vaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date date,
Population nvarchar(255),
New_Vaccinations nvarchar(255),
Rolling_Count_Vaccinations numeric
)

Insert into #Percentage_Population_Vaccinated
SELECT dea.continent, dea.location, CONVERT(DATE, dea.date, 103) as correct_date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as float)) OVER (Partition by dea.location Order by dea.location, CONVERT(DATE, dea.date, 103)) as Rolling_Count_Vaccinations
FROM [Covid 19 Portfolio Project]..Covid_Deaths dea
Join [Covid 19 Portfolio Project]..Covid_Vaccination vac
	On dea.location = vac.location
	and CONVERT(DATE, dea.date, 103) = CONVERT(DATE, vac.date, 103)
WHERE
	dea.continent IS NOT NULL AND dea.continent <> ''

SELECT *, (Rolling_Count_Vaccinations/Population) * 100
FROM #Percentage_Population_Vaccinated




--CREATING A VIEW
--[Creating a view to store data for later visualization]

--SELECT * FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'Percentage_of_Population_Vaccinated' --> checking where the view is

USE [Covid 19 Portfolio Project];
GO

CREATE VIEW Percentage_of_Population_Vaccinated AS
SELECT dea.continent, dea.location, CONVERT(DATE, dea.date, 103) as correct_date, dea.population, vac.new_vaccinations,
SUM(CAST(vac.new_vaccinations AS float)) OVER (PARTITION BY dea.location ORDER BY dea.location, CONVERT(DATE, dea.date, 103)) as Rolling_Count_Vaccinations
FROM [Covid 19 Portfolio Project]..Covid_Deaths dea
JOIN [Covid 19 Portfolio Project]..Covid_Vaccination vac
	ON dea.location = vac.location
	AND CONVERT(DATE, dea.date, 103) = CONVERT(DATE, vac.date, 103)
WHERE
	dea.continent IS NOT NULL AND dea.continent <> '';


SELECT *
FROM Percentage_of_Population_Vaccinated