/*
 03_where
 - 테이블에서 특정 조건에 맞는 레코드(행, row)만 선택하는 구문
 - 조건을 나타내기 위한 각종 연산자를 사용
 */

-- 1. 비교 연산자(=. !=, <>, <, >, <=, >=)

-- [=] : 값이 일치하는지 확인
SELECT menu_name, menu_price, orderable_status  -- 3
  FROM tbl_menu                                 -- 1
 where orderable_status = 'y'                   -- 2
  order by menu_name asc;                       -- 4


-- 이름이 붕어빵초밥인 메뉴 조회
SELECT *  -- 3
  FROM tbl_menu                                 -- 1
 where menu_name = '붕어빵초밥'                   -- 2

-- 메뉴 가격이 13000인 메뉴의 메뉴명, 가격을 가격 내림 차순으로 조회
SELECT *
 FROM tbl_menu
 where menu_price = 13000
order by menu_name desc;

-- [!=, <>]  : 값이 일치하지 않음

-- 주문가능상태가 'y'가ㅣ 아닌 메뉴의 메뉴코드, 메뉴명 , 주문가능상태를 메뉴명 오름차순으로 정렬
SELECT *
FROM tbl_menu
where orderable_status != 'Y'
order by menu_name;

SELECT *
FROM tbl_menu
where orderable_status <> 'Y'
order by menu_name;

-- 대소 비교(초과, 미만, 이상, 이하)
-- 메뉴 가격이 20000원 초과인 메뉴의 메뉴명, 가격
-- 메뉴코드 내림차순으로 조회

SELECT  menu_name, menu_price
FROM tbl_menu
where menu_price > 20000
order by menu_code desc;


-- 대소 비교(초과, 미만, 이상, 이하)
-- 메뉴 가격이 20000원 이상인 메뉴의 메뉴명, 가격
-- 메뉴코드 내림차순으로 조회

SELECT  menu_name, menu_price
FROM tbl_menu
where menu_price >= 20000  # 복합기호에서는 등호가 오른쪽
order by menu_code desc;

-- 대소 비교(초과, 미만, 이상, 이하)
-- 메뉴 가격이 20000원 이하인 메뉴의 메뉴명, 가격
-- 메뉴코드 내림차순으로 조회

SELECT menu_name, menu_price
FROM tbl_menu
where menu_price < 20000 # 복합기호에서는 등호가 오른쪽
order by menu_code desc;


-- 초과 <-> 이하
-- 미만 <-> 이상


/*
 2. 논리 연산자
  논리란? 참(True), 거짓(false)를 나타내는 단어
 */

# A AND B : A와 B 모두 참(TRUE)인 경우 결과가  참(TRUE)
#                 나머지는 모두 거짓

-- 주문가능한 상태이며, 카테고리 코드가 10에 해당하는 메뉴만 조회
SELECT *
FROM tbl_menu
WHERE orderable_status ='Y'
AND category_code =10;

/*
 메뉴가격이 5000원 초과이면서 카테고리 번호가 10인 메뉴의
 메뉴코드, 메뉴명, 카테고리 코드조회
 메뉴코드 오름차순으로 조회
 */

 SELECT menu_name, menu_code, category_code
 from tbl_menu
 where menu_price > 5000
 AND category_code = 10
 order by menu_code;

/*
 메뉴 가격이 5000원 이상, 20000원 미만
 메뉴의 메뉴 이름, 메뉴 가격을
 메뉴가격 오름차순으로 조회
 */

SELECT menu_name, menu_price
FROM tbl_menu
where menu_price >= 5000
AND menu_price < 20000
order by menu_price;

/*
 메뉴 가격이 5000원 이상, 20000원 미만
 카테고리 코드가 10 인것만
 메뉴의 메뉴 이름, 메뉴 가격을
 메뉴가격 오름차순으로 조회
 */


SELECT menu_name, menu_price, category_code
FROM tbl_menu
where menu_price >= 5000
AND menu_price < 20000
AND category_code = 10
order by menu_price;


/*
  A OR B
    - 둘 다 FALSE 인경우에만 결과가 FALSE
    - 하나라도 TRUE이면 TRUE
 */

-- 주문 가능한 상태 이거나
-- 카테고리 코드가 10인 메뉴를 모두 조회

SELECT * FROM tbl_menu
where orderable_status ='Y'
OR category_code = 10;

/*
 메뉴 가격이 5000원 이상, 20000원 미만
 메뉴의 메뉴 이름, 메뉴 가격을
 메뉴가격 오름차순으로 조회
 */

SELECT menu_name, menu_price
FROM tbl_menu
where menu_price < 5000
OR menu_price >= 20000
order by menu_price;

/*
 AND, OR 연산 중 우선순위는
 AND가 높다!
 */


SELECT * FROM tbl_menu
WHERE category_code = 4
OR menu_price = 9000
AND menu_code > 10;



SELECT * FROM tbl_menu
WHERE  menu_price = 9000
AND menu_code > 10;

SELECT * FROM tbl_menu
WHERE (category_code = 4
OR menu_price = 9000)
AND menu_code > 6;


