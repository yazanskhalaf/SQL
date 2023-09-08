SELECT		continent, SUM(SurfaceArea) AS TotalSA, count(*) AS CountryCount -- Q1
FROM		country
GROUP BY	Continent;

SELECT		region, SUM(Population) AS TotalPop, count(country_name) AS CountryCount -- Q2
FROM		country
GROUP BY	region
HAVING		count(country_name) > 10;

SELECT		region, AVG(LifeExpectancy) AS AVGLife -- Q3
FROM		country
GROUP BY	region
HAVING		AVG(LifeExpectancy) BETWEEN 77 AND 82;

SELECT		CONCAT(FLOOR(IndepYear/10)*10,'-',10*FLOOR(IndepYear/10)+9), COUNT(*) -- Q4
FROM		country
WHERE		IndepYear != 0
GROUP BY	CONCAT(FLOOR(IndepYear/10)*10,'-',10*FLOOR(IndepYear/10)+9);
