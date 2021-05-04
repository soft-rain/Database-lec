-- 7. 위의 데이터베이스 스키마를 기반으로 수정(modification)을 포함하는 다음의 SQL 쿼리를 작성하시오. 수정된 릴레이션의 릴레이션이 수정되기 전과 후의 결과(select * …)를 보여라. 스크립트는 릴레이션 수정 전의 결과를 보여야 하고 문제의 SQL을 실행시키고, 릴레이션 수정 후의 결과를 보여야 한다. 각 하위문제는 하나씩 수행되어야 한다.(즉, 각 하위문제를 수행한 후에 데이터베이스를 초기화할 필요가 없다.)

-- a) BMW Sauber 레이싱 팀에 두 명의 드라이버 Russell와 Villeneuve를 영입하였다. 영국 출신(British)의 Russell의 생년월일은 15/02/1998이다. 캐나다 출신(Canadian)의 Villeneuve의 생년월일은 09/04/1971 이다. 이러한 사실을 데이터베이스에 삽입하라.
SELECT * FROM drivers;
INSERT INTO drivers VALUES ("Russell", STR_TO_DATE("15/02/1998", '%d/%m/%Y'), 'British', 'BMW Sauber');
INSERT INTO drivers VALUES ("Villeneuve", STR_TO_DATE("09/04/1971", '%d/%m/%Y'), 'Canadian', 'BMW Sauber');
SELECT * FROM drivers;

-- b) 스위스 Swiss에서 새로운 레이싱 팀 Sauber가 만들고 독일 출신의 Frentzen 를 영입했다. Frentzen은 1967 년 5 월 18 일이 생일이며 Mercedes 엔진을 사용하고 차체의 높이와 너비는 각각 93 센티와 180 센티이다. 이러한 사실을 데이터베이스에 삽입하라.
SELECT * FROM constructors;
SELECT * FROM drivers;
INSERT INTO constructors VALUES ('Sauber', 'Swiss', 'Mercedes', NULL, 93, 180);
INSERT INTO drivers VALUES('Frentzen', '1967-05-18', 'German', 'Sauber');
SELECT * FROM constructors;
SELECT * FROM drivers;
-- c) 아시아 지역의 그랑프리에서 3 등을 차지한 모든 드라이버들을 Drivers 릴레이션에서 삭제하라. 해당 드라이버의 경기 기록도 삭제한다.
-- Hint) 데이터를 저장하기 위한 새로운 테이블을 만들 수 있다.
SELECT * FROM drivers;
SELECT * FROM results;

CREATE TABLE new_result
(
    driver varchar(30) NOT NULL,
    race varchar(30),
    PRIMARY KEY(driver)
);
describe new_result;

INSERT INTO new_result (SELECT driver, race FROM results WHERE race IN (SELECT Name FROM races WHERE area = 'Asia') AND and race_rank = 'third place');
delete FROM results WHERE race IN (SELECT race FROM new_result);
delete FROM drivers WHERE driver IN (SELECT driver FROM new_result);

SELECT * FROM drivers;
SELECT * FROM results;


-- d) 차체의 높이와 너비를 인치 (one inch = 2.5 로 측정 되도록 Constructors 릴레이션을 수정하라.
SELECT * FROM constructors;
update constructors SET height = height*2.5, width=width*2.5;
SELECT * FROM constructors;

-- e) Honda 엔진을 사용하는 모든 드라이버는 그랑프리에서 기권을 한다. Results 릴레이션을 수정하라.
-- ※ 기권은 race_rank 를 drop out 로 표현한다.
SELECT * FROM results;
update results LEFT OUTER JOIN drivers ON drivers.driver = results.driver LEFT OUTER JOIN constructors ON constructors.constructor = drivers.constructor SET race_rank = 'drop out' WHERE engine = 'Honda';
SELECT * FROM results;


-- f) 드라이버를 두 명 이상 가지고 있는 모든 레이싱 팀의 드라이버를 삭제하라 해당 드라이버의 경기 기록도 삭제한다
-- Hint) 데이터를 저장하기 위한 새로운 테이블을 만들 수 있다
SELECT * FROM drivers;
SELECT * FROM results;

CREATE TABLE constructors2
(
    constructor varchar(30) NOT NULL,
    PRIMARY KEY(constructor)
);
describe constructors2;

CREATE TABLE drivers2
(
    driver varchar(30) NOT NULL,
    PRIMARY KEY(driver)
);
describe drivers2;

INSERT INTO constructors2 (SELECT constructor FROM drivers GROUP BY constructor HAVING count(drivers.driver)>1);
INSERT INTO drivers2 (SELECT driver FROM drivers WHERE constructor IN (SELECT * FROM constructors2));

delete FROM results WHERE driver IN (SELECT driver FROM drivers2);
delete FROM drivers WHERE driver IN (SELECT * FROM drivers2);

SELECT * FROM drivers;
SELECT * FROM results;