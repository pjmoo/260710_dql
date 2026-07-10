-- 조건식
SELECT
    product_name,
    price,
    stock_quantity
FROM
    products;

SELECT
    product_name,
    price,
    stock_quantity,
    -- '등급' AS '제품등급'
    -- 평가식을 각각 가져가는 CASE
    CASE
        WHEN price >= 1000000 THEN '프리미엄'
        WHEN price >= 100000 THEN '미드레인지'
        ELSE '보급형'
        END
    -- 조건 만족 X -> NULL
    AS '제품등급',
    CASE
        WHEN stock_quantity = 0 THEN '품절'
        WHEN stock_quantity <= 20 THEN '품절 임박'
        ELSE '여유'
        END
    AS '재고상태',
    category,
    -- Electronics, Accessories, Fashion, Living
    -- 일치를 보는 문법
    CASE category
        WHEN 'Electronics' THEN 'John'
        WHEN 'Accessories' THEN 'Jane'
        ELSE 'Chris'
        END
    AS '담당직원',
	-- 1가지 조건이 메인이라면
    IF(product_name LIKE '%아이폰%', '애플',
       IF(product_name LIKE '%갤럭시%', '삼성', '삼성 아닌 것'))
    AS '제조사'
FROM
    products;

-- 집계함수
SELECT
    *
FROM products;

SELECT
    COUNT(*), -- 8
    COUNT(discount), -- 4 (count는 null 빼고 셈)
    COUNT(DISTINCT discount) -- 3 (null 빼고 고유값을 센다)
FROM sales_records;

-- 집계의 기준 -> 아무것도 안하면 전체 테이블.
-- group by -> 그룹을 나누면 해당 그룹별 집계값을 받을 수 있음
SELECT
    COUNT(*), -- 겹치지 않는 행
    COUNT(category), -- 열에 속한 데이터를 셈 (null 빼고)
    COUNT(DISTINCT category), -- 안 겹치는 열을 셈
    SUM(stock_quantity), -- 합산
    AVG(price), -- 평균
    MAX(price), -- 최대
    MIN(price)  -- 최소
FROM products;