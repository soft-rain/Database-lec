-- 6. 위의 데이터베이스 스키마를 기반으로 집계 함수(aggregate function)를 포함하는 다음의 SQL 쿼리를 작성하시오.

-- a) Ferrari 엔진을 사용하는 레이싱 팀의 개수를 구하라.
SELECT COUNT(*) AS COUNT FROM constructors WHERE engine='Ferrari';
-- b) 영국 국적의 레이싱 팀들의 그랑프리 참가 횟수의 평균을 구하여라.
SELECT AVG(races_entered) AS average FROM constructors WHERE country = 'British';
-- c) 각 레이싱 팀에 대해 각 팀에서 가장 나이가 어린 드라이버의 생일을 구하여라.
SELECT constructor, birthday FROM drivers WHERE birthday IN (SELECT max(birthday) FROM drivers GROUP BY constructor);
-- d) 독일 출신의 드라이버가 속한 레이싱 팀의 차체 높이의 평균을 구하라.
SELECT AVG(height) FROM constructors WHERE constructor IN (SELECT constructor FROM drivers WHERE country = 'German');
-- e) 그랑프리에서 우승을 한 적이 있는 레이싱 팀에 대해 각 레이싱 팀의 우승한 횟수를 구하여라.
SELECT constructor, COUNT(constructor) AS COUNT FROM results LEFT OUTER JOIN drivers on drivers.driver = results.driver WHERE race_rank = 'first place' GROUP BY constructor;
-- f) 적어도 2 명의 드라이버를 가지고 있으면서 우승을 한 적이 있는 레이싱 팀의 수를 구하여라.
SELECT COUNT(*) AS COUNT FROM (SELECT COUNT(*) FROM drivers AS B LEFT OUTER JOIN (SELECT DISTINCT drivers.driver, constructor, race_rank FROM results LEFT OUTER JOIN drivers ON drivers.driver = results.driver  WHERE race_rank ='first place') A ON A.constructor = B.constructor  GROUP BY B.constructor HAVING COUNT(A.constructor)>1) C;

-- g) 각 국가 별, 레이싱 팀에 속한 모든 드라이버의 평균 나이를 구하라. 한 국가에 속한 레이싱 팀이 하나 이상일 경우, 레이싱 팀별로 표시한다.
-- hint) TIMESTAMPDIFF 함수 사용
SELECT  drivers.constructor, constructors.country AS constructors_country, AVG(TIMESTAMPDIFF(YEAR, birthday, CURDATE())) AS age FROM drivers LEFT OUTER JOIN constructors ON constructors.constructor = drivers.constructor GROUP BY constructors_country, constructor ORDER BY constructors_country;

-- h) 각 그랑프리 별, 두 명 이상의 선수가 순위에 든 레이싱 팀을 구하라.
SELECT  race, constructor, drivers.driver FROM results LEFT OUTER JOIN drivers on drivers.driver=results.driver GROUP BY race HAVING COUNT(constructor)>1;