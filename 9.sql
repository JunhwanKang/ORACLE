-- ����¡ ����
-- top-N : ���� �, ���� �
-- ����¡ : 1~5, 6~10, 11~14

-- �̰Ŵ� ������� �����ͼ� 5���� �ڸ���.. �����Ͱ� �������� ������
select * from
    (select * from emp order by empno desc)
where rownum<=5;

-- ���ľ��� ��Ʈ�� ���ؼ� ��� ū �ͺ��� ���
select /*+ index_desc(emp pk_emp) */ * from emp;

-- top-N ����
select * from
(select /*+ index_desc(emp pk_emp) */ * from emp)
where rownum<=5;

select * from
(select /*+ index_desc(emp pk_emp) */ * from emp)
where rownum <=10 and rownum>=6;

select * from
(
    select rownum as rnum, b.* from
        (select /*+ index_desc(emp pk_emp) */ * from emp) b
    where rownum <=10
)
where rnum>=6;

-- �λ����̺��� ��ȣ �������� 21~30
select * from
(
select rownum as rnum, b.* from
(select /*+ index_desc(insa insa_pk) */ * from insa) b
where rownum<=30
)
where rnum >=21;