-- 페이징 쿼리
-- top-N : 상위 몇개, 하위 몇개
-- 페이징 : 1~5, 6~10, 11~14

-- 이거는 모든행을 가져와서 5개를 자른다.. 데이터가 많을수록 느려짐
select * from
    (select * from emp order by empno desc)
where rownum<=5;

-- 정렬없이 힌트를 통해서 사번 큰 것부터 출력
select /*+ index_desc(emp pk_emp) */ * from emp;

-- top-N 쿼리
select * from
(select /*+ index_desc(emp pk_emp) */ * from emp)
where rownum<=5;

select * from
(select /*+ index_desc(emp pk_emp) */ * from emp)
where rownum <=10 and rownum>=6;

select * from
(
    select rownum as rnum, b.* from
        (select /*+ index_desc(emp pk_emp) */ * from emp) b
    where rownum <=10
)
where rnum>=6;

-- 인사테이블에서 번호 역순으로 21~30
select * from
(
select rownum as rnum, b.* from
(select /*+ index_desc(insa insa_pk) */ * from insa) b
where rownum<=30
)
where rnum >=21;