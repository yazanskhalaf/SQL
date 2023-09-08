USE wine_reviews;

SELECT DISTINCT taster_name
FROM reviews;

SELECT *
FROM wine
ORDER BY price DESC
LIMIT 1;

SELECT taster_name, title
FROM reviews
WHERE title LIKE 'Tommasi 2001%';

SELECT winery, province, price, AVG(price) AS average_wine_price
FROM wine
WHERE province = 'California'
GROUP BY winery
HAVING price > 100
ORDER BY average_wine_price DESC;

SELECT wine.winery, reviews.points, AVG(reviews.points) AS average_review_points
FROM reviews LEFT JOIN wine ON reviews.wine_id=wine.wine_id
GROUP BY winery
ORDER BY average_review_points DESC
LIMIT 3;

SELECT taster_name, COUNT(*) AS Gordon_review_count
FROM reviews
WHERE taster_name = 'Jim Gordon';

SELECT DISTINCT variety
FROM wine
WHERE province = 'Oregon';

SELECT *
FROM wine
WHERE region_1 != ''
AND price != ''
LIMIT 10;

CREATE DATABASE ykhalaf;

SELECT *
FROM wine;

USE wine_reviews;
CREATE TABLE ykhalaf.price_groups
SELECT *, 
CASE
WHEN price BETWEEN 1 AND 50 THEN 'cheap'
WHEN price BETWEEN 50 AND 100 THEN 'mid-priced'
WHEN price > 100 THEN 'expensive'
ELSE 'NA'
END AS price_groups
FROM wine;

USE ykhalaf;
SELECT province, variety, price, price_groups
FROM price_groups
WHERE price != 0
LIMIT 15;

USE wine_reviews;
SELECT variety, price, province,
RANK() OVER (PARTITION BY province ORDER BY price DESC) AS variety_ranking
FROM wine
LIMIT 15;