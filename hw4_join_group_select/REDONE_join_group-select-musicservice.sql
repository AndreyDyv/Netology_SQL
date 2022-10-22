-- 1 количество исполнителей в каждом жанре; 
SELECT  g.genre_name, 
		COUNT(artist_id) AS artist_amount 
  FROM  genres AS g
		JOIN genresartists AS g2 
		  ON g.id = g2.genre_id 
GROUP BY  g.genre_name; 


-- 2 количество треков, вошедших в альбомы 2019-2020 годов;
SELECT  a.album_title, 
		a.album_year_of_issue, 
		COUNT(track_title) AS track_amount 
  FROM  albums AS a
		JOIN tracks AS t 
		  ON a.id = t.album_id
 WHERE  a.album_year_of_issue BETWEEN 2019 AND 2020
GROUP BY a.album_title, a.album_year_of_issue; 


-- 3 средняя продолжительность треков по каждому альбому;
SELECT  album_title, 
		AVG(track_duration) AS avg_len 
  FROM  albums AS a 
		JOIN tracks AS t 
		  ON a.id = t.album_id 
GROUP BY  a.album_title
ORDER BY  avg_len DESC;


-- 4 все исполнители, которые не выпустили альбомы в 2020 году; 
SELECT  artist_name  
  FROM  artists
 WHERE  artist_name 
        NOT IN
              (SELECT  ar.artist_name
				 FROM  artists AS ar
					   JOIN artistsalbums AS aa 
						 ON ar .id = aa.artist_id 
					   JOIN albums AS al 
						 ON aa.album_id = al.id
     				  WHERE al.album_year_of_issue = 2020)
ORDER BY artist_name;


-- 5 названия сборников, в которых присутствует конкретный исполнитель (выберите сами); 
SELECT  DISTINCT c.collection_title, a3.artist_name 
  FROM  collections AS c 
		JOIN collectionstracks AS c2 
		  ON c.id = c2.collection_id 
		JOIN tracks AS t 
		  ON c2.track_id = t.id 
		JOIN albums AS a 
		  ON t.album_id = a.id  
		JOIN artistsalbums AS a2 
		  ON a.id = a2.album_id 
		JOIN artists AS a3 
		  ON a2.artist_id = a3.id 
WHERE   artist_name = 'Metallica';



-- 6 название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT  c.collection_title AS title 
  FROM  collections AS c
		JOIN collectionstracks AS c2 
		  ON c.id = c2.collection_id 
		JOIN tracks AS t 
		  ON c2.track_id = t.id 
		JOIN albums AS a 
		  ON t.album_id = a.id  
		JOIN artistsalbums AS a2 
		  ON a.id = a2.album_id 
		JOIN artists AS a3 
		  ON a2.artist_id = a3.id 
		JOIN genresartists AS g 
		  ON a3.id = g.artist_id 
		JOIN genres AS g2 
		  ON g.genre_id = g2.id 
GROUP BY  title
  HAVING  COUNT(DISTINCT g2.genre_name) > 1;


-- 7 наименование треков, которые не входят в сборники;
SELECT track_title  
  FROM tracks AS t
	   LEFT JOIN collectionstracks AS c 
	          ON t.id = c.track_id 
 WHERE c.collection_id is NULL;



 /* 8  исполнителя(-ей), написавшего самый короткий по продолжительности трек
(теоретически таких треков может быть несколько);*/
SELECT  a.artist_name, 
		MIN(t.track_duration) AS min_track 
  FROM  artists AS a  
		JOIN artistsalbums AS a2 
		  ON a.id = a2.artist_id 
		JOIN albums AS a3 
		  ON a2.album_id = a3.id 
		JOIN tracks AS t 
		  ON a3.id = t.album_id 
 WHERE  track_duration = (SELECT MIN(track_duration) FROM tracks)
GROUP BY a.artist_name; 


-- 9 название альбомов, содержащих наименьшее количество треков.   	   
SELECT  a.album_title AS "album title"
  FROM  albums AS a 
        JOIN tracks AS t
          ON a.id  = t.album_id  
GROUP BY a.album_title  
HAVING  COUNT(t.track_title) = 
        (SELECT MIN(amount) 
           FROM 
               (SELECT COUNT(t.track_title) AS amount
                  FROM albums AS a
                       JOIN tracks AS t
					     ON a.id = t.album_id
				GROUP BY a.album_title)		
		 AS inner_query);
  
