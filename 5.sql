create table emp02(
    sabun number(6) constraint emp02_pk_sabun primary key,
    -- not null ������ �÷� ������ ����
    irum varchar2(10 char) not null,
    password char(60),
    hiredate date,
    enabled number(1)
);
-- ���̺� ���� ����  1:1 , 1:�� , ��:��
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
    gender char(1) default '��',
    bno number(2) constraint sawon_fk_bno references buseo(bno) 
);

create table sawon2(
    sabun number(5),
    irum varchar2(10 char) not null,
    gender char(1) default '��',
    bno number(2) ,
    constraint sawon2_pk_sabun primary key(sabun),
    constraint sawon2_fk_bno foreign key(bno) references buseo(bno)
);

--DDL�� auto commit
--DML�� commit�ʿ�
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
--select ������

select round(avg(sal), 1)sal from emp;

--�޿��� 1500�̻��� ����� ��� �޿�
select round(avg(sal),1)sal from emp where sal>=1500;

select count(*) from emp;
select count(*) from emp where sal>=1500;
select sum(sal) from emp;
select max(sal) from emp;
select min(sal) from emp;

-- �μ����� ��� ��� �޿��� ���
select deptno, avg(sal) from emp group by deptno;
-- �μ��� �ο���
select deptno, count(*) from emp group by deptno;
select deptno, max(sal) from emp group by deptno;

-- �μ����� �޿��� 1õ�̻��� ������� ��� �޿��� ����Ͻÿ� (�μ���ȣ, ��� �޿�)
select deptno, avg(sal) from emp where sal>=1000 group by deptno; 

-- job���� �޿��� 1000~2000�� ������� �޿� �հ踦 ����Ͻÿ�(�μ���ȣ, �޿��հ�)
select job, sum(sal) from emp where sal>=1000 and sal<=2000 group by job;
select * from emp;