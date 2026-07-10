-- 중성화 여부 파악하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/59409

-- ANIMAL_INS
SELECT * FROM ANIMAL_INS;
-- DESC ANIMAL_INS; -- DESCRIBE;
-- 보호소의 동물이 중성화되었는지 아닌지 파악
-- SEX_UPON_INTAKE -> Neutered / Spayed
SELECT *
FROM ANIMAL_INS
WHERE SEX_UPON_INTAKE LIKE '%Neutered%'
   OR SEX_UPON_INTAKE LIKE '%Spayed%';
-- 포함여부가 중요하지 않고, 있으면 O, 없으면 X.
SELECT
    ANIMAL_ID,
    NAME,
    'O' AS '중성화'
FROM ANIMAL_INS;

SELECT
    ANIMAL_ID,
    NAME,
    CASE
        WHEN
            SEX_UPON_INTAKE LIKE '%Neutered%'
                OR SEX_UPON_INTAKE LIKE '%Spayed%'
            THEN 'O'
        ELSE 'X'
        END
    AS '중성화'
FROM ANIMAL_INS;

SELECT
    ANIMAL_ID,
    NAME,
    IF(
            SEX_UPON_INTAKE LIKE '%Neutered%' OR SEX_UPON_INTAKE LIKE '%Spayed%', -- WHEN
            'O', -- THEN
            'X' -- ELSE
    )
    AS '중성화'
FROM ANIMAL_INS;