-- 5) 위의 데이터베이스 스키마를 기반으로 subquery를 포함하는 다음의 SQL 쿼리를 작성하라. 각 문제의 답에 적어도 하나 이상의 subquery를 사용하여야 하고 각 문제의 쿼리는 다른 문제의 쿼리와 다른 방법으로 작성하시오. (예. 각 방법은 EXISTS, IN, ALL, SOME 그리고 ANY와 같은 다른 집합 연산자들을 사용해야 하고 NOT을 같이 사용할 수도 있다)

-- 5-a) 그랑프리에 가장 많이 참가한 레이싱 팀을 소유한 나라(country)를 찾아라.
SELECT country FROM constructors WHERE races_entered = all (SELECT max(races_entered) FROM constructors);

-- 5-b) 그랑프리에서 적어도 한번은 우승을 한 드라이버가 소속된 레이싱 팀을 찾아라.
SELECT constructor FROM drivers WHERE driver = any (SELECT driver FROM results WHERE race_rank ='first place');

-- 5-c) Mercedes 엔진을 사용하는 드라이버들의 이름을 찾아라.
SELECT driver FROM drivers WHERE constructor IN (SELECT constructor FROM constructors WHERE engine = 'Mercedes');

-- 5-d) Ferrari 레이싱 팀의 드라이버들이 참가한 그랑프리를 찾아라.
SELECT race FROM results WHERE EXISTS (SELECT * FROM drivers WHERE constructor = 'Ferrari' AND results.driver = drivers.driver);

-- 5-e) 차체의 높이는 같으나 다른 팀의 차체보다 너비가 넓은 차체를 사용하는 드라이버들의 이름을 찾아라
SELECT driver FROM drivers WHERE constructor = some (SELECT DISTINCT a.constructor FROM constructors AS a, constructors AS b WHERE ((a.height = b.height) AND (a.width > b.width)));
