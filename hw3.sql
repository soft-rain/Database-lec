-- 3-a) 그랑프리에 100번 이상 참가한 constructor의 이름과 constructor의 국가(country)를 찾아라.
SELECT constructor, country FROM Constructors WHERE races_entered >=100; 

-- 3-b)차체의 높이가 95센치가 아니고 차체의 너비가 180센티보다 작은 차체를 사용하는 레이싱 팀의 이름, 엔진이름, 그랑프리 참가 횟수를 찾아라. 결과는 첫번째는 엔진이름으로, 두 번째는 그랑프리에 참가한 횟수를 기준으로 오름차순으로 보여준다.
SELECT constructor, engine, races_entered FROM Constructors WHERE height<>95 AND width<180 ORDER BY engine ASC, races_entered ASC;

-- 3-c) Ferrari 엔진을 사용하는 모든 constructor들을 찾아라
SELECT constructor FROM Constructors WHERE engine='Ferrari';

-- 3-d)1980년도 이후에 태어난 모든 드라이버의 이름을 찾아라. 단, 결과 테이블의 컬럼은 새 이름으로 newBoys을 사용한다
SELECT driver as newBoys FROM Drivers  WHERE EXTRACT(YEAR FROM date(birthday)) >=1980;

-- 3-e)각 그랑프리에서 우승한 드라이버의 이름과 그랑프리의 이름을 찾아라
SELECT driver, race from Results WHERE race_rank='first place';

-- 3-f) 유럽 지역에서 열린 그랑프리를 모두 찾아라. 그랑프리 이름을 기준으로 오름차순으로 정렬하여라.
SELECT Name FROM Races WHERE area='Europe' ORDER BY name asc;

-- 3-g)문자 'H'로 시작하는 이름을 가진 모든 드라이버를 찾아라.
SELECT DISTINCT driver FROM Drivers WHERE driver LIKE 'H%';

-- 3-h)두 개 이상의 단어로 이루어진 이름을 가지는 모든 constructor들의 이름을 찾아라. 
SELECT constructor FROM Constructors WHERE constructor LIKE '% %';