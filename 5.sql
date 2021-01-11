create table emp02(
    sabun number(6) constraint emp02_pk_sabun primary key,
    -- not null 지정은 컬럼 레벨만 가능
    irum varchar2(10 char) not null,
    password char(60),
    hiredate date,
    enabled number(1)
);
-- 테이블 간의 관계  1:1 , 1:다 , 다:다
create table emp3(
    sabun number(6),
    irum varchar2(10 char),
    password char(60),
    deptno number(2),
    constraint emp3_pk_sabun primary key(sabun),
    constraint emp3_fk_deptno foreign key(deptno) references dept(deptno)
);

create table buseo(
    bno number(2) constraint buseo_pk_bno primary key,
    irum varchar2(10, char)
);

create table sawon(
    sabun number(5) constraint sawon_pk_sabun primary key,
    irum varchar2(10 char) not null,
    gender char(1) default '남',
    bno number(2) constraint sawon_fk_bno references buseo(bno) 
);

create table sawon2(
    sabun number(5),
    irum varchar2(10 char) not null,
    gender char(1) default '남',
    bno number(2) ,
    constraint sawon2_pk_sabun primary key(sabun),
    constraint sawon2_fk_bno foreign key(bno) references buseo(bno)
);

--DDL은 auto commit
--DML은 commit필요
create table test(
    num number(2),
    name varchar2(10 char),
    writedate date
);


insert into test (num,name, writerdate) values(1,'spring',sysdate);
insert into test values(2,'summer',sysdate);
insert into test (num,name) values(3,sysdate);

update test set name='winter', writedate=sysdate where num=1;
update test set name='fall', writedate=sysdate where num=2;


--group : max, min, sum, avg, count
--select 다음에

select round(avg(sal), 1)sal from emp;

--급여가 1500이상인 사원의 평균 급여
select round(avg(sal),1)sal from emp where sal>=1500;

select count(*) from emp;
select count(*) from emp where sal>=1500;
select sum(sal) from emp;
select max(sal) from emp;
select min(sal) from emp;

-- 부서별로 묶어서 평균 급여를 출력
select deptno, avg(sal) from emp group by deptno;
-- 부서별 인원수
select deptno, count(*) from emp group by deptno;
select deptno, max(sal) from emp group by deptno;

-- 부서별로 급여가 1천이상인 사원들의 평균 급여를 출력하시오 (부서번호, 평균 급여)
select deptno, avg(sal) from emp where sal>=1000 group by deptno; 

-- job별로 급여가 1000~2000인 사원들의 급여 합계를 출력하시오(부서번호, 급여합계)
select job, sum(sal) from emp where sal>=1000 and sal<=2000 group by job;
select * from emp;