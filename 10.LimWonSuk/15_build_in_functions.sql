/*
 15_ BUILD IN FUNCTION(내장 함수)
 */

 /*
  01. 문자열 함수
  ASCII('문자') : 문자의 아스키 코드 번호 반환
  CHAR(아스키코드): - 아스키 코드의 문자 번호 반환
  */
SELECT ASCII('A'), CHAR(65);
/*
02.BIT_LENGTH(문자열), CHAR_LENGTH(문자열), LENGTH(문자열)
BIT_LENGTH: 할당된 비트 크기 반환
CHAR_LENGTH: 문자열의 길이 반환
LENGTH: 할당된 BYTE 크기 반환
 */
SELECT BIT_LENGTH('pie'),
       CHAR_LENGTH('pie'),
       LENGTH('pie');
SELECT
    menu_name,
       BIT_LENGTH(menu_name),
       CHAR_LENGTH(menu_name),
       LENGTH(menu_name)
from tbl_menu;

SELECT BIT_LENGTH('pie'),
       CHAR_LENGTH('pie'),
       LENGTH('pie');
-- CHAR_LENGTH 가 6이하인 애들만
SELECT
    menu_name,
       BIT_LENGTH(menu_name),
       CHAR_LENGTH(menu_name),
       LENGTH(menu_name)
from tbl_menu
WHERE CHAR_LENGTH(menu_name) <= 6;

/*
 03.WS '' 사이에있는걸넣겠다
 CONCAT: 문자열을 이어붙임
CONCAT_WS: 구분자와 함께 문자열을 이어붙임
 */
SELECT CONCAT('호랑이', '기린', '토끼');

SELECT CONCAT_WS(',', '호랑이', '기린', '토끼');

SELECT CONCAT_WS('-', '2023', '05', '31');

/*
 ELT: 해당 위치의 문자열 반환
FIELD: 찾을 문자열 위치 반환
FIND_IN_SET: 찾을 문자열의 위치 반환
INSTR: 기준 문자열에서 부분 문자열의 시작 위치 반환
LOCATE: INSTR과 동일하고 순서는 반대
 */
 SELECT
       ELT(2, '사과', '딸기', '바나나')
     , FIELD('딸기', '사과', '딸기', '바나나')
     , FIND_IN_SET('바나나', '사과,딸기,바나나') -- 사=0, 과=1, ,=2 ,딸=3
     , INSTR('사과딸기바나나', '딸기') -- 기준문자열 안에서 '딸기'와 같은것의 위치
     , LOCATE('딸기', '사과딸기바나나');


/*
 FORMAT: 1000단위마다 콤마(,) 표시를 해 주며 소수점 아래 자릿수(반올림)까지 표현한다.
 */
 SELECT FORMAT(123142512521.5635326, 3); -- 3째 자리마다 ',' 를 찍어라

 /*
  BIN: 2진수 표현
 OCT: 8진수 표현
 HEX: 16진수 표현
  */
SELECT BIN(65), OCT(65), HEX(65);

/*
 INSERT: 기준 문자열의 위치부터 길이만큼을 지우고 삽입할 문자열을 끼워 넣는다.
 */
 SELECT INSERT('내 이름은 아무개입니다.', 7, 3, '홍길동'); -- 7부터 3칸을 '홍길동'으로 바꿔라

 /*
  LEFT: 왼쪽에서 문자열의 길이만큼을 반환
RIGHT: 오른쪽에서 문자열의 길이만큼을 반환
  */
SELECT LEFT('Hello World!', 3), RIGHT('Hello World!', 3); -- 'Hello World!' 에서 왼쪽에서 3글자 , 'Hello World!' 에서 오른쪽으로 3글자

/*
 UPPER: 소문자를 대문자로 변경
LOWER: 대문자를 소문자로 변경
 */
SELECT LOWER('Hello World!'), UPPER('Hello World!');

/*
 LPAD: 문자열을 길이만큼 왼쪽으로 늘린 후에 빈 곳을 문자열로 채운다.
RPAD: 문자열을 길이만큼 오른쪽으로 늘린 후에 빈 곳을 문자열로 채운다.
 */
 SELECT LPAD('왼쪽', 6, '@'), RPAD('오른쪽', 6 ,'@'); -- 문자열 끝부터 오른쪽사이에 @를 채워넣겠다

 /*
  LTRIM: 왼쪽 공백 제거
RTRIM: 오른쪽 공백 제거
  */
SELECT LTRIM('    왼쪽'), RTRIM('오른쪽    '); -- 공백을 제거 조회결과 더블클릭

/*
 TRIM: TRIM은 기본적으로 앞뒤 공백을 제거하지만 방향
 (LEADING(앞), BOTH(양쪽), TRAILING(뒤))이 있으면 해당 방향에 지정한 문자열을 제거할 수 있다.
 */
SELECT TRIM('    MySQL    '), TRIM(BOTH '@' FROM '@@@@MySQL@@@@'); 공백과 @ 를 제거
SELECT LTRIM('    MySQL    '), TRIM(BOTH '@' FROM '@@@@MySQL@@@@'); 공백과 @ 를 제거

/*
REPEAT: 문자열을 횟수만큼 반복
 */
 SELECT REPEAT('재밌어', 3);

/*
 REPLACE: 문자열에서 문자열을 찾아 치환(뒤집다)
 */
 SELECT REPLACE('마이SQL', '마이', 'My');

/*
 REVERSE: 문자열의 순서를 거꾸로 뒤집음
 */
 SELECT REVERSE('stressed');

/*
 SPACE: 길이 만큼의 공백을 반환
 */
SELECT CONCAT('제 이름은', SPACE(5), '이고 나이는', SPACE(3), '세입니다.');

/*
 SUBSTRING: 시작 위치부터 길이만큼의 문자를 반환(길이를 생략하면 시작 위치부터 끝까지 반환)
 */
 SELECT SUBSTRING('안녕하세요 반갑습니다.', 7, 2), SUBSTRING('안녕하세요 반갑습니다.', 7);

/*
 SUBSTRING_INDEX: 구분자가 왼쪽부터 횟수 번째 나오면 그 이후의 오른쪽은 버린다. 횟수가 음수일 경우 오른쪽부터 세고 왼쪽을 버린다.
 */
 SELECT SUBSTRING_INDEX('hong.test@gmail.com', '.', 2), SUBSTRING_INDEX('hong.test@gmail.com', '.', -2);
-- .을 기준으로 잡고 찾은후 그 뒤에있는걸 지운다

/*
 02. 숫자 관련 함수
 */

/*
 ABS(숫자)
 ABS: 절대값 반환
 */
SELECT ABS(-123);

/*
 CEILING: 올림값 반환
FLOOR: 버림값 반환
ROUND: 반올림값 반환
 */

SELECT CEILING(1234.56), FLOOR(1234.56), ROUND(1234.56);

SELECT  FLOOR(-123.4), ROUND(-123.4);

/*
 CONV(숫자, 원래 진수, 변환할 진수)
 CONV: 원래 진수에서 변환하고자 하는 진수로 변환
 */
 SELECT CONV('A', 16, 10), CONV('A', 16, 2), CONV(1010, 2, 8);

/*
MOD(숫자1, 숫자2) 또는 숫자1 % 숫자2 또는 숫자1 MOD 숫자2
MOD: 숫자 1을 숫자 2로 나눈 나머지 추출
 */
 SELECT MOD(75, 10), 75 % 10, 75 MOD 10;

/*
 POW(숫자1, 숫자2), SQRT(숫자)
POW: 거듭제곱값 추출
SQRT: 제곱근을 추출
 */
 SELECT POW(2, 4), SQRT(16);

/*
 RAND: 0이상 1 미만의 실수를 구한다.
'm <= 임의의 정수 < n'을 구하고 싶다면
FLOOR((RAND() * (n - m) + m)을 사용한다.
1부터 10까지 난수 발생: FLOOR(RAND() * (11 - 1) + 1)
 */
 SELECT  RAND();
 SELECT RAND(), FLOOR(RAND() * (11 - 1) + 1);
 SELECT RAND(), FLOOR(RAND() * 11);

/*
 SIGN: 양수면 1, 0이면 0, 음수면 -1을 반환
 */
 SELECT SIGN(10.1), SIGN(0), SIGN(-10.1);

/*
 TRUNCATE: 소수점을 기준으로 정수 위치까지 구하고 나머지는 버림
 */
 SELECT TRUNCATE(12345.12345, 2), TRUNCATE(12345.12345, -2); -- .을 기준으로 나머지를 버리겠다 '-'일경우 반대방향

-- (3) 날짜/시간 관련 함수

-- adddate, subdate 날자를 더하거나 뺄때 사용
SELECT
       ADDDATE('2023-05-31', INTERVAL 30 DAY)
     , ADDDATE('2023-05-31', INTERVAL 6 MONTH)
     , ADDDATE('2023-05-31', INTERVAL 1 YEAR)
     , SUBDATE('2023-05-31', INTERVAL 30 DAY)
     , SUBDATE('2023-05-31', INTERVAL 6 MONTH)
     , SUBDATE('2023-05-31', INTERVAL 1 YEAR);

-- addtime, subtime
SELECT
       ADDTIME('2023-05-31 09:00:00', '1:0:1') -- 1:0:1 = 1시간 1초
     , SUBTIME('2023-05-31 09:00:00', '1:0:1');

-- 현재 시스템 날짜/시간 반환
SELECT CURDATE(), CURRENT_DATE(), CURRENT_DATE;
SELECT CURTIME(), CURRENT_TIME(), CURRENT_TIME;
SELECT NOW(), LOCALTIME, LOCALTIME(), LOCALTIMESTAMP, LOCALTIMESTAMP();

-- year, month, dayofmonth
SELECT YEAR(CURDATE()), MONTH(CURDATE()), DAYOFMONTH(CURDATE());
-- hour, minute, second, microsecond = 1,000,000
SELECT HOUR(CURTIME()), MINUTE(CURTIME()), SECOND(CURTIME()),
MICROSECOND(CURTIME(6));
-- date, time
SELECT DATE(NOW()), TIME(NOW());

-- datediff, timediff (diff = 차이)
SELECT DATEDIFF('2023-05-31', '2023-02-27')
     , TIMEDIFF('17:07:11', '13:06:10');

-- dayofweek, monthname, dayofyear
SELECT DAYOFWEEK(CURDATE()), MONTHNAME(CURDATE()), DAYOFYEAR(CURDATE());

-- last_day
SELECT LAST_DAY('2023-02-01');
SELECT ADDDATE(LAST_DAY('2023-02-01'), INTERVAL 1 DAY);
-- SELECT ADDDATE(LAST_DAY('2023-02-01'),INTERVAL 1 DAY ;

-- makedate, maketime
SELECT MAKEDATE(2023, 32), MAKETIME(17, 03, 02);

-- quarter
SELECT QUARTER('2023-05-01');

-- time_to_sec
SELECT TIME_TO_SEC('1:1:1'); -- 이 시간을 초단위로 바꾸겠다