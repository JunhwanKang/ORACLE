select * from tab;

select * from emp where 1=0;
desc emp;

select * from user_indexes;

-- sequence : 1씩 증가하는 값 (일련번호) -> CRUD 작업에 필요해서 추가하는 값 -> 중요하지 않은 값
--            연속된 값이 필요한 경우 : select max(bno)+1 from board;
create SEQUENCE board_seq minvalue 0;
select board_seq.nextval from dual;

drop sequence board_seq;

-- distinct는 모든 컬럼에 적용 됨
select distinct deptno, job from emp order by deptno;

select city, max(basicpay) from insa group by city;

-- 스칼라 (select 다음, 출력) , 인라인 뷰 (from 다음, 작업순서 변경) , 서브쿼리 (where 다음, 조건)
select * from insa where basicpay >=
(select round(avg(basicpay),1) as avg from insa);

select * from insa where name not like '김%';

select buseo, round(avg(basicpay), 1) as basicpay from insa group by buseo;

select * from insa;
select * from insa where ibsadate between '90/01/01' and '99/12/31' and city in ('서울', '부산');

select round(avg(basicpay+sudang),1) as avg from insa where substr(ssn,8,1) = '1';

-- top-n 쿼리 : 오라클은 rownum으로 처리
-- rownum : select에서 자동으로 추가되는 행 번호
select * from emp where rownum<=5;

-- 상위 5명 출력 -> 실행 순서때문에 5명 읽은 다음에 정렬 됨 >> 순서를 바꾸자 >> 인라인뷰
select * from insa where rownum<=5 order by basicpay desc;
select * from
(select * from insa order by basicpay desc)
where rownum<=5;

-- != , <> 같은 표현
select * from insa where city=(select city from insa where name='이순애')
and name <>'이순애';


select e.empno, e.ename, e.sal, s.grade from emp e inner join salgrade s on e.sal between s.losal and s.hisal;

select e.empno, e.ename, e.sal, s.grade from emp e, salgrade s where e.sal between s.losal and s.hisal;

-- 부서명, hobby를 중복을 제거하고 출력
-- 스칼라 서브쿼리 - 출력용, 상관 서브쿼리
select distinct deptno, hobby from emp2;
select distinct (select dname from dept2 where dcode = e.deptno) as dname, hobby from emp2 e;

select d.dname, count(*) from emp2 e inner join dept2 d on e.deptno = d.dcode group by d.dname;

select d.dname, count(*)
from student s inner join department d on s.deptno1 = d.deptno
group by d.dname
having count(*) >=3;

select e.empno, e.deptno, m.empno, m.ename
from emp e inner join emp m on e.mgr = m.empno;

select round(avg(basicpay+sudang), 1) as avg from insa where jikwi in ('사원','대리');

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

select * from insa where name not like '김%';

select buseo, round(avg(basicpay)) as avg from insa group by buseo;

select * from insa where ibsadate between '90/01/01' and '99/12/31' and city in ('서울','부산');

select round(avg(basicpay+sudang)) as avg from 
(select * from insa where substr(ssn,8,1) = '1');

select round(avg(basicpay+sudang),1) as avg from insa where substr(ssn,8,1) = '1';

select * from
(select * from insa order by basicpay desc)
where rownum<=5;

select * from insa where city = (select city from insa where name ='이순애')
and name<> '이순애';

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
select round(avg(basicpay+sudang)) as avg from insa where jikwi in ('사원','대리');

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
