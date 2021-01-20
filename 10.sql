select * from emp2;

--관리자보다 많이 받는 사원
select e.ename
from emp e inner join emp m on e.mgr = m.empno
where e.sal>m.sal;

-- 자신이 관리하는 사원보다 적게 받는 관리자
select m.ename
from emp e inner join emp m on e.mgr = m.empno
where e.sal>m.sal;

-- 그룹함수 : count(*), avg(), sum(), min(), max()
-- null은 포함 안 함
select count(comm) from emp;
select avg(comm), sum(comm), count(comm) from emp;

select round(avg(sal),1) as avg from emp group by deptno;

-- group by 절에 지정한 컬럼만 select 다음에 출력할 수 있다.
select round(avg(sal),1) as avg from emp group by deptno;

/*
select distinct, *, 컬럼들, 그룹함수
from 테이블들의 조인 조건
where : 1. 조건을 만족하지 못하는 행을 필터링, 2. 그룹함수를 사용하는 조건을 걸 수 없다
group by : 묶기
having : 그룹함수를 사용하지 않는 조건만 걸 수 있다
order by : 정렬
*/

select avg(sal) from emp where sal>=2000 group by deptno;

-- 서브쿼리 
    -- 결과에 따라 : 단일행 서브쿼리(결과 한개), 다중행 서브쿼리[in, not in, exists, not exists](결과 여러개)
    -- 위치에 따라 : 스칼라(select 다음), 인라인뷰(from 다음), 서브쿼리(where 다음)
    -- 서브쿼리가 단독 실행되느냐 : 서브쿼리, 상관 서브쿼리
select ename from emp where empno = (select mgr from emp where ename = 'SMITH');

select ename from emp where sal>
    (select sal from emp where ename = 'ALLEN');
 
 select empno, ename from emp where job =    
(select job from emp where empno = 7900);

select * from emp where sal>
(select round(avg(sal),1) from emp);

--자신이 속한 부서의 평균 급여보다 많이 받는 사람
select * from emp e where sal>
(select round(avg(sal),1) from emp where deptno = e.deptno10);

-- 스칼라로 변경하기
select d.dname, e.empno, e.ename from emp e inner join dept d on e.deptno = d.deptno;
select (select dname from dept where deptno = e.deptno) dname, e.empno, e.ename from emp e;

-- 사번, 이름, 부서 평균 급여
select empno, ename, (select round(avg(sal),1) from emp where deptno = e.deptno) as avg from emp e;

-- smith의 관리자 이름
select m.ename from emp e, emp m where e.mgr = m.empno and e.ename='SMITH' and rownum = 1;
select ename from emp where empno = (select mgr from emp where ename = 'SMITH');
select (select ename from emp where empno = e.mgr) as mgr from emp e where ename = 'SMITH' and rownum = 1;