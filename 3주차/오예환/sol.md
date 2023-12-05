### Level 1

- 가장 비싼 상품 구하기

  https://school.programmers.co.kr/learn/courses/30/lessons/131697

  ```sql

  SELECT MAX(PRICE) as MAX_PRICE FROM PRODUCT
  ```

- 최대값 구하기
  https://school.programmers.co.kr/learn/courses/30/lessons/59415
  ```sql
  SELECT MAX(DATETIME) as TIME FROM ANIMAL_INS
  ```
- 12세 이하인 여자 환자 목록 출력하기

  https://school.programmers.co.kr/learn/courses/30/lessons/132201

  ```sql
  SELECT PT_NAME, PT_NO, GEND_CD, AGE, IFNULL(TLNO, 'NONE') as TLNO
  FROM PATIENT
  WHERE AGE <= 12 AND GEND_CD = 'W'
  ORDER BY AGE DESC, PT_NAME ASC
  ```

  - IFNULL 을 몰랐음
  - 여자만 뽑아야하는데 이부분을 간과했음..
  - 환자번호랑 환자이름을 순서를 바꿔서 출력해서 고생했슴…

- 이름이 없는 동물의 아이디
  https://school.programmers.co.kr/learn/courses/30/lessons/59039
  ```sql
  SELECT ANIMAL_ID FROM ANIMAL_INS
  WHERE NAME IS NULL
  ```
- 인기있는 아이스크림
  https://school.programmers.co.kr/learn/courses/30/lessons/133024
  ```sql
  SELECT FLAVOR FROM FIRST_HALF
  ORDER BY TOTAL_ORDER DESC, SHIPMENT_ID ASC
  ```

### Level 2

- 자동차 평균 대여 기간 구하기

  https://school.programmers.co.kr/learn/courses/30/lessons/157342

  ```sql
  SELECT CAR_ID, ROUND(AVG(TIMESTAMPDIFF(DAY, START_DATE, END_DATE)) + 1,1) as AVERAGE_DURATION
  FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
  GROUP BY CAR_ID
  HAVING AVERAGE_DURATION >= 7
  ORDER BY AVERAGE_DURATION DESC, CAR_ID DESC
  ```

  - TIMESTAMPDIFF에 대해서 배웠습니다.
  - ROUND는 반올림이며 두번째인자에 들어가는 자릿수까지 반올림이 됩니다.
  - WHERE이 아니라 HAVING절임을 알았습니다.
  - +1을 안해줘서 개고생했습니다.

- 조건에 부합하는 중고거래 상태 조회하기

  https://school.programmers.co.kr/learn/courses/30/lessons/164672

  ```sql
  SELECT BOARD_ID, WRITER_ID, TITLE, PRICE,
  CASE
      WHEN STATUS = 'SALE'
      THEN '판매중'
      WHEN STATUS = 'RESERVED'
      THEN '예약중'
      WHEN STATUS = 'DONE'
      THEN '거래완료'
  END as STATUS
  FROM USED_GOODS_BOARD
  WHERE DATEDIFF(CREATED_DATE, '2022-10-05') = 0
  ORDER BY BOARD_ID DESC
  ```

  - 비교적 쉬웠다.
  - CASE WHEN THEN END에 대해서 배웠다.
  - DATEDIFF에 대해서 배웠다.

- 진료과별 총 예약 횟수 출력하기
  https://school.programmers.co.kr/learn/courses/30/lessons/132202
  ```sql
  SELECT MCDP_CD as '진료과코드', COUNT(*) as '5월예약건수' FROM APPOINTMENT
  WHERE DATE(APNT_YMD)
  BETWEEN '2022-05-01' AND DATE_ADD('2022-05-01', INTERVAL + 1 MONTH)
  # AND (APNT_CNCL_YN = 'N' OR APNT_CNCL_YN IS NULL)
  GROUP BY MCDP_CD
  ORDER BY COUNT(*) ASC, MCDP_CD ASC
  ```
  - 우선 ORDER BY에서
    ORDER BY ‘5월예약건수’ ASC, ‘진료과코드’ ASC → 이렇게 한글로 썼더니 틀렸슴니다..
  - 그리고 왜 취소한거 고려안하지…? 흠;;
  - 일단 맞췄어 한잔해~

### Level 3

- 조건에 맞는 사용자와 총 거래금액 조회하기
  https://school.programmers.co.kr/learn/courses/30/lessons/164668
  ```sql
  SELECT u.USER_ID, u.NICKNAME, SUM(PRICE) as TOTAL_SALES FROM USED_GOODS_BOARD as b
  JOIN USED_GOODS_USER as u
  on b.WRITER_ID = u.USER_ID
  WHERE STATUS = 'DONE'
  GROUP BY WRITER_ID
  HAVING TOTAL_SALES >= 700000
  ORDER BY TOTAL_SALES ASC
  ```
  - 어렵지 않았는데 그림으로 생각이 안난다.
  - 거꾸로 풀었음 → 조인안하고 먼저 70이상 구한다음 닉네임 뽑음
- 헤비 유저가 소유한 장소
  https://school.programmers.co.kr/learn/courses/30/lessons/77487
  ```sql
  SELECT * FROM PLACES
  WHERE HOST_ID IN (
      SELECT HOST_ID
      FROM PLACES
      GROUP BY HOST_ID
      HAVING COUNT(HOST_ID) >= 2
  )
  ORDER BY ID
  ```
  - 서브쿼리에 대한 공부가 많이 필요해 보입니다.
