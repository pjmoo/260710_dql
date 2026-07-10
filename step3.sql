-- NULL과 문자열 처리
SELECT * FROM sales_records;

-- NULL 탐지
SELECT
    sale_id,
    product_id,
    discount
FROM sales_records;

SELECT
    sale_id,
    product_id,
    discount
FROM sales_records
-- NULL은 비교 시 무조건 false
WHERE discount = NULL;

SELECT
    sale_id,
    product_id,
    discount
FROM sales_records
-- 비교가 아니라 '검증'은 가능하다
WHERE discount IS NULL;

SELECT
    sale_id,
    product_id,
    discount
FROM sales_records
-- WHERE NOT discount IS NULL;
-- WHERE NOT (discount IS NULL);
WHERE discount IS NOT NULL;
-- WHERE (discount IS NOT NULL);

SELECT
    sale_id,
    discount,
    -- MySQL 계열이 쓰는 내장함수
    IFNULL(discount, 0.00) AS 'IFNULL-discount',
    IFNULL(discount, 'X') AS 'IFNULL-discount2',
    COALESCE(discount, 0.00) AS 'COALESCE-discount'
-- 연합, 합성, 유착... -> NULL 일 경우에 적용해줄 default 값을 적용하는 표준 함수
FROM sales_records;
-- 이 자체는 테이블이 아니고, 읽기 전용 복사본.
-- INSERT, UPDATE 에는 테이블 타입이 중요 (테이블의 '제약조건')

-- 문자열 가공
SELECT
    *
FROM
    products, sales_records
WHERE
    products.product_id = sales_records.product_id;

SELECT
    product_name,
    customer_email,
    TRIM(customer_email) AS '공백제거 이메일',
    LOWER(customer_email) AS '소문자 이메일',
    UPPER(customer_email) AS '대문자 이메일',
	-- 다중으로 처리
    LOWER(TRIM(customer_email)) AS '공백제거 후 소문자 이메일',
	-- ...(추출할 문자열, 시작지점, 갯수)
    SUBSTRING(customer_email, 1, 4) AS '부분 문자열 추출',
    SUBSTRING(TRIM(customer_email), 1, 4) AS '공백제거 후 부분 문자열 추출',
FROM
    products, sales_records
WHERE
    products.product_id = sales_records.product_id;

SELECT
    product_name,
    customer_email,
    -- MySQL 숫자형 자료형만 더하기 허용
    -- product_name + ' ' + customer_email X (코딩 방식 X)
    -- product_name & ' ' & customer_email X (엑셀 방식 X)
    -- || 로 텍스트를 연결 (설정으로 끄고 킴) - pipeline
    product_name || ' ' || TRIM(customer_email),
    CONCAT(product_name, ' ', TRIM(customer_email)),
    -- 맨 앞에 Word Seperator (구분자) 를 넣으면 해당 구분자로 결합
    CONCAT_WS('-', product_name, TRIM(customer_email))
-- GROUP_CONCAT -> GROUP BY 특정 그룹을 CONCAT
FROM
    products, sales_records
WHERE
    products.product_id = sales_records.product_id;