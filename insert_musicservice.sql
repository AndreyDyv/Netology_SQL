INSERT INTO genres (genre_name)
VALUES('rock_n_roll'), ('heavy_metal'), ('pop'), ('electonic'), ('classic'), ('jazz');

INSERT INTO artists (artist_name) 
VALUES('The Beatles'), ('Led Zeppelin'), ('Metallica'), ('Soulfly'), ('Wolfgang Amadeus Mozart'), ('Ludwig van Beethoven'),
('Daft Punk'), ('Massive Attack'), ('Rihanna'), ('Ed Sheeran'), ('Nina Simone'), ('Ray Charles');

INSERT INTO genresartists (genre_id, artist_id) 
VALUES(1, 1), (1, 2), (2, 3), (2, 4), (3, 9), (3, 10), (4, 7), (4, 8), (5, 5), (5, 6), (6, 11), (6, 12);

INSERT INTO albums (album_title, album_year_of_issue) 
VALUES('A Hard Day’s Night', 1964), ('Revolver', 1966), ('Led Zeppelin II', 1969), ('Houses of the Holy', 1973),
('Ride the Lightning', 1984), ('Metallica (Black Album)', 1991), ('Primitive', 2000), ('Omen', 2010), 
('Achtes Quartett [F dur] für 2 Violinen, Viola und Violoncell, Köch. Verz. No. 168.', 2009), 
('Concert Allegro nach dem Finale des 19. Clavier-Concertes, für zu vier Händen frei bearb. von Carl Reinecke', 2010), 
('Ludwig van Beethoven. Collection', 2010), ('Discovery ', 2001), ('Random Access Memories', 2013), 
('Mezzanine', 1998), ('Heligoland', 2010), ('Music of the Sun', 2005), ('Talk That Talk', 2011), 
('Unapologetic', 2012), ('+', 2011), ('÷', 2018), ('=', 2021), ('Nina at the Village Gate', 1961), 
('The Genius After Hours', 1961); 

INSERT INTO artistsalbums (artist_id, album_id) 
VALUES(1, 1), (1, 2), (2, 3), (2, 4), (3, 5), (3, 6), (4, 7), (4, 8), (5, 9), (5, 10), (6, 11), (7, 12), (7, 13), 
(8, 14), (8, 15), (9, 16), (9, 17), (9, 18), (10, 19), (10, 20), (10, 21), (11, 22), (12, 23); 

INSERT INTO tracks (album_id, track_title, track_duration) 
VALUES(1, 'A Hard Day’s Night', 152), (1, 'I Should Have Known Better', 164), (1, 'If I Fell (In Love with You)', 142), 
(1, 'I’m Happy Just To Dance with You', 118), (1, 'And I Love Her', 151), (1, 'Tell Me Why', 130),
(1, 'Can’t Buy Me Love', 135), (1, 'Any Time at All', 133), (1, 'I’ll Cry Instead', 129), 
(1, 'Things We Said Today', 158), (1, 'When I Get Home', 138), (1, 'You Can’t Do That', 154), (1, 'I’ll Be Back', 140), 
(2, 'Taxman', 159), (2, 'Eleanor Rigby', 126), (2, 'I’m Only Sleeping', 181), 
(2, 'Love You To', 181), (2, 'Here, There and Everywhere', 145), (2, 'Yellow Submarine', 158), 
(2, 'She Said, She Said', 157), (2, 'Good Day Sunshine', 126), 
(2, 'And Your Bird Can Sing', 121), (2, 'For No One', 121), (2, 'Doctor Robert', 135), 
(2, 'I Want to Tell You', 149), (2, 'Got to Get You into My Life', 155), (2, 'Tomorrow Never Knows', 177),
(3, 'Whole Lotta Love', 334), (3, 'What Is and What Should Never Be', 286), (3, 'The Lemon Song', 379), 
(3, 'Thank You', 209), (3, 'Heartbreaker', 174), (3, 'Living Loving Maid (She`s Just a Woman)', 159), 
(3, 'Ramble On', 274), (3, 'Moby Dick', 260), (3, 'Bring It On Home', 259),
(4, 'The Song Remains the Same', 332), (4, 'The Rain Song', 459), (4, 'Over the Hills and Far Away', 290), 
(4, 'The Crunge', 197), (4, 'Dancing Days', 223), (4, 'D’yer Mak’er', 263), 
(4, 'No Quarter', 420), (4, 'The Ocean', 261), (5, 'Fight Fire with Fire', 285), 
(5, 'Ride the Lightning', 397), (5, 'For Whom the Bell Tolls', 309), (5, 'Fade to Black', 419), 
(5, 'Trapped Under Ice', 248), (5, 'Escape', 264), (5, 'Creeping Death', 395), (5, 'The Call of Ktulu', 535), 
(6, 'Enter Sandman', 330), (6, 'Sad but True', 323), (6, 'Holier Than Thou', 227), 
(6, 'The Unforgiven', 386), (6, 'Wherever I May Roam', 403), (6, 'Don`t Tread on Me', 240), 
(6, 'Through the Never', 243), (6, 'Nothing Else Matters', 387), (6, 'Of Wolf & Man', 256),
(6, 'The God That Failed', 307), (6, 'My Friend of Misery', 408), (6, 'The Struggle Within', 235),
(7, 'Back to the Primitive', 260), (7, 'Pain', 220), (7, 'Bring It', 202),
(7, 'Jumpdafuckup', 311), (7, 'Mulambo', 259), (7, 'Son Song', 257),
(7, 'Boom', 296), (7, 'Terrorist', 226), (7, 'The Prophet', 177), 
(7, 'Soulfly II', 364), (7, 'In Memory of…', 276), (7, 'Flyhigh', 288),
(8, 'Bloodbath & Beyond', 151), (8, 'Rise of the Fallen', 275), (8, 'Great Depression', 237), 
(8, 'Lethal Injection', 185), (8, 'Kingdom', 235), (8, 'Jeffrey Dahmer', 172),
(8, 'Off With Their Heads', 262), (8, 'Vulture Culture', 241), (8, 'Mega-Doom', 184), 
(8, 'Counter Sabotage', 230), (8, 'Soulfly VII', 263), 
(9, 'Achtes Quartett [F dur] für 2 Violinen, Viola und Violoncell', 728), 
(10, 'Concert Allegro nach dem Finale des 19', 578), 
(11, 'Bagatelle in A minor, WoO 59, "Fur Elise"', 355),
(11, 'Mass in D major, Op. 123, "Missa Solemnis": Benedictus', 543), 
(11, 'Violin Sonata No. 5 in F major, Op. 24, "Spring": II. Adagio molto espressivo', 1166), 
(12, 'One More Time', 320), (12, 'Aerodynamic', 207), (12, 'Digital Love', 298),
(12, 'Harder, Better, Faster, Stronger', 225), (12, 'Crescendolls', 212), (12, 'Nightvision', 104),
(12, 'Superheroes', 237), (13, 'Give Life Back to Music', 274),
(13, 'The Game of Love', 301), (13, 'Giorgio by Moroder', 544), (13, 'Within', 228),
(13, 'Instant Crush', 337), (13, 'Lose Yourself to Dance', 353), (13, 'Touch', 498), 
(13, 'Get Lucky', 367), (13, 'Beyond', 290), (13, 'Motherboard', 341), 
(13, 'Fragments of Time', 279), (13, 'Doin It Right', 251), (13, 'Contact', 381), 
(14, 'Angel', 378), (14, 'Risingson', 298), (14, 'Teardrop', 329), 
(14, 'Inertia Creeps', 356), (14, 'Exchange', 251), (14, 'Dissolved Girl', 367), 
(14, 'Man Next Door', 355), (14, 'Black Milk', 380), (14, 'Mezzanine', 354), 
(15, 'Pray for Rain', 355), (15, 'Babel', 380), (15, 'Splitting the Atom', 354), 
(15, 'Girl I Love You', 356), (15, 'Psyche', 380), (15, 'Flat of the Blade', 280), 
(15, 'Paradise Circus', 378), (15, 'Rush Minute', 279), (15, 'Saturday Come Slow', 290),
(16, 'Pon de Replay', 186), (16, 'Here I Go Again', 151), (16, 'If Its Lovin That You Want', 208),
(16, '«You Dont Love Me (No, No, No)', 260), (16, 'That La, La, La', 225), (16, 'The Last Time', 293), 
(16, 'Willing to Wait', 273), (16, 'Music of the Sun', 236), (16, 'Let Me', 236), 
(16, 'Rush', 189), (16, 'Theres a Thug in My Life', 201), (16, 'Now I Know', 301), 
(17, 'You da One', 200), (17, 'Where Have You Been', 242), (17, 'We Found Love', 216), 
(17, 'Talk That Talk', 209), (17, 'Cockiness (Love It)', 178), (17, 'Birthday Cake', 78),
(17, 'We All Want Love', 237), (17, 'Drunk on Love', 212), (17, 'Roc Me Out', 209), 
(18, 'Fresh Out the Runway', 222), (18, 'Diamonds', 226), (18, 'Numb (feat. Eminem)', 205), 
(18, 'Pour It Up', 181), (18, 'Loveeeeeee Song', 256), (18, 'Jump', 266), 
(18, 'Right Now (feat. David Guetta)', 182), (18, 'What Now', 243), (18, 'Stay', 241), 
(18, 'Nobodys Business (feat. Chris Brown)', 216), (18, 'Love Without Tragedy / Mother Mary', 419), (18, 'Get It Over With', 212), 
(19, 'The A Team', 258), (19, 'Drunk', 200), (19, 'U.N.I.', 228), 
(19, 'Grade 8', 179), (19, 'Wake Me Up', 229), (19, 'Small Bump', 259), 
(19, 'This', 295), (19, 'The City', 234), (19, 'Lego House', 185),
(19, 'You Need Me, I Don`t Need You', 240), (19, 'Kiss Me', 280), (19, 'Give Me Love', 526), 
(20, 'Eraser', 227), (20, 'Castle on the Hill', 261), (20, 'Dive', 238), 
(20, 'Shape of You', 233), (20, 'Perfect', 263), (20, 'Galway Girl', 170), 
(20, 'Happier', 207), (20, 'New Man', 189), (20, 'Hearts Dont Break Around Here', 248), 
(20, 'What Do I Know?', 237), (20, 'How Would You Feel (Paean)', 280), (20, 'Supermarket Flowers', 221), 
(21, 'Tides', 295), (21, 'Shivers', 207), (21, 'First Times', 185),
(21, 'Bad Habits', 229), (21, 'Overpass Graffiti', 237), (21, 'The Joker and the Queen', 185), 
(21, 'Leave Your Life', 223), (21, 'Collide', 210), (21, '2step', 153), 
(21, 'Stop the Rain', 203), (21, 'Love in Slow Motion', 190), (21, 'Visiting Hours"', 215), 
(21, 'Sandman', 259), (21, 'Be Right Now', 221), 
(22, 'Just in Time', 200), (22, 'He Was Too Good to Me', 203), 
(22, 'House of the Rising Sun (traditional)', 365), (22, 'Bye Bye Blackbird', 206), (22, 'Brown Baby', 198), 
(22, 'Zungo', 302), (22, 'If He Changed My Name', 287), (22, 'Children Go Where I Send You', 362), 
(23, 'The Genius After Hours', 324), (23, 'Ain`t Misbehavin', 340), (23, 'Dawn Ray', 303), 
(23, 'Joy Ride', 289), (23, 'Hornful Soul', 329), (23, 'The Man I Love', 266), 
(23, 'Charlesville', 295), (23, 'Music, Music, Music', 173); 

INSERT INTO collections (collection_title, collection_year_of_issue) 
VALUES('Metallica. The Best', 1992), ('Romantic collection. Part 1', 2018), 
('History of rock. Collection', 2015), ('Classical music collection', 2020), 
('POP HITS', 2021), ('Electonic collection', 2013), ('Metal power. Collection', 2010), 
('Rihanna: the newest and the best', 2012), ('The best of Ed Sheeran', 2021);

INSERT INTO collectionstracks (collection_id, track_id) 
VALUES(1, 47), (1, 48), (1, 51), (1, 52), (1, 53), (1, 54), (1, 56), (1, 57), (1, 60), (1, 61),
(2, 15), (2, 48), (2, 60), (2, 74), (2, 87), (2, 118), (2, 153), (2, 179),
(3, 14), (3, 28), (3, 32), (3, 37), (3, 46), (3, 47), (3, 53), (3, 56), (3, 65), (3, 68), (3, 78), (3, 81), 
(4, 88), (4, 89), (4, 90), (4, 92),
(5, 134), (5, 141), (5, 93), (5, 96), (5, 107), (5, 145), (5, 153), (5, 168), (5, 179), (5, 191), 
(6, 93), (6, 125), (6, 96), (6, 127), (6, 99), (6, 107), (6, 110), (6, 113), (6, 120), (6, 121),
(7, 32), (7, 35), (7, 47), (7, 51), (7, 53), (7, 57), (7, 65), (7, 72), (7, 77), (7, 85),
(8, 133), (8, 138), (8, 145), (8, 148), (8, 149), (8, 153), (8, 154), (8, 157), (8, 158), (8, 163),
(9, 165), (9, 171), (9, 173), (9, 174), (9, 175), (9, 176), (9, 179), (9, 183), (9, 184), 
(9, 187), (9, 191), (9, 193), (9, 196), (9, 198), (9, 200);

SELECT * FROM genres;

SELECT * FROM artists;

SELECT * FROM genresartists;

SELECT * FROM albums;

SELECT * FROM artistsalbums;

SELECT * FROM tracks;

SELECT * FROM collections;

SELECT * FROM collectionstracks;
 