#Assignment 3
DROP TABLE IF EXISTS movieRatings;

CREATE TABLE movieRatings(
	id 						int not null AUTO_INCREMENT,
    Hustlers 				int,
    The_Turning				int,
	Once_Upon_a_Time		int,
    Joker					int,
    NineteenSeventeen		int,
    Knives_Out				int,
    PRIMARY KEY (id)
);

LOAD DATA INFILE '/Users/devinteran/MSinDS/DATA607-DataAcquisition/Week2/Assignment/MovieRating.csv'
INTO TABLE movieRatings
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy,@Hustlers,@The_Turning,@Once_Upon_a_Time,@Joker,@NineteenSeventeen,@Knives_Out)
SET
Hustlers = nullif(@Hustlers,''),
The_Turning = nullif(@The_Turning,''),
Once_Upon_a_Time = nullif(@Once_Upon_a_Time,''),
Joker = nullif(@Joker,''),
NineteenSeventeen = nullif(@NineteenSeventeen,''),
Knives_Out = nullif(@Knives_Out,'')
;
select * from movieRatings;

DROP TABLE IF EXISTS averageMovieRatings;
CREATE TABLE averageMovieRatings(
	movie 	varchar(100),
    avg_rating	numeric(12,4)
);

INSERT INTO averageMovieRatings (movie,avg_rating)
SELECT 'Hustlers',AVG(HUSTLERS)
from movieRatings;
INSERT INTO averageMovieRatings (movie,avg_rating)
SELECT 'The Turning',AVG(The_Turning)
from movieRatings;
INSERT INTO averageMovieRatings (movie,avg_rating)
SELECT 'Once Upon a Time in Hollywood',AVG(Once_Upon_a_Time)
from movieRatings;
INSERT INTO averageMovieRatings (movie,avg_rating)
SELECT 'Joker',AVG(Joker)
from movieRatings;
INSERT INTO averageMovieRatings (movie,avg_rating)
SELECT '1917',AVG(NineteenSeventeen)
from movieRatings;
INSERT INTO averageMovieRatings (movie,avg_rating)
SELECT 'Knives Out',AVG(Knives_Out)
from movieRatings;

select * from movieRatings;