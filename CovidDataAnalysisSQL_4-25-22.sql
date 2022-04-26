/*
Covid 19 Data Exploration 
Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types
*/

Select *
From PortfolioProject..CovidDeaths$
order by 3,4


--Select * 
--From PortfolioProject..CovidVaccinations$
--order by 3,4


Select Location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject..CovidDeaths$
order by 1,2 

--Looking at Total Cases vs Total Deaths
--Shows likelihod of dying if you contract covid in your country
Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths$
Where location like '%states%'
order by 1,2

-- Total Cases vs Population
-- Shows what percentage of population infected with Covid

Select Location, date, Population, total_cases,  (total_cases/population)*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths$
--Where location like '%states%'
order by 1,2


--Looking at Countries with Highest Infection Rate compared to Population
Select Location, date, Population, MAX(total_cases) as HighestInfectionCount,  MAX((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths$
--Where location like '%states%'
Group by Location, date, Population
order by PercentPopulationInfected desc


--Showing Countries with Highest Death Count per Population
Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths$
--Where location like '%states%'
Where continent is not null 
Group by Location
order by TotalDeathCount desc


--Showing contintents with the highest death count per population

--Display Global Numbers

--Shows Percentage of Population that has recieved at least one Covid Vaccine\

--Using CTE to perform Calculation on Partition By in previous query

--Using Temp Table to perform Calculation on Partition By in previous query

--Creating View to store data for later visualizations