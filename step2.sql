-- 연산자 (Operator)
SELECT * FROM products;
SELECT
    product_name,
    price
FROM
    products;

-- 사칙연산, 비교연산 다 지원 (== X, = O)
-- ||, &&, ! (x) -> or, and, not
-- 소문자 써도 된다 but 연산자, 키워드 계열은 대문자로 써야 안 헷갈림
-- 키워드/연산자/기능 -> 대문자(SELECT)
-- 컬럼 이름 -> 소문자(product) / 테이블? -> SNAKE_CASE or PascalCase
-- DB/서버를 연동 -> User -> 클래스/객체
-- 실습 시 헷갈림 방지를 위해서 우리가 직접 입력하는 속성명, 테이블은 소문자
-- SQL이 정해준 것은 대문자로 입력.

-- 범위 지정 연산자
SELECT
    product_name,
    price
FROM
    products
WHERE
    price >= 89000 AND price <= 150000;
-- BETWEEN A AND B (시작점 및 끝점을 포함)
SELECT
    product_name,
    price
FROM
    products
WHERE
-- 범위를 배울 경우 시작점(대부분포함) / 끝점이 본인들 맘대로.
price BETWEEN 89000 AND 150000;

-- 목록 내 비교 (일치/동등 검증) 연산자 (IN)
SELECT
    product_name,
    category,
    price
FROM
    products;

SELECT
    product_name,
    category,
    price
FROM
    products
WHERE
   -- SQL 엔진/툴마다 작동 방식이 다르긴 한데, ''가 대표적으로 문자/문자열 입력
    category = 'Electronics'
   OR category = 'Accessories';

SELECT
    product_name,
    category,
    price
FROM
    products
WHERE
    category IN ('Electronics', 'Accessories');

# 패턴 매칭 연산자
SELECT
    product_name,
    price
FROM
    products;

-- 이런 걸로는 마우스를 '포함'하는 것을 찾을 수 없음
SELECT
    product_name,
    price
FROM
    products
WHERE
    product_name = '마우스';

SELECT
    product_name,
    price
FROM
    products
WHERE
    -- Wildcard : % (갯수 상관 X), _ (_의 개수만큼 매칭)
    -- product_name LIKE '%마우스%';
    -- product_name LIKE '아이폰%'
    product_name LIKE '%헤드폰';

SELECT
    product_name,
    price
FROM
    products
WHERE
    -- product_name LIKE '%폰%';
    -- product_name LIKE '__폰%';
    product_name LIKE '아이%15';

-- 결과 정렬 (Order By)
SELECT
    product_name,
    category,
    price
FROM
    products;
-- 특정 열(들)을 정해서 정렬
-- 오름차순 : 데이터 등장/나열하는 순서가 내가 설정한 순서와 일치
-- 내림차순 : (...) 순서가 내가 설정한 순서와 (완전) 반대
-- 내가 설정한 순서 -> (비교시) 크기 순서
-- asc/ending (일반적인 순서를 따라감)
-- desc/ending (역으로)
SELECT
    product_name,
    category,
    price
FROM
    products
-- WHERE...
ORDER BY price; -- ASC

SELECT
    product_name,
    category,
    price
FROM
    products
-- WHERE...
ORDER BY price ASC; -- DEFAULT라서 안붙여도...

SELECT
    product_name,
    category,
    price
FROM
    products
-- WHERE...
ORDER BY price DESC;

SELECT
    product_name,
    category,
    price
FROM
    products
-- 문자도 정렬 가능
-- ORDER BY category DESC, price ASC;
ORDER BY price ASC, category DESC;

-- 출력 행 수 제한 (limit) <- mysql only (offset)
SELECT
    product_name,
    category,
    price
FROM
    products
ORDER BY price ASC, category DESC
-- LIMIT 1;
-- LIMIT 5;
    LIMIT 0, 5; -- 0, (디폴트)

SELECT
    product_name,
    category,
    price
FROM
    products
ORDER BY price ASC, category DESC
    LIMIT 1, 5;
-- 시작점, 끝점을 파악해야함
-- 앞에서부터 n번 이동한다음, m개를 조회하겠다
-- LIMIT N, M