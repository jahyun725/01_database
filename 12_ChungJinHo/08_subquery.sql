-- subquery 예시
-- '민트미역국'과 같은 카테고리의 메뉴를 모두 조회하시오
-- 1) '민트미역국'의 카테고리 찾기
select a.category_code
  from tbl_menu a
 where a.menu_name = '민트미역국';

-- 2) 카테고리가 4인 메뉴 조회하기
select a.menu_name
  from tbl_menu a
 where a.category_code = '4';

-- 3) 서브쿼리를 이용해서 한 번의 sql문으로 찾기
select b.menu_name
  from tbl_menu b
 where b.category_code = (select a.category_code
                            from tbl_menu a
                           where a.menu_name = '민트미역국')
 order
    by b.menu_name;

/* 08_subquery
   - 메인 쿼리(sql) 내에서 실행되는 보조 쿼리(select)
   - 종류 : 단일행, 다중행, 다중행, 다중열, 단일행 다중열, 스칼라, 상관, 인라인뷰
   - 서브쿼리를 위한 연산자 : exists
*/