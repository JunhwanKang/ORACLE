select * from tab;

select * from emp where 1=0;
desc emp;

select * from user_indexes;

-- sequence : 1�� �����ϴ� �� (�Ϸù�ȣ) -> CRUD �۾��� �ʿ��ؼ� �߰��ϴ� �� -> �߿����� ���� ��
--            ���ӵ� ���� �ʿ��� ��� : select max(bno)+1 from board;
create SEQUENCE board_seq minvalue 0;
select board_seq.nextval from dual;

drop sequence board_seq;

-- distinct�� ��� �÷��� ���� ��
select distinct deptno, job from emp order by deptno;

select city, max(basicpay) from insa group by city;

-- ��Į�� (select ����, ���) , �ζ��� �� (from ����, �۾����� ����) , �������� (where ����, ����)
select * from insa where basicpay >=
(select round(avg(basicpay),1) as avg from insa);

select * from insa where name not like '��%';

select buseo, round(avg(basicpay), 1) as basicpay from insa group by buseo;

select * from insa;
select * from insa where ibsadate between '90/01/01' and '99/12/31' and city in ('����', '�λ�');

select round(avg(basicpay+sudang),1) as avg from insa where substr(ssn,8,1) = '1';

-- top-n ���� : ����Ŭ�� rownum���� ó��
-- rownum : select���� �ڵ����� �߰��Ǵ� �� ��ȣ
select * from emp where rownum<=5;

-- ���� 5�� ��� -> ���� ���������� 5�� ���� ������ ���� �� >> ������ �ٲ��� >> �ζ��κ�
select * from insa where rownum<=5 order by basicpay desc;
select * from
(select * from insa order by basicpay desc)
where rownum<=5;

-- != , <> ���� ǥ��
select * from insa where city=(select city from insa where name='�̼���')
and name <>'�̼���';


select e.empno, e.ename, e.sal, s.grade from emp e inner join salgrade s on e.sal between s.losal and s.hisal;

select e.empno, e.ename, e.sal, s.grade from emp e, salgrade s where e.sal between s.losal and s.hisal;

-- �μ���, hobby�� �ߺ��� �����ϰ� ���
-- ��Į�� �������� - ��¿�, ��� ��������
select distinct deptno, hobby from emp2;
select distinct (select dname from dept2 where dcode = e.deptno) as dname, hobby from emp2 e;

select d.dname, count(*) from emp2 e inner join dept2 d on e.deptno = d.dcode group by d.dname;

select d.dname, count(*)
from student s inner join department d on s.deptno1 = d.deptno
group by d.dname
having count(*) >=3;

select e.empno, e.deptno, m.empno, m.ename
from emp e inner join emp m on e.mgr = m.empno;

select round(avg(basicpay+sudang), 1) as avg from insa where jikwi in ('���','�븮');

select m.empno, m.ename, count(e.empno) as cnt
from emp e inner join emp m on e.mgr = m.empno group by m.empno, m.ename;

select * from (select deptno, count(*) from emp group by deptno order by 2 desc) where rownum <=1;

select (select dname from dept where deptno = e.deptno) as dname,cnt 
from (select deptno, count(*) as cnt from emp group by deptno order by 2 desc) e 
where rownum <=1;

select d.dname, cnt
from (select deptno, count(*) as cnt from emp group by deptno order by 2 desc) e
inner join dept d on e.deptno = d.deptno
where rownum<=1;

select e.empno, e.ename, d.dname from
    (select empno, ename, deptno from emp order by sal desc) e inner join dept d
    on e.deptno = d.deptno
where rownum<=3;

select e.empno, e.ename, (select dname from dept where deptno=e.deptno) as dname from
    (select empno, ename, deptno from emp order by sal desc) e 
where rownum<=3;

select * from insa where basicpay>=
(select round(avg(basicpay),1) as avg from insa where substr(ssn,8,1) = '1')
and substr(ssn,8,1)='2';

--11
select city, max(basicpay) from insa group by city;

select * from insa where basicpay>=(select round(avg(basicpay),1) from insa);

select * from insa where name not like '��%';

select buseo, round(avg(basicpay)) as avg from insa group by buseo;

select * from insa where ibsadate between '90/01/01' and '99/12/31' and city in ('����','�λ�');

select round(avg(basicpay+sudang)) as avg from 
(select * from insa where substr(ssn,8,1) = '1');

select round(avg(basicpay+sudang),1) as avg from insa where substr(ssn,8,1) = '1';

select * from
(select * from insa order by basicpay desc)
where rownum<=5;

select * from insa where city = (select city from insa where name ='�̼���')
and name<> '�̼���';

select e.empno, e.ename, e.sal, s.grade from emp e inner join salgrade s 
on e.sal between losal and hisal;

select e.empno, e.ename, e.sal, s.grade from emp e, salgrade s 
where e.sal between losal and hisal;

select * from emp2;
select * from dept2;
--20
select d.dname,e.hobby from emp2 e inner join dept2 d 
on e.deptno = d.dcode;

select d.dname, count(*) from emp2 e inner join dept2 d 
on e.deptno = d.dcode
group by d.dname;

select * from student;
select * from department;

select d.dname, count(*) from student s inner join department d 
on s.deptno1 = d.deptno
group by d.dname
having count(*) >=3;

select e.empno, e.ename, m.empno, m.ename 
from emp e inner join emp m 
on e.mgr = m.empno;

--24
select round(avg(basicpay+sudang)) as avg from insa where jikwi in ('���','�븮');

--25
select m.empno, m.ename, count(e.empno) as cnt
from emp e inner join emp m on e.mgr = m.empno group by m.empno, m.ename;

select * from (
select deptno, count(*) from emp 
group by deptno
order by 2 desc)
where rownum=1;

select d.dname, cnt
from (select deptno, count(*) as cnt from emp group by deptno order by 2 desc) e
inner join dept d on e.deptno = d.deptno
where rownum=1;

select (select dname from dept where deptno = e.deptno) as dname,cnt 
from (select deptno, count(*) as cnt from emp group by deptno order by 2 desc) e 
where rownum <=1;

select e.empno, e.ename, d.dname from
(select * from emp order by sal desc) e inner join dept d
    on e.deptno = d.deptno
where rownum <=3;

select e.empno, e.ename, (select dname from dept where deptno=e.deptno) as dname from 
(select empno, ename, deptno from emp order by sal desc) e 
where rownum<=3;

select e.empno, e.ename, (select dname from dept where deptno=e.deptno) as dname from
    (select empno, ename, deptno from emp order by sal desc) e 
where rownum<=3;
