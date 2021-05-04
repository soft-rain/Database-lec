-- 8. 위의 데이터베이스 스키마를 기반으로 스키마 수정 (modification)을 관련된 다음의 SQL 쿼리를 작성하시오
-- e) 1-(a) 의 Constructors 릴레이션의 스키마로부터 races_entered 속성(attribute)을 삭제된 Constructors 릴레이션 으로 수정 (alteration)하라.
SELECT * FROM constructors;
ALTER TABLE constructors DROP races_entered;
SELECT * FROM constructors;

-- a) 1-(b) 의 Constructors 릴레이션의 스키마로부터 tire 속성을 포함하는 수정된 Constructors 릴레이션으로 수정(alteration)하라
-- ※ tire 속성의 값은 Korean Company이다
SELECT * FROM constructors;
ALTER TABLE constructors ADD tire varchar(30);
update constructors SET tire="Korean company";
SELECT * FROM constructors;

