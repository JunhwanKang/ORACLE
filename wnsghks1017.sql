select * from emp;

-- �ý��� ���̺� (user_)
select * from user_tables;
-- ��: ���̺��� ���� ����ϴ� �Ϻ� �÷��鿡 �̸��� ����
select * from tab;
-- ���� ���� �ε����� ���� ����
select * from user_indexes;

select * from user_users;

-- ������ ����, system���δ� ������ ��.
select * from dba_tables;

-- ��� ���̺��� ���, �̸�, ������ ����Ͻÿ�.
select empno, ename, job from emp;
-- select���� ����� ������ ���ٸ� ���� ����(cardinality) ��ŭ ���´�
select 1 from emp;
--�츮 ȸ�翡 ���� �������� ����?
-- distint�� �ߺ��� �����ϰ� �о���� ���� �ƴϴ�
-- �о�� ���� �ߺ��� �����ϹǷ� ��� ����ϴ� �ͺ��� ����
select distinct job from emp;

-- ������ ��������
select * from emp order by empno;
select * from emp order by empno asc;
select * from emp order by empno desc;
-- ������ ����� ���� �ɸ��� �۾�

-- select �÷� from ���̺� where ���� order by ����
-- ������ ����... -> �ϸ� �÷��� �̾Ƴ� �� �ִ�
select * from emp where 1=0;

-- ename�� smith�� ��� ������ ��ȸ
select * from emp where ename='SMITH';

select * from emp where empno=7369;

select * from emp where deptno=10;

select * from emp where sal>=3000;
