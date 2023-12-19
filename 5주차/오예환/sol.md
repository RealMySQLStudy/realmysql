<aside>
💡 프로그래머스 레벨 1 다 풀기

</aside>

- 동물의 아이디와 이름
  https://school.programmers.co.kr/learn/courses/30/lessons/59403
  ```jsx
  SELECT ANIMAL_ID, NAME FROM ANIMAL_INS
  ORDER BY ANIMAL_ID
  ```
- 어린 동물 찾기
  https://school.programmers.co.kr/learn/courses/30/lessons/59037
  ```sql
  SELECT ANIMAL_ID, NAME FROM ANIMAL_INS
  WHERE INTAKE_CONDITION != "Aged"
  ORDER BY ANIMAL_ID
  ```
- 역순 정렬하기
  https://school.programmers.co.kr/learn/courses/30/lessons/59035
  ```sql
  SELECT NAME, DATETIME FROM ANIMAL_INS
  ORDER BY ANIMAL_ID DESC
  ```
- 아픈 동물 찾기
  https://school.programmers.co.kr/learn/courses/30/lessons/59036
  ```sql
  SELECT ANIMAL_ID, NAME FROM ANIMAL_INS
  WHERE INTAKE_CONDITION = "Sick"
  ORDER BY ANIMAL_ID
  ```
- 나이 정보가 없는 회원 수 구하기
  https://school.programmers.co.kr/learn/courses/30/lessons/131528
  ```sql
  SELECT COUNT(*) AS USERS  FROM USER_INFO
  WHERE AGE IS NULL;
  ```
- 강원도에 위치한 생산 공장 목록 출력하기
  [https://www.notion.so/oyeh/5-SQL-48fbfae88e154f51a30656fc423ff99f](https://www.notion.so/5-SQL-48fbfae88e154f51a30656fc423ff99f?pvs=21)
  ```sql
  SELECT FACTORY_ID, FACTORY_NAME, ADDRESS FROM FOOD_FACTORY
  WHERE ADDRESS REGEXP '강원도'
  ```
- 경기도에 위치한 식품창고 목록 출력하기
  https://school.programmers.co.kr/learn/courses/30/lessons/131114
  ```sql
  SELECT WAREHOUSE_ID, WAREHOUSE_NAME, ADDRESS, IFNULL(FREEZER_YN, 'N') AS FREEZER_YN FROM FOOD_WAREHOUSE
  WHERE ADDRESS REGEXP '경기도'
  ORDER BY WAREHOUSE_ID ASC
  ```
  - **SELECT 문에서 NULL 값 치환하기을 배웠다.**
    IFNULL(칼럼명, 대체값)
- 흉부외과 또는 일반외과 의사 목록 출력하기

  https://school.programmers.co.kr/learn/courses/30/lessons/132203

  ```sql
  SELECT DR_NAME, DR_ID, MCDP_CD, DATE_FORMAT(HIRE_YMD, '%Y-%m-%d') AS HIRE_YMD FROM DOCTOR
  WHERE MCDP_CD = "CS" OR MCDP_CD = "GS"
  ORDER BY HIRE_YMD DESC, DR_NAME ASC
  ```

  - DATE_FORMAT 맨날 까먹는다;;;
  - yy-mm-dd hh-mm-ss → yy-mm-dd로

- 조건에 맞는 회원수 구하기
  https://school.programmers.co.kr/learn/courses/30/lessons/131535
  ```sql
  SELECT COUNT(*) AS USERS FROM USER_INFO
  WHERE ('2021-01-01' <= JOINED AND JOINED < '2022-01-01')
  AND (20 <= AGE AND AGE < 30)
  ```
- 조건에 맞는 도서 리스트 출력하기
  https://school.programmers.co.kr/learn/courses/30/lessons/144853
  ```sql
  SELECT BOOK_ID, DATE_FORMAT(PUBLISHED_DATE, "%Y-%m-%d") AS PUBLISHED_DATE FROM BOOK
  WHERE ("2021-01-01" <= PUBLISHED_DATE AND PUBLISHED_DATE < "2022-01-01") AND CATEGORY = "인문"
  ORDER BY PUBLISHED_DATE ASC
  ```
  - DATE_FORMAT 사용시 소문자 y 를 쓰면 21년 , 20년 뒤에 두자리만 표시되고
  - 대문자 Y 를 사용하면 2021년 , 2020년 4자리가 표시된다.. → 몰랐음
- 평균 일일 대여 요금 구하기
  https://school.programmers.co.kr/learn/courses/30/lessons/151136
  ```sql
  SELECT ROUND(AVG(DAILY_FEE),0) AS AVERAGE_FEE FROM CAR_RENTAL_COMPANY_CAR
  WHERE CAR_TYPE = "SUV"
  ```
- 과일로 만든 아이스크림 고르기
  https://school.programmers.co.kr/learn/courses/30/lessons/133025
  ```sql
  SELECT F.FLAVOR FROM FIRST_HALF AS F JOIN ICECREAM_INFO AS I
  ON F.FLAVOR = I.FLAVOR
  WHERE I.INGREDIENT_TYPE = "fruit_based" AND F.TOTAL_ORDER > 3000;
  ```
- 특정 옵션이 포함된 자동차 리스트 구하기
  https://school.programmers.co.kr/learn/courses/30/lessons/157343
  ```sql
  SELECT * FROM CAR_RENTAL_COMPANY_CAR
  WHERE OPTIONS REGEXP "네비게이션"
  ORDER BY CAR_ID DESC
  ```
- 자동차 대여 기록에서 장기/단기 대여 구분하기
  https://school.programmers.co.kr/learn/courses/30/lessons/151138
  ```sql
  SELECT HISTORY_ID, CAR_ID, DATE_FORMAT(START_DATE, "%Y-%m-%d") as START_DATE,
  DATE_FORMAT(END_DATE, "%Y-%m-%d") as END_DATE,
  IF(DATEDIFF(END_DATE, START_DATE) + 1 >= 30, "장기 대여", "단기 대여") as RENT_TYPE
  FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
  WHERE "2022-09-01" <= START_DATE AND START_DATE < "2022-10-01"
  ORDER BY HISTORY_ID DESC
  ```
