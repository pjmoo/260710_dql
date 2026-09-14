# 🗂️ MySQL DQL 학습 및 SQLD 대비 저장소 (DQL & SQLD Study Repository)

<!-- workspace-readme-learning:start -->
## 파일과 연결한 학습 안내

아래 설명은 이 폴더의 실제 소스와 빌드 설정을 기준으로 정리했습니다. 기존 소개의 기능 설명은 연결된 파일과 함께 확인할 수 있습니다.

### 주요 파일과 역할

| 파일 | 역할과 읽을 내용 |
| --- | --- |
| [59409.sql](<59409.sql>) | 조회 또는 데이터 변경 SQL 실습 |
| [step1.sql](<step1.sql>) | 테이블·키·제약 조건 정의와 데이터 준비 SQL |
| [step2.sql](<step2.sql>) | 조회 또는 데이터 변경 SQL 실습 |
| [step3.sql](<step3.sql>) | 조회 또는 데이터 변경 SQL 실습 |
| [step4.sql](<step4.sql>) | 조회 또는 데이터 변경 SQL 실습 |
| [59409.md](<59409.md>) | 설계·학습·운영 내용을 설명하는 문서 |
| [step1.md](<step1.md>) | 설계·학습·운영 내용을 설명하는 문서 |
| [step2.md](<step2.md>) | 설계·학습·운영 내용을 설명하는 문서 |
| [step3.md](<step3.md>) | 설계·학습·운영 내용을 설명하는 문서 |
| [step4.md](<step4.md>) | 설계·학습·운영 내용을 설명하는 문서 |

### 실행과 설정 확인

- SQL 파일을 DB 클라이언트에서 읽고 스키마·실습 데이터·조회·변경 순서를 구분해 실행합니다. 변경 SQL의 대상은 같은 조건의 SELECT로 먼저 확인합니다.

### 관련 PDF와 보충 설명

- [7/10 강의](<../260629_ex/새 폴더/7-10/README.md>): SELECT·서브쿼리·JOIN의 결과와 논리적 처리 순서를 연결합니다.

이 링크는 구현을 이해하기 위한 관련 기초 자료입니다. 해당 강의가 이 저장소의 모든 기능이나 이후 버전의 API를 설명한다는 뜻은 아닙니다.

### 읽는 순서와 복습

- FROM·JOIN → WHERE → 그룹·집계 → 정렬 순으로 결과를 예상합니다. NULL·중복·매칭 없는 행과 집계 전후의 조건 차이를 확인합니다.

<!-- workspace-readme-learning:end -->

이 저장소는 MySQL 기준의 **DQL(Data Query Language, 데이터 질의어)** 기본기 확립과 **국가공인 SQLD(SQL 개발자) 자격시험** 대비를 위한 체계적인 학습 자료를 담고 있습니다. 데이터베이스 조회 기본 구문부터 비교/정렬, NULL 처리, 문자열 가공, 그리고 조건절 및 집계/그룹화까지 순차적으로 구성되어 있습니다.

---

## 1. 🗺️ 전체 학습 로드맵 및 파일 목록

각 학습 단계별 실습 SQL 소스 코드와 이론이 상세하게 기술된 가이드 문서의 링크 리스트입니다.

| 단계 | 주요 학습 주제 | 실습 소스 코드 (SQL) | 상세 가이드 문서 (Markdown) | SQLD 핵심 빈출 포인트 |
| :---: | :--- | :--- | :--- | :--- |
| **Step 1** | DQL 기초 및 조건절 | [step1.sql](<step1.sql>) | [step1.md](<step1.md>) | `AND`/`OR`/`NOT` 논리 연산자 우선순위 |
| **Step 2** | 연산자, 정렬 및 출력 제한 | [step2.sql](<step2.sql>) | [step2.md](<step2.md>) | `BETWEEN A AND B` 경계값 포함 여부, 다중 컬럼 정렬 |
| **Step 3** | NULL 처리 및 문자열 가공 | [step3.sql](<step3.sql>) | [step3.md](<step3.md>) | 3값 논리(UNKNOWN), `COALESCE`/`NULLIF` 표준 함수 작동 원리 |
| **Step 4** | 조건식, 집계 및 그룹화 | [step4.sql](<step4.sql>) | [step4.md](<step4.md>) | SQL 논리적 실행 순서, `WHERE` vs `HAVING`, NULL 집계 효과 |

---

## 2. 📝 단계별 핵심 내용 요약

### 🔹 [Step 1: DQL 기초 및 조건절](<step1.md>)
* **SELECT & FROM**: 특정 테이블의 데이터를 조회하고, `AS`를 이용해 가독성 있는 열 별칭을 부여하는 법을 학습합니다.
* **DISTINCT**: 특정 열의 중복 값을 필터링하여 유일한 종류의 데이터만 추출하는 방법을 배웁니다.
* **WHERE & 논리 연산자**: 관계 연산자(`=`, `>`, `<`, `>=` 등)와 논리 연산자(`AND`, `OR`, `NOT`)를 조합하여 데이터를 필터링합니다.
* **우선순위**: 논리 연산자의 내부 우선순위인 **`NOT` ➡️ `AND` ➡️ `OR`** 규칙과 괄호(`()`)를 통한 우선순위 변경의 중요성을 이해합니다.

### 🔹 [Step 2: 연산자, 정렬 및 출력 제한](<step2.md>)
* **BETWEEN A AND B**: 지정한 범위의 최솟값과 최댓값을 **포함**하는 구간 필터링의 원리를 학습합니다.
* **IN (목록)**: 특정 컬럼의 값이 여러 후보 값 중 하나와 일치하는지 판별하는 다중 동등 비교를 구현합니다.
* **LIKE (패턴 매칭)**: 와일드카드 문자 기호인 `%`(길이 제한 없는 모든 문자)와 `_`(정확히 1글자 공간 매치)의 활용법을 다룹니다.
* **ORDER BY**: 단일 또는 다중 정렬 기준(`ASC` 오름차순, `DESC` 내림차순)을 적용하여 데이터를 정돈합니다.
* **LIMIT**: MySQL 전용 출력 제한 문법으로, `LIMIT N, M`을 사용하여 페이징(Pagination) 처리를 물리적으로 구현합니다.

### 🔹 [Step 3: NULL 처리 및 문자열 가공](<step3.md>)
* **NULL 검증**: NULL은 0이나 공백 문자가 아닌 미지의 값이므로, `=` 비교가 아닌 `IS NULL` / `IS NOT NULL`로 검증해야 함을 인지합니다.
* **NULL 대체**: MySQL의 `IFNULL`과 표준 ANSI SQL 함수인 `COALESCE`, `NULLIF`의 구조적 차이와 활용법을 정리합니다.
* **문자열 가공**: `TRIM`(공백 제거), `LOWER`/`UPPER`(대소문자 통일), `SUBSTRING`(부분 문자 추출), `CONCAT`(문자 결합) 등의 내장 함수를 배웁니다.
* **3값 논리**: 참(TRUE), 거짓(FALSE) 외에 NULL 비교 시 산출되는 **`UNKNOWN`** 논리 상태의 동작 방식 및 `WHERE` 절과의 관계를 파악합니다.

### 🔹 [Step 4: 조건식, 집계 및 그룹화](<step4.md>)
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

<!-- pdf-til-supplement:start -->
## TIL 부연 설명 — PDF와 연결하기

기존 실습 내용을 이해하기 위한 PDF 기반 부연 설명이다. 아래 예시는 개념을 설명하기 위한 것이며, 이 프로젝트에서 실행해 관찰한 결과와는 구분한다. 페이지 번호는 표지를 포함한 PDF 순서다.

함께 읽을 파일: [59409.sql](<59409.sql>) · [step1.sql](<step1.sql>) · [step2.sql](<step2.sql>)

### SELECT를 쓰는 순서와 해석하는 순서

SQL은 원하는 결과를 선언하는 언어다. 이해를 위한 논리적 순서는 FROM·JOIN → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT로 볼 수 있다. 이는 DB가 실제로 수행하는 물리적 실행 계획과는 다르다. WHERE는 개별 행을, HAVING은 집계한 그룹을 거른다.

**예시로 이해하기:** 부서별 인원이 3명 이상인 부서를 찾는다면 부서로 그룹을 만든 뒤 HAVING COUNT(*) >= 3을 적용한다. NULL은 값이 없음을 나타내므로 = NULL 대신 IS NULL을 사용하고, COUNT(컬럼)은 NULL을 제외하지만 COUNT(*)는 행을 센다는 차이를 확인한다.

근거: 311-1 DQL — [15쪽](<../260629_ex/새 폴더/7-10/311-1_DQL.pdf#page=15>) · [21쪽](<../260629_ex/새 폴더/7-10/311-1_DQL.pdf#page=21>) · [22쪽](<../260629_ex/새 폴더/7-10/311-1_DQL.pdf#page=22>) · [23쪽](<../260629_ex/새 폴더/7-10/311-1_DQL.pdf#page=23>)

### JOIN으로 늘어나는 행과 EXISTS의 의미

JOIN은 연결 조건에 맞는 행 조합을 만든다. 한 회원에게 주문이 여러 개면 회원 정보도 여러 행에 반복될 수 있다. 존재 여부만 필요할 때는 EXISTS로 의도를 표현할 수 있다. LEFT JOIN은 대응 행이 없는 왼쪽 행도 남기지만 뒤 WHERE 조건이 그 행을 다시 제거할 수 있다.

**예시로 이해하기:** 주문이 없는 회원도 표시하려면 오른쪽 테이블의 필터를 ON과 WHERE 중 어디에 둘지 구분한다. 결과 행 수가 예상보다 많다면 DISTINCT부터 붙이기보다 1:N 관계와 조인 조건을 먼저 확인한다.

근거: 311-2 SubqueryJoin — [14쪽](<../260629_ex/새 폴더/7-10/311-2_SubqueryJoin.pdf#page=14>) · [20쪽](<../260629_ex/새 폴더/7-10/311-2_SubqueryJoin.pdf#page=20>) · [21쪽](<../260629_ex/새 폴더/7-10/311-2_SubqueryJoin.pdf#page=21>) · [30쪽](<../260629_ex/새 폴더/7-10/311-2_SubqueryJoin.pdf#page=30>)

<!-- pdf-til-supplement:end -->
