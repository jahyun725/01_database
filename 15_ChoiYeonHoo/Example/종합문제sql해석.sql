SELECT
    a.category_code AS '코드',
    b.category_name '카테고리명',
    AVG(a.menu_price) AS '평균금액'
FROM
    tbl_menu a
JOIN
    tbl_category b
ON
    a.category_code = b.category_code
GROUP BY
    a.category_code, b.category_name
HAVING
    AVG(a.menu_price) >= 8000
ORDER BY
    평균금액 ASC
LIMIT 0,3;

/*
1. a: tbl_menu 테이블과, b: tbl_category 테이블을
2. a의 category_code와, b의 category_code를 같은값으로 연갈한 테이블을 만들고
3. 상위 a.category_group, 하위 b.category.name으로 그루핑
4. 그룹별 메뉴 평균이 8000 이상인 그룹만 남음
5. 평균금액 오름차순으로 정렬하고
6. 상위 3개 행만 확인

-> 카테고리 코드 및 카테 명으로 그룹을 묶고 메뉴 평균 금액이 8000원이 넘는 그룹 중 싼 그룹 3종류
*/