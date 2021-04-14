-- 3-a)
SELECT constructor, country FROM Constructors WHERE races_entered >=100; 

-- 3-b)
SELECT constructor, engine, races_entered FROM Constructors WHERE height<>95 AND width<180 ORDER BY engine ASC, race_enter ASC;

-- 3-c)
SELECT constructor FROM Constructors WHERE engine='Ferrari';

-- 3-d)
-- SELECT name FROM Drivers WHERE EXTRACT(YEAR FROM date(birthday, "%dd/%mm/%yy")

-- 3-e)
SELECT name, name FROM Drivers, Races WHERE Results.race_rank='first place';

-- 3-f)
SELECT name from Races WHERE area='Europe' ORDER BY name asc;

-- 3-g)
SELECT DISTINCT name from Drivers WHERE name LIKE 'H%';

-- -- 3-h)
-- SELECT 
