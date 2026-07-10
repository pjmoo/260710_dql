# SQL 주석 1
-- SQL 주석 2
SELECT now(); # 현재 DB 시간
SELECT 1 + 1; # 연산된 결과를 바로 보여줌
# SELECT 1 + 1 FROM DUAL; # 간단한 연산용 가상테이블인 DUAL은 굳이 입력 안해도 붙음

# DB 만들기는 생략
# TABLE 만들기 - Record와 유사한데, table을 기준으로 데이터를 조회한다는 차이점
CREATE TABLE products (
                          product_id INT AUTO_INCREMENT PRIMARY KEY,
                          # 식별자 - 다른 product과 확실히 다른 값. -> 유일하게 호출 가능
    product_name VARCHAR(100) NOT NULL, # 가변문자
                              category CHAR(15) NOT NULL, # 고정문자
                              price DECIMAL(10, 2) NOT NULL DEFAULT 0.00, # 실수
                              stock_quantity INT NOT NULL DEFAULT 0 # 정수
);
# 쿼리는 ;으로 끝이남.
# cmd(ctrl) + enter

CREATE TABLE sales_records (
                               sale_id INT AUTO_INCREMENT PRIMARY KEY,
                               product_id INT NOT NULL,
                               sale_date DATE NOT NULL, # 날짜형
                                   quantity INT NOT NULL,
                               unit_price DECIMAL(10, 2) NOT NULL,
                               discount DECIMAL(5, 2) DEFAULT NULL,
                               customer_email VARCHAR(100) DEFAULT NULL
);
# 세미콜론에 맞춰서 ctrl(cmd) + enter

INSERT INTO products (
	product_id, product_name, category, price, stock_quantity)
VALUES
(1, '아이폰 15', 'Electronics', 1250000.00, 50),
(2, '갤럭시 S24', 'Electronics', 1150000.00, 45),
(3, '기계식 키보드', 'Accessories', 150000.00, 100),
(4, '무선 마우스', 'Accessories', 89000.00, 120),
(5, '가죽 여권 지갑', 'Fashion', 45000.00, 30),
(6, '노이즈캔슬링 헤드폰', 'Electronics', 350000.00, 15),
(7, '머그컵', 'Living', 15000.00, 10),
(8, '친환경 에코백', 'Fashion', 25000.00, 80);

INSERT INTO sales_records (
    product_id, sale_date, quantity, unit_price, discount, customer_email)
VALUES
    (1, '2026-07-01', 2, 1250000.00, NULL, '  user1@gmail.com  '),
    (2, '2026-07-01', 1, 1150000.00, 0.10, 'USER2@naver.com'),
    (3, '2026-07-02', 3, 150000.00, 0.05, '   user3@daum.net'),
    (4, '2026-07-02', 5, 89000.00, NULL, 'user4@gmail.com'),
    (1, '2026-07-03', 1, 1250000.00, 0.15, '  USER5@GMAIL.COM '),
    (5, '2026-07-04', 2, 45000.00, NULL, NULL),
    (6, '2026-07-05', 1, 350000.00, 0.05, 'user6@outlook.com'),
    (2, '2026-07-05', 2, 1150000.00, NULL, '  user2@naver.com');

-- SELECT
# 모든 컬럼 조회 -> 별도 제약이 없으면 모든 행을 조회 (특정 테이블에 속한)
SELECT * FROM products;
# 특정 열을 이름으로 선택
SELECT product_id, product_name, price FROM products;
# 열 선택 후, 열에 대해 alias(별칭)을 지정
SELECT
    product_id AS '상품ID',
    product_name AS '상품명',
    price AS '판매가'
FROM
    products;

# 중복 행 제거
SELECT category FROM products;
SELECT DISTINCT category FROM products;

# 특정 조건을 만족하는 행만 표시
# - 특정 열의 값이 내가 지정하는 조건을 충족시키는 행들만 남기기
# - 어떤 열에 어떤 값을 걸러낼 거지? (어디? WHERE)
SELECT product_name, price # 어떤 열을
FROM products; # 어떤 테이블로부터

# 걸러내기
SELECT product_name, price # 어떤 열을
FROM products # 어떤 테이블로부터
# 어떤 조건을 만족시키는 행만 선택할 것이냐?
WHERE price > 100000;

# 다중 조건 / 논리 연산자 - AND, OR, NOT
SELECT product_name, category, price
FROM products;
SELECT product_name, category, price
FROM products
-- WHERE category == 'Electronics';
WHERE category = 'Electronics';

# AND
SELECT product_name, category, price
FROM products
WHERE category = 'Electronics'
  AND price >= 500000;
# OR
SELECT product_name, category, price
FROM products
WHERE category = 'Electronics'
   OR price >= 100000;
# 실행 순서
SELECT product_name, category, price, stock_quantity
FROM products
WHERE category = 'Electronics'
  AND price >= 500000
    # (category = 'Electronics' AND price >= 500000)
OR stock_quantity >= 100;

SELECT product_name, category, price, stock_quantity
FROM products
WHERE category = 'Electronics'
    # OR (stock_quantity >= 100 AND price >= 500000)
OR stock_quantity >= 100
AND price >= 500000;
# AND, OR은 실행 순서 조정을 위해 ()를 사용할 수 있음 - 잘 모르겠다 -> () 필수.
# AND 를 기준으로 앞 뒤 ()를 해주면.

SELECT product_name, category, price, stock_quantity
FROM products
WHERE NOT category = 'Electronics'; # 반전 -> 그리고 가장 우선순위가 높음

SELECT product_name, category, price, stock_quantity
FROM products
WHERE category = 'Electronics'
   OR NOT stock_quantity >= 100
    AND price >= 500000;
# NOT -> AND -> OR