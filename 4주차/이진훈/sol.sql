https://school.programmers.co.kr/learn/courses/30/lessons/133027
select fh.FLAVOR from FIRST_HALF fh
left join JULY j on fh.SHIPMENT_ID = j.SHIPMENT_ID
left join
(select j.SHIPMENT_ID, j2.TOTAL_ORDER as to2 from JULY j, JULY j2
where j.FLAVOR = j2.FLAVOR and j.SHIPMENT_ID != j2.SHIPMENT_ID) j2 on j.SHIPMENT_ID = j2.SHIPMENT_ID
where fh.SHIPMENT_ID = j.SHIPMENT_ID
ORDER BY fh.TOTAL_ORDER + j.TOTAL_ORDER + coalesce(j2.to2, 0) desc
limit 3

https://school.programmers.co.kr/learn/courses/30/lessons/144855
-- 코드를 입력하세요
SELECT b.CATEGORY, sum(bs.SALES) as TOTAL_SALES from BOOK b
join BOOK_SALES bs on b.BOOK_ID = bs.BOOK_ID
where '2022-01-01' <= bs.SALES_DATE and bs.SALES_DATE < '2022-02-01'
group by b.CATEGORY
ORDER BY b.CATEGORY asc

https://school.programmers.co.kr/learn/courses/30/lessons/131529
-- 코드를 입력하세요
# SELECT p.PRODUCT_CODE from PRODUCT p

SELECT SUBSTR(p.PRODUCT_CODE, 1, 2) as CATEGORY, COUNT(SUBSTR(p.PRODUCT_CODE, 1, 2)) as PRODUCTS from PRODUCT p
group by SUBSTR(p.PRODUCT_CODE, 1, 2)
order by SUBSTR(p.PRODUCT_CODE, 1, 2) asc
