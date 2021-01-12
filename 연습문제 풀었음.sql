select deptno, count(*) as 저급여자 from emp where sal<1500 group by deptno;

select deptno, job, count(*) from emp group by deptno, job order by job asc;

--2.6 연습하기
select * from tab;

select * from student where 1=0;

select studno, name, grade from student;

select distinct grade from student;

select * from emp2 where 1=0;

select empno, name, deptno from emp2;

-- 2.12 연습하기

select empno, name, position, deptno from emp2 where name='전부장';

select * from emp2 where birthday='1980-06-15';

select * from emp2 where birthday>='1980-01-01';

select * from emp2 order by empno desc;

select * from emp2 where emp_type='정규직' order by pay desc;

select empno, name, pay from emp2 where position='과장' order by birthday;

-- 3.9 연습하기

select ename, sal, sal*0.03 as 소득세, sal*0.003 as 지방세 from emp;

select empno, ename, job, hiredate from emp where hiredate = '1981-11-17';

select empno, ename, sal, sal*0.03+sal*0.003 as 세금합계 from emp;

select empno, hiredate, hiredate+365 as 계약종료일 from emp;

select empno, ename, sal*1.5 as "특별 보너스" from emp;

select * from emp where mgr=7698 or sal>=1500;

select * from emp where hiredate >= '1981-01-01' and hiredate <= '1981-12-31';

select * from emp where job='MANAGER' and sal*0.033>=50;

-- 연습문제 1

select empno, ename, job, sal from emp where sal>=3000;

select ename, deptno from emp where empno = 7499;

select ename, job, hiredate from emp where hiredate >= '1981-07-01' and hiredate <= '1981-12-31';

select * from emp where deptno = 10 or deptno = 20 order by ename;

select ename, sal, deptno from emp where sal>=1500 and deptno in(10, 30);

select ename, deptno, sal from emp where sal>=1500 and deptno != 20;

select * from emp where hiredate >= '1981-01-01' and hiredate <='1981-12-31';

select * from emp where comm is not null;

select empno, ename, nvl(sal+comm, sal) as 수령액 from emp;

select empno, ename, nvl(sal+comm, sal)*12 as 연봉 from emp;

select ename, sal, comm from emp where nvl(comm,0)>=sal*1.1;

select ename, sal, comm from emp where comm>=sal*1.1;

select * from emp where job='CLERK' or job='ANALYST' and sal not in (1000,3000,5000);

select * from emp where ename like '%L%L%' and (deptno=30 or mgr=7782);

-- 연습문제 2

select * from insa where 1=0;

select name, basicpay from insa;

select name, basicpay, sudang, basicpay+sudang from insa;

select name, city, buseo from insa;

select name, city, buseo, jikwi from insa where city='서울';

select * from insa where city='인천' and basicpay between 1000000 and 2000000;

select * from insa where city='서울' or buseo='개발부';

select * from insa where city in ('서울', '경기');

select * from insa where buseo in ('개발부', '영업부');

select * from insa where basicpay+sudang>=2500000;

select * from student where 1=0;

select name, height from student where grade=1 order by height;

select ename from emp where ename like '%T';

select ename from emp where ename not like '_M%';

select ename, comm from emp where comm is not null;

select ename, hiredate from emp where hiredate='1981-12-03';

select first_name||' '||last_name 이름, nvl(salary+commission_pct*salary, salary) 실수령액 from employees;

-- 연습 문제 3

select * from insa;

select num, name, buseo from insa where jikwi='부장';

select num, basicpay from insa where ibsadate='1998-10-11';

select * from insa order by basicpay desc;

select num, name, buseo, basicpay from insa order by ibsadate;

select distinct jikwi from insa;

select buseo from insa order by buseo;

select num, name, buseo, jikwi from insa order by basicpay+sudang;

select * from insa where basicpay+sudang>2000000;

select name, buseo from insa where jikwi='부장' and city='서울' and basicpay>='2000000';

select * from insa where (city='서울' and basicpay>=2000000) or city='인천';

select name, buseo from insa where jikwi='과장' and city='서울' and basicpay>=2000000;

select * from insa where ibsadate between '2001-01-01' and '2001-12-31';

select * from insa where name like '김%' and basicpay>=1500000 order by ibsadate;

select * from insa where ibsadate>'2000-12-31';

select * from insa where tel is null;

-- 4.연습문제 

select name, ssn from insa where substr(ssn,8,1)=1;

select name, ssn from insa where substr(SSN,0,1)=8;

select name, jikwi from insa where city='서울' and substr(ssn,0,1)=7;

select * from student;

select name, tel, substr(tel,0,3) as 지역번호 from student where deptno1 = 101;

select name, tel, substr(tel,1, instr(tel,')')-1)  as 지역번호 from student where deptno1 = 101;

select distinct substr(buseo,1, instr(buseo,'부')-1) from insa;

select name, city from insa where city='서울' and name like '김%';

select name, city, ibsadate from insa where substr(ibsadate, 1, 2)=00;

select name, city, ibsadate from insa where substr(ibsadate, 1, 5)='00/10';

select replace(name,substr(name,1,1),'#') from student;

select name, ssn, substr(ssn,1,2)-20 as 나이 from insa;

select * from insa where substr(ssn,1,2)-20>40;

select * from insa where substr(ssn,3,2)=5;

-- 근무년수

select ename, hiredate, hiredate+365 as 재계약일 from emp;

select num, name, round((basicpay+sudang)*0.033,-3) from insa;

select name, replace(tel,substr(tel,10,4),'****') as 전화번호, buseo, basicpay from insa where substr(ssn,8,1)=2 order by buseo, basicpay asc; 

select ename, hiredate, sal*12 as 연봉, sal*12*1.1 as "인상 후 연봉" from emp;

select ename, hiredate, nvl((sal+comm)*12,sal*12) as 연봉 from emp order by sal*12 desc;

select count(ename) from emp;
-- null은 카운트 안한다
select count(comm) from emp;

select count(*) from emp;

-- 연습문제 

select job,max(sal) from emp group by job;

select deptno, count(*) as 저급여자 from emp where sal<15000 group by deptno;

select deptno, job, count(*) from emp group by deptno, job order by job asc; 

select deptno, round(avg(sal),2) from emp where sal>=1000 group by deptno;

select deptno, round(avg(sal),2) from emp group by deptno having round(avg(sal),2)>=2000;

select count(comm) from emp;

-- 연습하기

select hobby, count(*) from emp2 group by hobby;

select * from professor where 1=0;

select max(pay), min(pay), round(avg(pay)) from emp2;

select emp_type, round(avg(pay)) from emp2 group by emp_type;

select position, round(avg(pay)) from professor where bonus is not null  group by position; 

select count(*) from student where deptno2 is not null; 

select count(*) from student where substr(tel,1,3)=031;

select deptno from emp2 group by deptno having count(*)>=2;

select * from professor;

select count(*) from professor where position='조교수' and hpage is not null;

select * from student where 1=0;

select count(*) from student where substr(tel,1,2)=02 and substr(jumin,8,1) =1;

