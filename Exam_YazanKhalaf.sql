-- Q1 create the ER diagram for the music database ANSWER: See Attached PNG file 
-- Q2 how many artists produced both Metal and Rock music? ANSWER: 3
SELECT		A.Artistid, A.genre, B.genre
FROM		album A
JOIN		album B
Where		A.Genre = 'Rock' AND B.genre= 'Metal'
AND			A.artistId = B.artistId
GROUP BY	A.Artistid;
-- Q3 find the total track duration in milliseconds by artist name for tracks containing the word 'always'
SELECT		A.Milliseconds, A.name, C.name AS ArtistName
FROM		track A
JOIN		album B 
ON			A.albumId = B.albumId
JOIN		artist C 
ON			B.artistId = C.ArtistId
WHERE		A.Name LIKE '%always%'
GROUP BY	A.Milliseconds, A.name, C.name;
-- Q4 find all the different tracks which just happen to have the same duration in milliseconds and the same composer
SELECT		A.Trackid, B.trackid, A.Milliseconds, B.Milliseconds, A.composer, B.composer 
FROM		track A
JOIN		track B
WHERE		A.trackid <> B.trackid
AND			A.Milliseconds = B.Milliseconds
AND			A.Composer = B.Composer;
-- Q5 what is the total track sales by first letter of album title?
SELECT		LEFT(A.title,1) AS Albumletter, SUM(B.sales) AS TotalSales
FROM		album A 
JOIN		track B 
ON 			A.albumId = B.albumId
GROUP BY	LEFT(A.title,1);
-- Q6 find the total revenue by ticket type, for the 2019-2020 season and resort Kandatsu
SELECT		Type, SUM(Revenue) AS TotalRevenue, Resort, season
FROM		ski
GROUP BY	Resort, TYPE, Season
HAVING 		Resort = 'Kandatsu'
AND			Season = '2019-2020';