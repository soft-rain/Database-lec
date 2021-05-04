-- 4-a) 이탈리아 국적의 레이싱 팀 소속의 드라이버들을 찾아라.
SELECT driver FROM drivers, Constructors WHERE drivers.constructor = constructors.constructor and Constructors.country = 'Italian';

-- 4-b) 소속 레이싱 팀의 국적과 드라이버의 국적이 같은 드라이버를 찾아라
SELECT driver FROM drivers NATURAL JOIN Constructors WHERE drivers.country = constructors.country;

-- 4-c) Monaco Grand Prix 그랑프리에 참가한 드라이버의 이름, 드라이버가 소속된 레이싱 팀의 엔진과 그랑프리 참가 횟수를 열거하여라.
SELECT drivers.driver, engine, races_entered FROM drivers LEFT OUTER JOIN constructors ON drivers.constructor = constructors.constructor LEFT OUTER JOIN results ON drivers.driver=results.driver WHERE race='Monaco Grand Prix';

-- 4-d) 오직 하나의 드라이버를 가지는 모든 레이싱 팀을 찾아라.
SELECT drivers.constructor FROM drivers LEFT OUTER JOIN constructors ON constructors.constructor = drivers.constructor GROUP BY constructor HAVING count(*)=1;

-- 4-e) BMW Sauber 레이싱 팀의 멤버이거나 Spanish Grand Prix 그랑프리에 참가한 모든 드라이버의 이름을 중복없이 열거하여라.
SELECT driver FROM Results NATURAL RIGHT OUTER JOIN drivers WHERE race='Spanish Grand Prix' OR constructor='BMW Sauber';

-- 4-f) 드라이버의 이름과 드라이버가 소속된 레이싱 팀의 참가 횟수를 내림차순으로 열거하시오.(첫 번째 정렬기준은 그랑프리 참가 횟수, 두 번째 정렬 기준은 드라이버의 이름이다.)
SELECT driver, races_entered FROM drivers LEFT OUTER JOIN constructors ON constructors.constructor = drivers.constructor ORDER BY races_entered DESC, driver DESC;

-- 4-g) Cosworth 엔진을 사용하는 레이싱 팀과 Mercedes엔진을 사용하는 레이싱 팀을 모두 가지고 있는 모든 나라를 찾아라.
SELECT DISTINCT country FROM constructors WHERE engine='Cosworth' OR engine='Mercedes';

-- 4-h) 그랑프리에서 우승한 적이 있으면서 순위에는 들었으나 우승을 하지 못했던 드라이버들을 중복없이 찾아라.
SELECT DISTINCT a.driver FROM results AS a JOIN results AS b ON a.driver = b.driver WHERE a.race_rank='first place' OR b.race_rank='first place' GROUP BY driver HAVING count(*)>1;

-- 4-i) 2008년부터 2009년까지 2년 동안 개최한 그랑프리에 참가한 드라이버의 이름과 드라이버가 참가한 그랑프리의 날짜(begindate)의 월과 년도(형식: mm-yyyy)를 열거하라.
SELECT Results.driver, DATE_FORMAT(Races.beginDate, '%m-%Y') as beginDate FROM Results LEFT OUTER JOIN Races ON Races.Name = Results.race WHERE YEAR(Races.beginDate)='2008' OR YEAR(Races.beginDate)='2009';
