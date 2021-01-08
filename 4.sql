-- 실행 순서 : from > where > group by > having > select > order by
select * from insa;

--주민 번호 8번째 글자 출력
select substr(ssn, 8,1) from insa;
--인사테이블에서 남자를 출력 (주민번호가 1 또는 3)
select * from insa where substr(ssn, 8, 1) in ('1','3');

-- || : 더하기
select num, name, substr(ssn,1,7)||'*******' from insa;

--
select ltrim('   aaa') from dual;
select trim('   aaa   ') from dual;

--가변길이 문자열 : varchar2
-- varchar2(10) <- aa : 'aa'

--고정길이 문자열
--char(10) <- aa : 'aa        ' (주민번호, 길이가 고정인 문자열)
select round(123.456) from dual;
select round(123.456, 2) from dual;
select round(123.456, 1) from dual;
select round(123.456, 0) from dual;
select round(123.456, -1) from dual;
select round(123.456, -2) from dual;

-- type : 숫자, 문자열, 날짜
-- 숫자 : number(10), number(10,2) 소수점아래 2자리
-- 날짜 : date, timestamp(소수점 밑에 수가 필요한 경우)
-- 문자열 : 최대 4000바이트
    -- 고정길이 문자열 : char(10) - 영문기준 10글자 
    -- 가변길이 문자열 : varchar2
    -- 글자수고정길이  : nchar
    -- 글자수가변길이  : nvarchar2
-- 대형데이터 : lob
    -- 문자열 대형 데이터 : clob - 최대 4gb (본문)
    -- 파일 대형 데이터  : blob  - x (보안이 중요한 파일이 아니면 너무커서 잘안씀 ,속도 떨어짐)
     -- 파일 이름만 저장...
create table emp01(
    empno number(4),
    ename nvarchar2(5),
    password char(60),
    sal number(7,2)
);
drop table emp01;

create table emp02(
    empno number(4) constraint emp02_pk_empno primary key,
    ename varchar2(20) not null,
    gender char(3) default '남',
    hiredate date default sysdate
);
drop table emp02;
select * from user_indexes where table_name='EMP02';
select * from user_constraints where table_name='EMP02';

create table users(
    username varchar2(10) constraint users_pk_username PRIMARY key,
    email varchar2(30),
    name nvarchar2(10)
);
drop table users;