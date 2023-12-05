https://school.programmers.co.kr/learn/courses/30/lessons/77487
-- 코드를 입력하세요
SELECT PLACES.ID, PLACES.NAME, PLACES.HOST_ID FROM PLACES
INNER JOIN (SELECT * FROM PLACES
GROUP BY HOST_ID
HAVING COUNT(HOST_ID) >= 2) AS htab
ON PLACES.HOST_ID = htab.HOST_ID
ORDER BY PLACES.ID;

https://school.programmers.co.kr/learn/courses/30/lessons/164668
-- 코드를 입력하세요
SELECT ugb.writer_id as user_id, ugu.nickname, SUM(ugb.price) as TOTAL_SALES from USED_GOODS_BOARD ugb
join USED_GOODS_USER ugu on ugb.writer_id = ugu.user_id
where ugb.status = 'DONE'
group by writer_id
having SUM(ugb.price) >= 700000
order by SUM(ugb.price) asc

https://school.programmers.co.kr/learn/courses/30/lessons/157342
-- 코드를 입력하세요 (fail)
SELECT CAR_ID, ROUND(AVG(DATEDIFF(END_DATE, START_DATE)),1) as AVERAGE_DURATION from CAR_RENTAL_COMPANY_RENTAL_HISTORY
group by CAR_ID
having ROUND(AVG(DATEDIFF(END_DATE, START_DATE)),1) >= 7
ORDER BY ROUND(AVG(DATEDIFF(END_DATE, START_DATE)),1) DESC, CAR_ID DESC


https://school.programmers.co.kr/learn/courses/30/lessons/164672
-- 코드를 입력하세요
SELECT BOARD_ID, WRITER_ID, TITLE, PRICE, 
case when ugb.STATUS = 'SALE' then '판매중'
when ugb.STATUS = 'RESERVED' then '예약중'
when ugb.STATUS = 'DONE' then '거래완료'
end as 'STATUS'
from USED_GOODS_BOARD ugb
where CREATED_DATE = '2022-10-05'
ORDER BY BOARD_ID DESC

https://school.programmers.co.kr/learn/courses/30/lessons/132202 
-- 코드를 입력하세요
SELECT MCDP_CD as '진료과코드', count(MCDP_CD) as '5월예약건수' from appointment
where '2022-05-01' <= apnt_ymd and apnt_ymd < '2022-06-01'
group by MCDP_CD
order by count(MCDP_CD) asc, MCDP_CD asc

https://school.programmers.co.kr/learn/courses/30/lessons/131697
-- 코드를 입력하세요
SELECT max(price) as MAX_PRICE from product

https://school.programmers.co.kr/learn/courses/30/lessons/59415
-- 코드를 입력하세요
SELECT MAX(DATETIME) from animal_ins

https://school.programmers.co.kr/learn/courses/30/lessons/132201
-- 코드를 입력하세요
SELECT pt_name, pt_no, gend_cd, age, 
case when tlno is null then 'NONE'
ELSE tlno 
end as TLNO
from patient
where age <= 12 and gend_cd = 'W'
order by age desc, pt_name asc

https://school.programmers.co.kr/learn/courses/30/lessons/59039
-- 코드를 입력하세요
SELECT animal_id from animal_ins
where name is null
order by animal_id asc

https://school.programmers.co.kr/learn/courses/30/lessons/133024
-- 코드를 입력하세요
SELECT flavor from first_half
order by total_order desc, shipment_id asc
