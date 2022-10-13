-- количество исполнителей в каждом жанре; 
SELECT g.genre_name, COUNT(artist_id) as artist_amount 
	FROM genres as g
JOIN genresartists as g2 ON g.id = g2.genre_id 
GROUP BY g.genre_name; 


-- количество треков, вошедших в альбомы 2019-2020 годов;
SELECT a.album_title, a.album_year_of_issue, COUNT(track_title) as track_amount 
	FROM albums as a
JOIN tracks as t ON a.id = t.album_id
WHERE a.album_year_of_issue BETWEEN 2019 AND 2020
GROUP BY a.album_title, a.album_year_of_issue; 


-- средняя продолжительность треков по каждому альбому;
SELECT album_title, AVG(track_duration) as avg_len 
	FROM albums as a 
JOIN tracks as t ON a.id = t.album_id 
GROUP BY a.album_title
ORDER BY avg_len DESC;


-- все исполнители, которые не выпустили альбомы в 2020 году;
SELECT art.artist_name, al.album_year_of_issue 
	FROM artists as art  
JOIN artistsalbums as aa ON art.id = aa.artist_id 
JOIN albums as al ON aa.album_id = al.id 
WHERE al.album_year_of_issue != 2020
GROUP BY art.artist_name, al.album_year_of_issue 
ORDER BY art.artist_name;


-- названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
SELECT c.collection_title, a3.artist_name 
	FROM collections as c 
JOIN collectionstracks as c2 ON c.id = c2.collection_id 
JOIN tracks as t ON c2.track_id = t.id 
JOIN albums as a ON t.album_id = a.id  
JOIN artistsalbums as a2 ON a.id = a2.album_id 
JOIN artists as a3 ON a2.artist_id = a3.id 
WHERE artist_name = 'Rihanna'
--WHERE artist_name IN ('Metallica', 'Ed Sheeran', 'Daft Punk', 'Rihanna', 'Led Zeppelin')
GROUP BY c.collection_title, a3.artist_name;


-- название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT c.collection_title as title 
	FROM collections as c
JOIN collectionstracks as c2 ON c.id = c2.collection_id 
JOIN tracks as t ON c2.track_id = t.id 
JOIN albums as a ON t.album_id = a.id  
JOIN artistsalbums as a2 ON a.id = a2.album_id 
JOIN artists as a3 ON a2.artist_id = a3.id 
JOIN genresartists as g ON a3.id = g.artist_id 
JOIN genres as g2 ON g.genre_id = g2.id 
GROUP BY title  
HAVING COUNT(DISTINCT g2.genre_name) > 1;


-- наименование треков, которые не входят в сборники;
SELECT track_title  
	FROM tracks as t
LEFT JOIN collectionstracks as c ON t.id = c.track_id 
WHERE c.collection_id is NULL 
GROUP BY track_title;



-- исполнителя(-ей), написавшего самый короткий по продолжительности трек 
-- (теоретически таких треков может быть несколько);
SELECT a.artist_name, MIN(t.track_duration) as min_track FROM artists as a  
JOIN artistsalbums as a2 ON a.id = a2.artist_id 
JOIN albums as a3 ON a2.album_id = a3.id 
JOIN tracks as t ON a3.id = t.album_id 
WHERE track_duration = (SELECT MIN(track_duration) FROM tracks)
GROUP BY a.artist_name; 


-- название альбомов, содержащих наименьшее количество треков.
SELECT a.album_title, COUNT(track_title) as track_amount FROM albums as a 
JOIN tracks as t ON a.id = t.album_id
GROUP BY a.album_title 
ORDER BY COUNT(track_title);

