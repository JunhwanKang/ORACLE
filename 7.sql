-- oracle ����
select * from emp e, dept d where e.deptno = d.deptno;
-- ǥ�� ����
select * from emp e inner join dept d on e.deptno = d.deptno;

select * from emp e right outer join dept d on e.deptno = d.deptno;

--����� ���, �̸�, �μ����� ���
select e.empno, e.ename, d.dname from emp e, dept d where e.deptno = d.deptno;
select e.empno, e.ename, d.dname from emp e inner join dept d on e.deptno = d.deptno;

-- �ٸ� ����� �����ϴ� ����� �̸� (self join)
select distinct m.ename from emp e, emp m where e.mgr = m.empno;
select distinct m.ename from emp e inner join emp m on e.mgr = m.empno;

-- �ٸ� �縧�� �����ϴ� ����� ���, �̸�, �޿� ���
select distinct m.ename, m.empno, m.sal from emp e, emp m where e.mgr = m.empno;
select m.ename, m.empno, m.sal from emp e inner join emp m on e.mgr = m.empno;
-- �ٸ� ����� �����ϴ� ����� ��� �޿� ���
select avg(m.sal) from emp e, emp m where e.mgr = m.empno;
select avg(distinct m.sal) from emp e inner join emp m on e.mgr = m.empno;

-- ������ �л� ���̺��� ������ �л� �̸�, ���� �̸� ���
select s.name, p.name from student s inner join professor p on s.profno = p.profno;

-- �����ϴ� �л��� ���� ������ ��� : ����Ŭ ������ �ݴ��ʿ� (+) 
select s.name, p.name from student s, professor p where s.profno(+) = p.profno;
select s.name, p.name from student s right outer join professor p on s.profno = p.profno;

--���������� ���� �л��� ������ ����Ͻÿ�
select s.name, p.name from student s ,professor p where s.profno = p.profno(+);
select s.name, p.name from student s left outer join professor p on s.profno = p.profno;

-- �� ���̺��� ��� �÷��� �������� �Ͻÿ� : ����Ŭ ������ �Ұ���
select s.name, p.name from student s full outer join professor p on s.profno = p.profno;

-- ����� �μ��� ������ ����� ���� �μ��� ����Ͻÿ�
select d.dname from emp e, dept d where e.deptno(+) = d.deptno and empno is null;
select d.dname from emp e right outer join dept d on e.deptno = d.deptno where empno is null;

-- emp2 ���̺��� ���� ������ ���, �̸�, ������ �̸��� ����Ͻÿ�.
select * from emp2;
select e.empno, e.name, e.pempno from emp2 e, emp2 p where e.pempno = p.empno;
select e.empno, e.name, e.pempno from emp2 e inner join emp2 p on e.pempno = p.empno;
-- ��� ��� ���
select e.empno, e.name, e.pempno from emp2 e, emp2 p where e.pempno = p.empno(+);

-- ���� : ��������(=)/ �񵿵�����(between)/ ��������/ �ܺ�����/ ����Ŭ����/ ǥ������
-- �������� : ��Į��, �ζ��κ�, ��������
-- �ְ�޿����� �̸�?
select max(sal) from emp;
select ename from emp where sal = 5000;

select ename from emp where sal = (select max(sal) from emp);

-- select ������ ���� �������� : scalar ��������
-- from ������ : inline view
-- where ������ : ��������

-- �����޿����� �μ���ȣ, �̸�, �޿��� ����Ͻÿ�
select deptno, ename, sal from emp where sal = (select min(sal) from emp);

-- ��� �޿����� ���� �޴� ������� ���� ���
select * from emp where sal > (select avg(sal) from emp);

select (select round(avg(sal),0) from emp) as avg, emp.* from emp where sal> (select avg(sal) from emp);

--'ALLEN'�� ���� �μ��� �ٹ��ϴ� ������� ���
select * from emp where deptno =  (select deptno from emp where ename='ALLEN');

-- 'MANAGER' job�� �����ϴ� �μ��� �ٹ��ϴ� ��� ������ ���
select * from emp where deptno in (select deptno from emp where job='MANAGER');

-- ��� ���� ���� : ���� �������� ���� ������ ���� �ѱ�� ���� ������ �� ������ ���� ó��
-- �ڽ��� �Ҽӵ� �μ��� ��� �޿����� ���� �޴� ���
select * from emp a where sal > (select avg(sal) from emp where deptno = a.deptno);

-- �ڽ��� ���� job�� ��� �޿����� ���� �޴� ��� 
select ename from emp a where sal > (select avg(sal) from emp where job = a.job);

-- �μ���ȣ, �̸�, �޿�, �ҼӺμ� ��ձ޿��� ����Ͻÿ�
select deptno, ename, sal, (select round(avg(sal), 0) from emp where deptno = a.deptno) as avg from emp a;

-- emp ���̺��� �޿� ���� 3��
select * from emp where rownum <=3 order by sal desc; -- �̷��� where�� ���� ����Ǽ� �׳� 3���� ��µ�
select * from (select * from emp order by sal desc) where rownum <=3; -- top-n ����

-- emp2���� �޿� ���� 5���� ����Ͻÿ�
select * from (select * from emp2 order by pay asc) where rownum <=5;

------------------------------------------------------------------------------------

-- �л� ���Ű���� ū �л����� ��ȸ
select * from student where height > (select avg(height) from  student);

-- �ڽ��� ���� �а��� ���Ű���� ū �л����� ��ȸ
select * from student s where height > (select avg(height) from student where deptno1 = s.deptno1);

-- ���ʽ��� �޴� �������� ��� �޿����� ���� �޿��� �޴� ���� ��ȸ
select * from professor where pay > (select avg(pay) from professor where bonus is not null);

select * from emp where sal >
(select avg(distinct m.sal) from emp e inner join emp m on e.mgr = m.empno);

select empno, ename, deptno, (select avg(sal) from emp where deptno = e.deptno) from emp e;

select empno, ename, (select dname from dept where deptno = e.deptno), (select avg(sal) from emp where deptno = e.deptno)
from emp e;

select * from 
(select deptno,avg(sal) from emp group by deptno order by 1 asc) 
where rownum <= 1;

select d.dname avg from 
(select deptno, avg(sal) as avg from emp group by deptno order by 1 asc) e, dept d 
where rownum <= 1 and e.deptno = d.deptno;

select distinct p.name, p.pay from professor p inner join student s on p.profno = s. profno;

select * from professor where pay>
(select avg(distinct p.pay) from professor p inner join student s on p.profno = s. profno);
