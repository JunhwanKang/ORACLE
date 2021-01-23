select deptno, count(*) from emp group by deptno having count(*)>=3;
select job, count(*) from emp group by job having count(*) >= 3;

-- 직무중 가장 적게 수입을 가지는 직무의 평균 월급을 출력
select min(avg(sal)) from emp group by job;

--사원번호, 사원이름, 부서이름, 부서번호를 출력
select e.empno, e.ename, d.dname, d.deptno from emp e inner join dept d
on e.deptno = d.deptno;

select empno, ename, (select dname from dept where deptno = e.deptno) as dname from emp e;

-- 사번, 이름, 부서번호, 자신이 소속된 부서의 평균 급여를 출력
select empno, name, deptno, (select avg(pay) from emp2 where deptno = e.deptno)  as avg
from emp2 e;

--emp2, dept2 테이블에서 중복을 제거하고 부서명, 취미를 출력하시오(스칼라 서브쿼리)
select distinct dname, hobby;
 select distinct (select dname from dept2 where dcode=e.deptno) dname, hobby from emp2 e;
select * from emp2;
select * from dept;

-- emp, dept에서 부서별 인원이 가장 많은 부서의 부서명과 인원수 출력(스칼라 서브쿼리)
select (select dname from dept where deptno = e.deptno) as dname, count(*) 
from emp e 
group by dname;

select (select dname from dept where deptno=e.deptno) dname, cnt from
    (select deptno, count(*) cnt from emp group by deptno order by 2 desc) e where rownum<=1;
    
--30. emp에서 급여 상위 3등까지 사번, 이름, 부서명을 출력 (스칼라 서브쿼리)
select e.empno, e.ename, (select dname from dept where deptno = e.deptno) as dname
from emp e ,(select * from emp order by sal desc) v
where e.empno=v.empno and rownum<=3;

select e.empno, e.ename, (select dname from dept where deptno=e.deptno) as dname from emp e 
    inner join (select * from emp order by sal desc) v on e.empno=v.empno and rownum<=3; 