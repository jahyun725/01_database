/*
전화번호가 010으로 시작하는 직원의 직원명과 전화번호를 다음과 같이 출력하세요.
출력한 결과집합 헤더의 명칭은 각각 ‘EMP_NAME’, ‘PHONE’이어야 함
전화번호는 ‘010-0000-0000’ 형식으로 출력해야 함
HINT 1
CONCAT
HINT 2
SUBSTRING
*/

SELECT
    EMP_NAME,
    CONCAT_WS(
        '-',
        SUBSTRING(phone,1,3),
        SUBSTRING(phone,4,4),
        SUBSTRING(phone,8,4)
    ) AS PHONE
FROM employee
WHERE SUBSTRING(phone,1,3) = '010';
# phone LIKE '010%';


/*
Q2.
근속 일수가 20년 이상인 직원의 직원명, 입사일, 급여를 다음과 같이 출력하세요.
단, 입사한 순서대로 출력하고 입사일이 같으면 급여가 높은 순서로 출력되도록 하세요.
DAY5: Question 2
출력한 결과집합 헤더의 명칭은 각각 ‘직원명’, ‘입사일’, ‘급여’여야 함
입사일은 ‘0000년 00월 00일’ 형식으로 출력해야 함
급여는 천 단위로 , 를 찍어 출력해야 함
HINT 1
CONCAT
HINT 2
FORMAT
HINT 3
DATE 관련 함수
HING 4
YEAR, MONTH, DAY
*/
SELECT
    EMP_NAME AS '직원명',
    CONCAT(YEAR(HIRE_DATE),'년',
           MONTH(HIRE_DATE),'월',
           DAY(HIRE_DATE),'일') AS '입사일',
    FORMAT(SALARY,0) AS '급여'
FROM
    employee
WHERE
    HIRE_DATE < SUBDATE(CURDATE(), INTERVAL 20 YEAR)
ORDER BY HIRE_DATE ASC, SALARY DESC;

-- SELECT '2010-02-06' < SUBDATE(CURDATE(), INTERVAL 20 YEAR) - CURDATE(): 시스템 상의 시간을 따라감
