-- job이 매니저가 아닌사람
select * from emp where job<> 'MANAGER';

select * from emp where comm=null;
select * from emp where comm!=null;
select comm+100 from emp;

select * from emp where comm is null;
select * from emp where comm is not null;

-- 급여는 sal와 comm의 합계다.
-- nvl(수식, 수식이 null일때 출력할 값)
select empno, ename, nvl(sal+comm, sal) 급여 from emp;

-- 부서번호 10 또는 20
select * from empno where deptno=10 or deptno=20;

--사번이 7500이상 8000이하
select * from emp where empno>=7500 and empno<=8000;
--1981년 입사자
select * from emp where hiredate>='81-1-1' and hiredate<='81-12-31';
select * from emp where hiredate between '81/01/01' and '81/12/31';

select * from emp where mgr=7698 and sal>=1500;

select * from emp where hiredate>='81-1-1' and hiredate<='81-12-31' and job='MANAGER';

-- 3.6 부서번호가 10 또는 20
select * from emp where deptno=10 or deptno=20;
select * from emp where deptno in (10,20);
-- 반대 
select * from emp where deptno not in (10,20);

-- 문자열을 포함하는 검색
select * from emp where ename like 'A%';
select * from emp where ename like '김%';
select * from emp where ename like '%A%';

select ename, sal, sal*0.03 as 소득세, sal*0.003 as "지방 소득세"  from emp;

select empno, ename, job, hiredate from emp where hiredate='81/11/17';

select empno, hiredate, hiredate+365 as 계약종료일 from emp;

select empno, ename, sal*1.5 as "특별 보너스" from emp;

select * from emp where job='MANAGER' and sal*0.03>=50;
select * from emp where job='MANAGER' and sal>=1650;
create index emp_index_sal on emp(sal);

select empno, ename, job, sal from emp where sal>=3000;

select ename, deptno from emp where empno=7499;

select ename, job, hiredate from emp where hiredate>'81/05/01' and hiredate<'81/12/31';
