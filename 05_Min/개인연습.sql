-- tbl_menu에서 메뉴명(menu_name)과 가격(menu_price)을 조회하세요.

SELECT
    menu_name,menu_price
FROM
    tbl_menu;

-- tbl_menu에서 가격이 5,000원 이상인 메뉴를 조회하세요.

SELECT
    menu_price
FROM
    tbl_menu
WHERE
    menu_price >= 5000;

-- tbl_menu에서 주문 가능한(Y) 메뉴의 이름을 가격 오름차순으로 정렬해서 조회하세요.

SELECT
    menu_name,menu_price,orderable_status
FROM
    tbl_menu
WHERE
    orderable_status = 'Y';

-- tbl_menu에서 메뉴 가격이 7,000원 이상이고,주문 불가능한(N) 메뉴를 조회하세요.

SELECT
    menu_name,menu_price,orderable_status
FROM
    tbl_menu
WHERE
    menu_price >= 7000 && orderable_status = 'N';
-- tbl_category에서 상위 카테고리가 없는 (ref_category_code IS NULL) 카테고리의 이름을 조회하세요.

SELECT
    category_name,ref_category_code
FROM
    tbl_category
WHERE
    ref_category_code IS NULL;

-- tbl_menu에서 가격이 8,000원 이상이거나 카테고리 코드가 10번인 메뉴를가격 내림차순으로 정렬하세요.

SELECT
    menu_price,menu_name,category_code
FROM
    tbl_menu
WHERE menu_price >= 8000 || category_code = '10'
ORDER BY
    category_code DESC;
-- tbl_menu에서 중복되지 않는 카테고리 코드(category_code)를 조회하세요.

SELECT
    distinct category_code
FROM
    tbl_menu;

-- tbl_menu에서 가격이 가장 비싼 메뉴 3개만 조회하세요.

SELECT
    *
FROM
    tbl_menu
ORDER BY
    menu_price DESC
LIMIT 3;

-- tbl_menu에서 메뉴 이름에 '빵'이 포함된 메뉴를 가격 오름차순으로 조회하세요.

SELECT
    menu_name,menu_price
FROM
    tbl_menu
WHERE
    menu_name LIKE '%빵%'
ORDER BY
    menu_price ASC;

-- tbl_menu에서 카테고리 코드가 4, 6, 10번 중 하나이고,가격이 7,000원 이상인 메뉴를 가격 오름차순으로 조회하세요.

SELECT
    category_code,menu_price,menu_name
FROM
    tbl_menu
WHERE
    (category_code = '4' || category_code = '6' || category_code = '10') && menu_price >= 7000
ORDER BY
    menu_price ASC;

-- tbl_menu에서 가격이 10,000원 이하이거나 주문 불가능한(N) 메뉴 중,메뉴명이 ‘떡’으로 끝나는 메뉴를 조회하세요.

SELECT menu_price,
       orderable_status,
       menu_name
FROM tbl_menu
WHERE (menu_price <= 10000 OR orderable_status = 'N') AND menu_name LIKE '%떡';


-- tbl_menu에서 메뉴명에 ‘김치’가 포함되지 않은 메뉴를가격 내림차순으로 5개만 조회하세요.

SELECT
    menu_name,menu_price
FROM
    tbl_menu
WHERE
    menu_name NOT LIKE '%김치%'
ORDER BY
    menu_price DESC
LIMIT 5;