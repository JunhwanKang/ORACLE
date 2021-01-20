select * from emp2;

--�����ں��� ���� �޴� ���
select e.ename
from emp e inner join emp m on e.mgr = m.empno
where e.sal>m.sal;

-- �ڽ��� �����ϴ� ������� ���� �޴� ������
select m.ename
from emp e inner join emp m on e.mgr = m.empno
where e.sal>m.sal;

-- �׷��Լ� : count(*), avg(), sum(), min(), max()
-- null�� ���� �� ��
select count(comm) from emp;
select avg(comm), sum(comm), count(comm) from emp;

select round(avg(sal),1) as avg from emp group by deptno;

-- group by ���� ������ �÷��� select ������ ����� �� �ִ�.
select round(avg(sal),1) as avg from emp group by deptno;

/*
select distinct, *, �÷���, �׷��Լ�
from ���̺���� ���� ����
where : 1. ������ �������� ���ϴ� ���� ���͸�, 2. �׷��Լ��� ����ϴ� ������ �� �� ����
group by : ����
having : �׷��Լ��� ������� �ʴ� ���Ǹ� �� �� �ִ�
order by : ����
*/

select avg(sal) from emp where sal>=2000 group by deptno;

-- �������� 
    -- ����� ���� : ������ ��������(��� �Ѱ�), ������ ��������[in, not in, exists, not exists](��� ������)
    -- ��ġ�� ���� : ��Į��(select ����), �ζ��κ�(from ����), ��������(where ����)
    -- ���������� �ܵ� ����Ǵ��� : ��������, ��� ��������
select ename from emp where empno = (select mgr from emp where ename = 'SMITH');

select ename from emp where sal>
    (select sal from emp where ename = 'ALLEN');
 
 select empno, ename from emp where job =    
(select job from emp where empno = 7900);

select * from emp where sal>
(select round(avg(sal),1) from emp);

--�ڽ��� ���� �μ��� ��� �޿����� ���� �޴� ���
select * from emp e where sal>
(select round(avg(sal),1) from emp where deptno = e.deptno10);

-- ��Į��� �����ϱ�
select d.dname, e.empno, e.ename from emp e inner join dept d on e.deptno = d.deptno;
select (select dname from dept where deptno = e.deptno) dname, e.empno, e.ename from emp e;

-- ���, �̸�, �μ� ��� �޿�
select empno, ename, (select round(avg(sal),1) from emp where deptno = e.deptno) as avg from emp e;

-- smith�� ������ �̸�
select m.ename from emp e, emp m where e.mgr = m.empno and e.ename='SMITH' and rownum = 1;
select ename from emp where empno = (select mgr from emp where ename = 'SMITH');
select (select ename from emp where empno = e.mgr) as mgr from emp e where ename = 'SMITH' and rownum = 1;