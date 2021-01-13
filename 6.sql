select * from dept;

select emp.empno, emp.ename, emp.sal, dept.loc from emp,dept where emp.deptno=dept.deptno;

select e.empno, e.ename, e.sal, d.loc from emp e, dept d where e.deptno=d.deptno;

select d.deptno, d.dname, d.loc, count(*) from emp e, dept d where e.deptno=d.deptno group by d.deptno, d.dname, d.loc;

select * from student;
select * from professor;

select s.name, p.name from student s, professor p where s.profno=p.profno;

select p.name, p.position, count(*) from professor p, student s where s.profno=p.profno group by p.name,p.position;

select p.position, count(*) from professor p, student s where p.profno=s.profno group by p.position;

select * from department;

select dname,studno,s.name
from department d, professor p, student s
where d.deptno=p.deptno and p.profno=s.profno;

select d.dname, count(*) from department d, student s, professor p 
where d.deptno = p.deptno and p.profno = s.profno group by d.dname;

-- ���ڰ��а��� ���� ���� �л��� �й�, �̸�, �г�, ��ȭ��ȣ

select s.studno, s.name, s.grade, s.tel from student s, department d, professor p where d.deptno=p.deptno and p.profno=s.profno
and d.dname='���ڰ��а�';

--������ȣ, �����̸�, ����, �а���, �����ϴ� �л��� ����

select p.profno, p.name, p.position, d.dname, count(*) from professor p, student s, department d
where d.deptno=p.deptno and p.profno = s.profno group by p.profno, p.name, p.position, d.dname;