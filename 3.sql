-- job�� �Ŵ����� �ƴѻ��
select * from emp where job<> 'MANAGER';

select * from emp where comm=null;
select * from emp where comm!=null;
select comm+100 from emp;

select * from emp where comm is null;
select * from emp where comm is not null;

-- �޿��� sal�� comm�� �հ��.
-- nvl(����, ������ null�϶� ����� ��)
select empno, ename, nvl(sal+comm, sal) �޿� from emp;

-- �μ���ȣ 10 �Ǵ� 20
select * from empno where deptno=10 or deptno=20;

--����� 7500�̻� 8000����
select * from emp where empno>=7500 and empno<=8000;
--1981�� �Ի���
select * from emp where hiredate>='81-1-1' and hiredate<='81-12-31';
select * from emp where hiredate between '81/01/01' and '81/12/31';

select * from emp where mgr=7698 and sal>=1500;

select * from emp where hiredate>='81-1-1' and hiredate<='81-12-31' and job='MANAGER';

-- 3.6 �μ���ȣ�� 10 �Ǵ� 20
select * from emp where deptno=10 or deptno=20;
select * from emp where deptno in (10,20);
-- �ݴ� 
select * from emp where deptno not in (10,20);

-- ���ڿ��� �����ϴ� �˻�
select * from emp where ename like 'A%';
select * from emp where ename like '��%';
select * from emp where ename like '%A%';

select ename, sal, sal*0.03 as �ҵ漼, sal*0.003 as "���� �ҵ漼"  from emp;

select empno, ename, job, hiredate from emp where hiredate='81/11/17';

select empno, hiredate, hiredate+365 as ��������� from emp;

select empno, ename, sal*1.5 as "Ư�� ���ʽ�" from emp;

select * from emp where job='MANAGER' and sal*0.03>=50;
select * from emp where job='MANAGER' and sal>=1650;
create index emp_index_sal on emp(sal);

select empno, ename, job, sal from emp where sal>=3000;

select ename, deptno from emp where empno=7499;

select ename, job, hiredate from emp where hiredate>'81/05/01' and hiredate<'81/12/31';
