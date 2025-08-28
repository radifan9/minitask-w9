-- 01
SELECT id,
       title,
       release_date,
       rating
FROM movies
WHERE release_date
between '2020-01-01 00:00:00' and '2020-12-31 23:59:59';

-- 02
SELECT id,
       name
FROM actors
WHERE name like '%s';


-- 03
SELECT id,
       title,
       release_date,
       rating
FROM movies
WHERE rating
      between 4 and 7
      AND release_date
      between '2004-01-01 00:00:00' and '2010-12-31 23:59:59';