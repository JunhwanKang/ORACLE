-- oracle 조인
select * from emp e, dept d where e.deptno = d.deptno;
-- 표준 조인
select * from emp e inner join dept d on e.deptno = d.deptno;

select * from emp e right outer join dept d on e.deptno = d.deptno;

--사원의 사번, 이름, 부서명을 출력
select e.empno, e.ename, d.dname from emp e, dept d where e.deptno = d.deptno;
select e.empno, e.ename, d.dname from emp e inner join dept d on e.deptno = d.deptno;

-- 다른 사람을 관리하는 사원의 이름 (self join)
select distinct m.ename from emp e, emp m where e.mgr = m.empno;
select distinct m.ename from emp e inner join emp m on e.mgr = m.empno;

-- 다른 사름을 관리하는 사원의 사번, 이름, 급여 출력
select distinct m.ename, m.empno, m.sal from emp e, emp m where e.mgr = m.empno;
select m.ename, m.empno, m.sal from emp e inner join emp m on e.mgr = m.empno;
-- 다른 사람을 관리하는 사원의 평균 급여 출력
select avg(m.sal) from emp e, emp m where e.mgr = m.empno;
select avg(distinct m.sal) from emp e inner join emp m on e.mgr = m.empno;

-- 교수와 학생 테이블을 조인해 학생 이름, 교수 이름 출력
select s.name, p.name from student s inner join professor p on s.profno = p.profno;

-- 지도하는 학생이 없는 교수도 출력 : 오라클 조인은 반대쪽에 (+) 
select s.name, p.name from student s, professor p where s.profno(+) = p.profno;
select s.name, p.name from student s right outer join professor p on s.profno = p.profno;

--지도교수가 없는 학생을 포함해 출력하시요
select s.name, p.name from student s ,professor p where s.profno = p.profno(+);
select s.name, p.name from student s left outer join professor p on s.profno = p.profno;

-- 양 테이블의 모든 컬럼이 나오도록 하시오 : 오라클 조인은 불가능
select s.name, p.name from student s full outer join professor p on s.profno = p.profno;

-- 사원과 부서를 조인해 사원이 없는 부서만 출력하시오
select d.dname from emp e, dept d where e.deptno(+) = d.deptno and empno is null;
select d.dname from emp e right outer join dept d on e.deptno = d.deptno where empno is null;

-- emp2 테이블을 셀프 조인해 사번, 이름, 관리자 이름을 출력하시오.
select * from emp2;
select e.empno, e.name, e.pempno from emp2 e, emp2 p where e.pempno = p.empno;
select e.empno, e.name, e.pempno from emp2 e inner join emp2 p on e.pempno = p.empno;
-- 모든 사람 출력
select e.empno, e.name, e.pempno from emp2 e, emp2 p where e.pempno = p.empno(+);

-- 조인 : 동등조인(=)/ 비동등조인(between)/ 내부조인/ 외부조인/ 오라클조인/ 표준조인
-- 서브쿼리 : 스칼라, 인라인뷰, 서브쿼리
-- 최고급여자의 이름?
select max(sal) from emp;
select ename from emp where sal = 5000;

select ename from emp where sal = (select max(sal) from emp);

-- select 다음에 오는 서브쿼리 : scalar 서브쿼리
-- from 다음에 : inline view
-- where 다음에 : 서브쿼리

-- 최저급여자의 부서번호, 이름, 급여를 출력하시오
select deptno, ename, sal from emp where sal = (select min(sal) from emp);

-- 평균 급여보다 많이 받는 사원들의 정보 출력
select * from emp where sal > (select avg(sal) from emp);

select (select round(avg(sal),0) from emp) as avg, emp.* from emp where sal> (select avg(sal) from emp);

--'ALLEN'과 같은 부서에 근무하는 사원들을 출력
select * from emp where deptno =  (select deptno from emp where ename='ALLEN');

-- 'MANAGER' job이 존재하는 부서에 근무하는 사원 정보를 출력
select * from emp where deptno in (select deptno from emp where job='MANAGER');

-- 상관 서브 쿼리 : 메인 쿼리에서 서브 쿼리에 값을 넘기면 서브 쿼리는 그 값으로 조건 처리
-- 자신이 소속된 부서의 평균 급여보다 많이 받는 사원
select * from emp a where sal > (select avg(sal) from emp where deptno = a.deptno);

-- 자신이 속한 job의 평균 급여보다 많이 받는 사원 
select ename from emp a where sal > (select avg(sal) from emp where job = a.job);

-- 부서번호, 이름, 급여, 소속부서 평균급여를 출력하시오
select deptno, ename, sal, (select round(avg(sal), 0) from emp where deptno = a.deptno) as avg from emp a;

-- emp 테이블에서 급여 상위 3명
select * from emp where rownum <=3 order by sal desc; -- 이러면 where가 먼저 실행되서 그냥 3명이 출력됨
select * from (select * from emp order by sal desc) where rownum <=3; -- top-n 쿼리

-- emp2에서 급여 하위 5명을 출력하시오
select * from (select * from emp2 order by pay asc) where rownum <=5;

------------------------------------------------------------------------------------

-- 학생 평균키보다 큰 학생들을 조회
select * from student where height > (select avg(height) from  student);

-- 자신이 속한 학과의 평균키보다 큰 학생들을 조회
select * from student s where height > (select avg(height) from student where deptno1 = s.deptno1);

-- 보너스를 받는 교수들의 평균 급여보다 많은 급여를 받는 교수 조회
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
