select * from emp;

-- 시스템 테이블 (user_)
select * from user_tables;
-- 뷰: 테이블에서 자주 사용하는 일부 컬럼들에 이름을 붙임
select * from tab;
-- 내가 가진 인덱스에 대한 정보
select * from user_indexes;

select * from user_users;

-- 오류가 난다, system으로는 접속이 됨.
select * from dba_tables;

-- 사원 테이블에서 사번, 이름, 업무를 출력하시오.
select empno, ename, job from emp;
-- select문의 출력은 조건이 없다면 행의 개수(cardinality) 만큼 나온다
select 1 from emp;
--우리 회사에 무슨 업무들이 있지?
-- distint는 중복을 제거하고 읽어오는 것이 아니다
-- 읽어온 다음 중복을 제거하므로 모두 출력하는 것보다 느림
select distinct job from emp;

-- 정렬은 오름차순
select * from emp order by empno;
select * from emp order by empno asc;
select * from emp order by empno desc;
-- 정렬은 대단히 오래 걸리는 작업

-- select 컬럼 from 테이블 where 조건 order by 정렬
-- 거짓인 조건... -> 하면 컬럼명만 뽑아낼 수 있다
select * from emp where 1=0;

-- ename이 smith인 사원 정보를 조회
select * from emp where ename='SMITH';

select * from emp where empno=7369;

select * from emp where deptno=10;

select * from emp where sal>=3000;
