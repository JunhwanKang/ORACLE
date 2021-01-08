-- ���� ���� : from > where > group by > having > select > order by
select * from insa;

--�ֹ� ��ȣ 8��° ���� ���
select substr(ssn, 8,1) from insa;
--�λ����̺��� ���ڸ� ��� (�ֹι�ȣ�� 1 �Ǵ� 3)
select * from insa where substr(ssn, 8, 1) in ('1','3');

-- || : ���ϱ�
select num, name, substr(ssn,1,7)||'*******' from insa;

--
select ltrim('   aaa') from dual;
select trim('   aaa   ') from dual;

--�������� ���ڿ� : varchar2
-- varchar2(10) <- aa : 'aa'

--�������� ���ڿ�
--char(10) <- aa : 'aa        ' (�ֹι�ȣ, ���̰� ������ ���ڿ�)
select round(123.456) from dual;
select round(123.456, 2) from dual;
select round(123.456, 1) from dual;
select round(123.456, 0) from dual;
select round(123.456, -1) from dual;
select round(123.456, -2) from dual;

-- type : ����, ���ڿ�, ��¥
-- ���� : number(10), number(10,2) �Ҽ����Ʒ� 2�ڸ�
-- ��¥ : date, timestamp(�Ҽ��� �ؿ� ���� �ʿ��� ���)
-- ���ڿ� : �ִ� 4000����Ʈ
    -- �������� ���ڿ� : char(10) - �������� 10���� 
    -- �������� ���ڿ� : varchar2
    -- ���ڼ���������  : nchar
    -- ���ڼ���������  : nvarchar2
-- ���������� : lob
    -- ���ڿ� ���� ������ : clob - �ִ� 4gb (����)
    -- ���� ���� ������  : blob  - x (������ �߿��� ������ �ƴϸ� �ʹ�Ŀ�� �߾Ⱦ� ,�ӵ� ������)
     -- ���� �̸��� ����...
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
    gender char(3) default '��',
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