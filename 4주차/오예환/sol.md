### Level 4

- 주문량이 많은 아이스크림들 조회하기
  https://school.programmers.co.kr/learn/courses/30/lessons/133027
  ```sql
  SELECT b.FLAVOR FROM
  (SELECT FLAVOR ,SUM(TOTAL_ORDER) as TOTAL_ORDER FROM JULY GROUP BY FLAVOR) AS b LEFT JOIN FIRST_HALF as a
  ON a.FLAVOR = b.FLAVOR
  ORDER BY (a.TOTAL_ORDER + b.TOTAL_ORDER) DESC
  LIMIT 3
  ```
  - 쉽지않았어..
  - 다른 칼럼의 값을 더하는게 생각이 안나서 엄청 헤맴 → a.TOTAL_ORDER + b.TOTAL_ORDER ;;;

### Level 3

- 카테고리 별 도서 판매량 집계하기
  https://school.programmers.co.kr/learn/courses/30/lessons/144855
  ```sql
  SELECT b.CATEGORY, SUM(a.SALES) AS TOTAL_SALES FROM
  BOOK_SALES AS a LEFT JOIN
  BOOK AS b
  ON a.book_id = b.book_id
  WHERE DATE_FORMAT(a.sales_date, '%m') = '01'
  GROUP BY b.CATEGORY
  ORDER BY b.CATEGORY ASC;
  ```
  - 1월을 체크안해서 틀렸었다. → DATE_FORMAT이라는 함수를 배웠다.
    [https://xively.tistory.com/entry/mySQL-특정-날짜-조회-mySQL-날짜만-비교해서-해당-날짜에-해당하는-값-조회하기](https://xively.tistory.com/entry/mySQL-%ED%8A%B9%EC%A0%95-%EB%82%A0%EC%A7%9C-%EC%A1%B0%ED%9A%8C-mySQL-%EB%82%A0%EC%A7%9C%EB%A7%8C-%EB%B9%84%EA%B5%90%ED%95%B4%EC%84%9C-%ED%95%B4%EB%8B%B9-%EB%82%A0%EC%A7%9C%EC%97%90-%ED%95%B4%EB%8B%B9%ED%95%98%EB%8A%94-%EA%B0%92-%EC%A1%B0%ED%9A%8C%ED%95%98%EA%B8%B0)

### Level 2

- 카테고리 별 상품 개수 구하기
  https://school.programmers.co.kr/learn/courses/30/lessons/131529
  ```sql
  SELECT LEFT(PRODUCT_CODE, 2), COUNT(*) FROM PRODUCT
  GROUP BY LEFT(PRODUCT_CODE, 2);
  ```
  - 한번에 맞을 줄 몰랐는데;;;
  - 이렇게해도 되는구나
  - 제대로된 코드인지는 잘 모르겠습니다.
