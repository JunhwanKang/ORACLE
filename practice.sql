select deptno, count(*) from emp group by deptno having count(*)>=3;
select job, count(*) from emp group by job having count(*) >= 3;

-- ������ ���� ���� ������ ������ ������ ��� ������ ���
select min(avg(sal)) from emp group by job;

--�����ȣ, ����̸�, �μ��̸�, �μ���ȣ�� ���
select e.empno, e.ename, d.dname, d.deptno from emp e inner join dept d
on e.deptno = d.deptno;

select empno, ename, (select dname from dept where deptno = e.deptno) as dname from emp e;

-- ���, �̸�, �μ���ȣ, �ڽ��� �Ҽӵ� �μ��� ��� �޿��� ���
select empno, name, deptno, (select avg(pay) from emp2 where deptno = e.deptno)  as avg
from emp2 e;

--emp2, dept2 ���̺��� �ߺ��� �����ϰ� �μ���, ��̸� ����Ͻÿ�(��Į�� ��������)
select distinct dname, hobby;
 select distinct (select dname from dept2 where dcode=e.deptno) dname, hobby from emp2 e;
select * from emp2;
select * from dept;

-- emp, dept���� �μ��� �ο��� ���� ���� �μ��� �μ���� �ο��� ���(��Į�� ��������)
select (select dname from dept where deptno = e.deptno) as dname, count(*) 
from emp e 
group by dname;

select (select dname from dept where deptno=e.deptno) dname, cnt from
    (select deptno, count(*) cnt from emp group by deptno order by 2 desc) e where rownum<=1;
    
--30. emp���� �޿� ���� 3����� ���, �̸�, �μ����� ��� (��Į�� ��������)
select e.empno, e.ename, (select dname from dept where deptno = e.deptno) as dname
from emp e ,(select * from emp order by sal desc) v
where e.empno=v.empno and rownum<=3;

select e.empno, e.ename, (select dname from dept where deptno=e.deptno) as dname from emp e 
    inner join (select * from emp order by sal desc) v on e.empno=v.empno and rownum<=3; 