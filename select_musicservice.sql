--название и год выхода альбомов, вышедших в 2018 году;
SELECT album_title, album_year_of_issue FROM albums
WHERE album_year_of_issue = 2018;

--название и продолжительность самого длительного трека
SELECT track_title, track_duration FROM tracks
ORDER BY track_duration DESC, track_title 
LIMIT 1;


--название треков, продолжительность которых не менее 3,5 минуты
SELECT track_title FROM tracks
WHERE track_duration > 210;

--названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT collection_title FROM  collections
WHERE 2018 <= collection_year_of_issue AND collection_year_of_issue <= 2020;


--исполнители, чье имя состоит из 1 слова
SELECT artist_name FROM artists
WHERE artist_name NOT LIKE '% %'; 

--название треков, которые содержат слово "мой"/"my"
SELECT track_title FROM tracks
WHERE track_title LIKE '%My%';