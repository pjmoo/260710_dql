# 🗂️ MySQL DQL 학습 및 SQLD 대비 저장소 (DQL & SQLD Study Repository)

이 저장소는 MySQL 기준의 **DQL(Data Query Language, 데이터 질의어)** 기본기 확립과 **국가공인 SQLD(SQL 개발자) 자격시험** 대비를 위한 체계적인 학습 자료를 담고 있습니다. 데이터베이스 조회 기본 구문부터 비교/정렬, NULL 처리, 문자열 가공, 그리고 조건절 및 집계/그룹화까지 순차적으로 구성되어 있습니다.

---

## 1. 🗺️ 전체 학습 로드맵 및 파일 목록

각 학습 단계별 실습 SQL 소스 코드와 이론이 상세하게 기술된 가이드 문서의 링크 리스트입니다.

| 단계 | 주요 학습 주제 | 실습 소스 코드 (SQL) | 상세 가이드 문서 (Markdown) | SQLD 핵심 빈출 포인트 |
| :---: | :--- | :--- | :--- | :--- |
| **Step 1** | DQL 기초 및 조건절 | [step1.sql](file:///Users/morgan/Documents/workspace/260710_dql/step1.sql) | [step1.md](file:///Users/morgan/Documents/workspace/260710_dql/step1.md) | `AND`/`OR`/`NOT` 논리 연산자 우선순위 |
| **Step 2** | 연산자, 정렬 및 출력 제한 | [step2.sql](file:///Users/morgan/Documents/workspace/260710_dql/step2.sql) | [step2.md](file:///Users/morgan/Documents/workspace/260710_dql/step2.md) | `BETWEEN A AND B` 경계값 포함 여부, 다중 컬럼 정렬 |
| **Step 3** | NULL 처리 및 문자열 가공 | [step3.sql](file:///Users/morgan/Documents/workspace/260710_dql/step3.sql) | [step3.md](file:///Users/morgan/Documents/workspace/260710_dql/step3.md) | 3값 논리(UNKNOWN), `COALESCE`/`NULLIF` 표준 함수 작동 원리 |
| **Step 4** | 조건식, 집계 및 그룹화 | [step4.sql](file:///Users/morgan/Documents/workspace/260710_dql/step4.sql) | [step4.md](file:///Users/morgan/Documents/workspace/260710_dql/step4.md) | SQL 논리적 실행 순서, `WHERE` vs `HAVING`, NULL 집계 효과 |

---

## 2. 📝 단계별 핵심 내용 요약

### 🔹 [Step 1: DQL 기초 및 조건절](file:///Users/morgan/Documents/workspace/260710_dql/step1.md)
* **SELECT & FROM**: 특정 테이블의 데이터를 조회하고, `AS`를 이용해 가독성 있는 열 별칭을 부여하는 법을 학습합니다.
* **DISTINCT**: 특정 열의 중복 값을 필터링하여 유일한 종류의 데이터만 추출하는 방법을 배웁니다.
* **WHERE & 논리 연산자**: 관계 연산자(`=`, `>`, `<`, `>=` 등)와 논리 연산자(`AND`, `OR`, `NOT`)를 조합하여 데이터를 필터링합니다.
* **우선순위**: 논리 연산자의 내부 우선순위인 **`NOT` ➡️ `AND` ➡️ `OR`** 규칙과 괄호(`()`)를 통한 우선순위 변경의 중요성을 이해합니다.

### 🔹 [Step 2: 연산자, 정렬 및 출력 제한](file:///Users/morgan/Documents/workspace/260710_dql/step2.md)
* **BETWEEN A AND B**: 지정한 범위의 최솟값과 최댓값을 **포함**하는 구간 필터링의 원리를 학습합니다.
* **IN (목록)**: 특정 컬럼의 값이 여러 후보 값 중 하나와 일치하는지 판별하는 다중 동등 비교를 구현합니다.
* **LIKE (패턴 매칭)**: 와일드카드 문자 기호인 `%`(길이 제한 없는 모든 문자)와 `_`(정확히 1글자 공간 매치)의 활용법을 다룹니다.
* **ORDER BY**: 단일 또는 다중 정렬 기준(`ASC` 오름차순, `DESC` 내림차순)을 적용하여 데이터를 정돈합니다.
* **LIMIT**: MySQL 전용 출력 제한 문법으로, `LIMIT N, M`을 사용하여 페이징(Pagination) 처리를 물리적으로 구현합니다.

### 🔹 [Step 3: NULL 처리 및 문자열 가공](file:///Users/morgan/Documents/workspace/260710_dql/step3.md)
* **NULL 검증**: NULL은 0이나 공백 문자가 아닌 미지의 값이므로, `=` 비교가 아닌 `IS NULL` / `IS NOT NULL`로 검증해야 함을 인지합니다.
* **NULL 대체**: MySQL의 `IFNULL`과 표준 ANSI SQL 함수인 `COALESCE`, `NULLIF`의 구조적 차이와 활용법을 정리합니다.
* **문자열 가공**: `TRIM`(공백 제거), `LOWER`/`UPPER`(대소문자 통일), `SUBSTRING`(부분 문자 추출), `CONCAT`(문자 결합) 등의 내장 함수를 배웁니다.
* **3값 논리**: 참(TRUE), 거짓(FALSE) 외에 NULL 비교 시 산출되는 **`UNKNOWN`** 논리 상태의 동작 방식 및 `WHERE` 절과의 관계를 파악합니다.

### 🔹 [Step 4: 조건식, 집계 및 그룹화](file:///Users/morgan/Documents/workspace/260710_dql/step4.md)
* **조건문**: `CASE WHEN ... THEN ... ELSE END` 형식의 Searched CASE 문과 Simple CASE 문, 그리고 MySQL 전용 `IF` 함수의 분기 처리 방법을 다룹니다.
* **집계 함수**: `COUNT`, `SUM`, `AVG`, `MAX`, `MIN`이 NULL 값을 무시하고 연산하는 물리적 과정과 빈 테이블 조회 시의 결과를 학습합니다.
* **GROUP BY & HAVING**: 데이터를 그룹으로 묶고, 그룹 통계치에 대해 필터링을 수행하는 `HAVING` 절의 구조를 익힙니다.
* **실행 순서**: RDBMS 옵티마이저가 쿼리를 파싱하는 물리적 흐름을 완벽히 정리합니다.

---

## 3. 🎯 프로그래머스 SQL 고득점 Kit 연계 추천 문제

현재 학습 범위(DQL 기초 ~ 조건문, 집계, 그룹화) 내에서 별도의 JOIN이나 서브쿼리 없이 풀 수 있는 대표적인 [프로그래머스 SQL 실습 문제](https://school.programmers.co.kr/learn/challenges?tab=sql_practice_kit) 리스트입니다.

### 1) SELECT (조회 및 정렬)
| 난이도 | 문제명 | 링크 | 핵심 학습 개념 | 추천 연계 단계 |
| :---: | :--- | :---: | :--- | :---: |
| **Lv. 1** | 모든 레코드 조회하기 | [바로가기](https://school.programmers.co.kr/learn/courses/30/lessons/59034) | `SELECT *`, `ORDER BY` 기본 정렬 | **Step 1** |
| **Lv. 1** | 아픈 동물 찾기 | [바로가기](https://school.programmers.co.kr/learn/courses/30/lessons/59036) | `WHERE` 동등 조건 필터링 | **Step 1** |
| **Lv. 1** | 역순 정렬하기 | [바로가기](https://school.programmers.co.kr/learn/courses/30/lessons/59035) | `ORDER BY DESC` 내림차순 정렬 | **Step 2** |
| **Lv. 1** | 여러 기준으로 정렬하기 | [바로가기](https://school.programmers.co.kr/learn/courses/30/lessons/59040) | 다중 컬럼 기준 정렬 (`ASC`, `DESC` 혼합) | **Step 2** |
| **Lv. 1** | 상위 n개 레코드 | [바로가기](https://school.programmers.co.kr/learn/courses/30/lessons/59405) | `ORDER BY`와 `LIMIT 1` 결합 | **Step 2** |

### 2) SUM, MAX, MIN & GROUP BY (집계 및 그룹화)
| 난이도 | 문제명 | 링크 | 핵심 학습 개념 | 추천 연계 단계 |
| :---: | :--- | :---: | :--- | :---: |
| **Lv. 1** | 최댓값 구하기 | [바로가기](https://school.programmers.co.kr/learn/courses/30/lessons/59415) | `MAX()` 집계 함수 | **Step 4** |
| **Lv. 1** | 최솟값 구하기 | [바로가기](https://school.programmers.co.kr/learn/courses/30/lessons/59038) | `MIN()` 집계 함수 | **Step 4** |
| **Lv. 2** | 동물 수 구하기 | [바로가기](https://school.programmers.co.kr/learn/courses/30/lessons/59406) | `COUNT(*)` 전체 행 집계 | **Step 4** |
| **Lv. 2** | 중복 제거하기 | [바로가기](https://school.programmers.co.kr/learn/courses/30/lessons/59408) | `COUNT(DISTINCT 컬럼)` 중복 제외 집계 | **Step 4** |
| **Lv. 2** | 고양이와 개는 몇 마리 있을까 | [바로가기](https://school.programmers.co.kr/learn/courses/30/lessons/59040) | `GROUP BY`를 활용한 그룹 집계 | **Step 4** |
| **Lv. 2** | 동명 동물 수 찾기 | [바로가기](https://school.programmers.co.kr/learn/courses/30/lessons/59041) | `GROUP BY`와 `HAVING COUNT(*) >= 2` | **Step 4** |
| **Lv. 2** | 진료과별 총 예약 횟수 출력하기 | [바로가기](https://school.programmers.co.kr/learn/courses/30/lessons/132202) | `GROUP BY` 결과 별칭 정렬 및 컬럼 정의 | **Step 4** |

### 3) IS NULL & String (NULL 및 문자열 가공)
| 난이도 | 문제명 | 링크 | 핵심 학습 개념 | 추천 연계 단계 |
| :---: | :--- | :---: | :--- | :---: |
| **Lv. 1** | 이름이 없는 동물의 아이디 | [바로가기](https://school.programmers.co.kr/learn/courses/30/lessons/59039) | `WHERE 컬럼 IS NULL` 조건식 | **Step 3** |
| **Lv. 1** | 이름이 있는 동물의 아이디 | [바로가기](https://school.programmers.co.kr/learn/courses/30/lessons/59407) | `WHERE 컬럼 IS NOT NULL` 조건식 | **Step 3** |
| **Lv. 1** | 경기도에 위치한 식품창고 목록 출력하기 | [바로가기](https://school.programmers.co.kr/learn/courses/30/lessons/131114) | `LIKE` 패턴 매칭 및 `IFNULL` 처리 | **Step 3** |
| **Lv. 2** | 루시와 엘라 찾기 | [바로가기](https://school.programmers.co.kr/learn/courses/30/lessons/59046) | `WHERE 컬럼 IN (값 목록)` 비교 | **Step 2** |
| **Lv. 2** | 이름에 el이 들어가는 동물 찾기 | [바로가기](https://school.programmers.co.kr/learn/courses/30/lessons/59047) | `LIKE '%el%'` 패턴 조건 및 정렬 | **Step 2** |
| **Lv. 2** | 중성화 여부 파악하기 | [바로가기](https://school.programmers.co.kr/learn/courses/30/lessons/59409) | `CASE WHEN` 또는 `IF` 조건문 분기 처리 | **Step 4** |
| **Lv. 2** | 카테고리 별 상품 개수 구하기 | [바로가기](https://school.programmers.co.kr/learn/courses/30/lessons/131529) | `SUBSTRING`으로 문자 추출 후 `GROUP BY` | **Step 3 & 4** |

---

## 4. 🎓 SQLD 자격증 시험 핵심 대비 노트 (필수 암기)

국가공인 SQLD 시험 합격을 위해 꼭 기억해야 할 **최빈출 이론 탑 3**입니다.

1. **SQL 논리적 실행 순서와 SELECT 별칭 사용 규칙**
   * **실행 순서**: `FROM ➡️ WHERE ➡️ GROUP BY ➡️ HAVING ➡️ SELECT ➡️ ORDER BY`
   * **암기 포인트**: `SELECT`는 `GROUP BY`나 `HAVING`보다 나중에 실행되므로, `SELECT`에서 정의한 컬럼 별칭(Alias)은 `GROUP BY`나 `HAVING` 절에서 참조할 수 없는 것이 원칙입니다.
2. **집계 함수와 NULL의 연산 법칙**
   * **개념**: `COUNT(*)`를 제외한 모든 집계 함수는 `NULL`을 연산 대상에서 자동으로 제외합니다.
   * **에러 방지**: `SUM(A + B)`는 개별 행 연산 시 한쪽 컬럼이라도 NULL이면 최종 합산에서 아예 제외되는 반면, `SUM(A) + SUM(B)`는 NULL을 제외한 각각의 합계를 구한 후 더하므로 값이 달라질 수 있습니다.
3. **3값 논리 (3-Valued Logic)**
   * **원리**: SQL에서 `NULL = NULL`이나 `NULL != NULL` 같은 연산의 평가는 참/거짓이 아닌 **`UNKNOWN`**이 됩니다.
   * **검증**: `WHERE` 조건절은 오직 참(`TRUE`)인 행만 필터링하여 반환하므로, NULL인지 판단하려면 반드시 **`IS NULL`** 또는 **`IS NOT NULL`** 연산자를 사용해야 합니다.
