select * from tab;
select * from student where 1=0;

select studno,name,grade from student;
select distinct grade from student;

select * from emp2 where 1=0;

select empno, name, deptno from emp2;

select * from emp order by empno asc, sal desc;
select * from emp order by deptno asc, sal desc;

-- 실행순서 : from > where > select > order by
select * from emp where hiredate > '1981-01-02';
select * from emp2 where 1=0;
select empno, position,deptno from emp2 where name = '전부장';
select * from emp2 where birthday = '1980/06/15';
select * from emp2 where birthday >= '1980/01/01';
select * from emp2 order by deptno desc;
select * from emp2 where emp_type='정규직' order by pay desc;
select empno, name, pay from emp2 where position='과장' order by birthday ;
